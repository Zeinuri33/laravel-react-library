<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UploadImageController extends Controller
{
    public function __invoke(Request $request)
    {
        $request->validate([
            'image' => [
                'required',
                'image',
                'max:5120',
            ],
        ]);

        $path = $request
            ->file('image')
            ->store('dokumentasi', 'public');

        return response()->json([
            'url' => Storage::url($path),
        ]);
    }
}