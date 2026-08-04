<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Client\Pool;

class RepositoryController extends Controller
{
    private string $baseUrl = 'http://192.168.88.203:8111/rest';

    public function search(Request $request)
    {
        try {
            $keyword = strtolower(trim($request->input('q', '')));
            $keywords = array_filter(preg_split('/\s+/', $keyword));

            $cacheKey = 'onesearch_repo_' . md5($keyword);
            $cached = Cache::get($cacheKey);

            if ($cached) {
                return response()->json($cached);
            }

            // 1. Ambil semua koleksi
            $collectionsResponse = Http::timeout(30)
                ->withHeaders(['Accept' => 'application/json'])
                ->get("{$this->baseUrl}/collections");

            if (!$collectionsResponse->successful()) {
                return response()->json(['status' => 'error', 'message' => 'Gagal mengambil collections']);
            }

            $collections = $collectionsResponse->json();

            // 2. Ambil item dari tiap koleksi secara paralel
            $responses = Http::pool(function (Pool $pool) use ($collections) {
                foreach ($collections as $collection) {
                    $pool->withHeaders(['Accept' => 'application/json'])
                         ->timeout(60)
                         ->get("{$this->baseUrl}/collections/{$collection['uuid']}/items", [
                             'limit' => 100,
                             'offset' => 0,
                         ]);
                }
            });

            $allItems = [];

            foreach ($collections as $index => $collection) {
                $itemsResponse = $responses[$index] ?? null;
                $items = $itemsResponse && $itemsResponse->successful() ? $itemsResponse->json() : [];

                if (!is_array($items)) continue;

                // 3. Ambil metadata tiap item secara paralel
                $metaResponses = Http::pool(function (Pool $pool) use ($items) {
                    foreach ($items as $item) {
                        $itemUuid = $item['uuid'] ?? $item['UUID'] ?? null;
                        if ($itemUuid) {
                            $pool->withHeaders(['Accept' => 'application/json'])
                                 ->timeout(20)
                                 ->get("{$this->baseUrl}/items/{$itemUuid}/metadata");
                        }
                    }
                });

                foreach ($items as $itemIndex => &$item) {
                    $metaResponse = $metaResponses[$itemIndex] ?? null;

                    $item['abstract'] = '';
                    $item['author'] = '';
                    $item['year'] = '';

                    if ($metaResponse && $metaResponse->successful()) {
                        $metadata = $metaResponse->json();

                        foreach ($metadata as $meta) {
                            $key = $meta['key'] ?? '';
                            $val = $meta['value'] ?? '';

                            if ($key === 'dc.description.abstract') {
                                $item['abstract'] = strip_tags($val);
                            }
                            if ($key === 'dc.contributor.author') {
                                $item['author'] = $item['author'] === '' ? $val : $item['author'] . ' || ' . $val;
                            }
                            if ($key === 'dc.date.issued') {
                                $item['year'] = substr($val, 0, 4);
                            }
                        }
                    }

                    $title = strtolower($item['name'] ?? '');
                    $handle = strtolower($item['handle'] ?? '');
                    $abstract = strtolower($item['abstract'] ?? '');

                    $searchText = $title . ' ' . $handle . ' ' . $abstract;
                    $matched = true;

                    foreach ($keywords as $word) {
                        if (!str_contains($searchText, $word)) {
                            $matched = false;
                            break;
                        }
                    }

                    if (empty($keywords) || $matched) {
                        $allItems[] = [
                            ...$item,
                            'collection_name' => $collection['name'],
                            'collection_uuid' => $collection['uuid'],
                        ];
                    }
                }
            }

            $result = [
                'status' => 'success',
                'total_items' => count($allItems),
                'results' => array_values($allItems),
            ];

            Cache::put($cacheKey, $result, now()->addMinutes(20));

            return response()->json($result);

        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 500);
        }
    }
}
