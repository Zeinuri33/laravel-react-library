<?php
// Izinkan akses CORS untuk frontend
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/xml');

// Target URL DSpace Lokal
$url = 'http://192.168.88.203:8111/rest/items?expand=metadata';

// Gunakan cURL untuk mengambil data
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_TIMEOUT, 30);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Accept: application/xml'
]);

$response = curl_exec($ch);
$httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

if(curl_errno($ch) || $httpcode !== 200) {
    http_response_code(500);
    echo '<error>Gagal terhubung ke API DSpace lokal.</error>';
} else {
    // Keluarkan hasil XML langsung ke browser
    echo $response;
}

curl_close($ch);
?>
