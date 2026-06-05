<?php

namespace App\Http\Controllers;

use App\Models\Usulan;
use Illuminate\Http\Request;

class UsulanController extends Controller
{
    //
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama'   => ['required', 'string', 'max:255'],
            'kontak' => ['required', 'string', 'max:255'],
            'subjek' => ['nullable', 'string', 'max:255'],
            'pesan'  => ['required', 'string'],
        ]);

        $usulan = Usulan::create($validated);

        $token = 'CtBuHqwhxLBH4zAPsJcn';

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.fonnte.com/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',

            CURLOPT_POSTFIELDS => array(
                // MULTI NOMOR
                'target'  => '085117351997,085111661997',

                'message' =>
'📩 *PEMBERITAHUAN USULAN BARU PERPUSTAKAAN*

Assalamu’alaikum warahmatullahi wabarakatuh.

Yth. Admin Layanan Perpustakaan,

Dengan hormat, telah diterima sebuah usulan/pesan baru melalui formulir layanan pada website Digital Library Perpustakaan Ibrahimy dengan detail sebagai berikut:

━━━━━━━━━━━━━━━━━━c
*_Nama Pengirim:_*  
' . $request->nama . '

*_Kontak WhatsApp:_*  
' . $request->kontak . '

*_Subjek Pesan:_*  
' . ($request->subjek ?? '-') . '

*_Isi Pesan_*  
' . $request->pesan . '

*_Waktu Pengiriman_*  
' . now()->format('d M Y H:i') . ' WIB

*ID Usulan*  
#' . $usulan->id . '
━━━━━━━━━━━━━━━━━━

Silakan memberikan tindak lanjut atau balasan kepada pengirim melalui tautan berikut:

' . url('/usulan/' . $usulan->id . '/jawab') . '

Demikian pemberitahuan ini disampaikan. Atas perhatian dan kerja samanya kami ucapkan terima kasih.

Wassalamu’alaikum warahmatullahi wabarakatuh.

ⓘ Pesan ini dikirim secara otomatis melalui Apliasi Layanan Digital Library Perpustakaan Ibrahimy.
🌐 www.digilib.ibrahimy.ac.id'
            ),

            CURLOPT_HTTPHEADER => array(
                'Authorization: ' . $token
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);

        return back()->with(
            'success',
            'Alhamdulillah, usulan berhasil dikirim.'
        );
    }

    public function index()
    {
        $usulans = Usulan::latest()->get();

        return inertia('usulan/page', [
            'usulans' => $usulans,
        ]);
    }

    public function jawab(Usulan $usulan)
    {
        return inertia('usulan/jawab', [
            'usulan' => $usulan,
        ]);
    }

    public function kirimJawaban(Request $request, Usulan $usulan)
    {
        $validated = $request->validate([
            'jawaban' => ['required', 'string'],
        ]);

        $usulan->update([
            'jawaban' => $validated['jawaban'],
        ]);

        $token = 'CtBuHqwhxLBH4zAPsJcn';

        $nomor = preg_replace('/[^0-9]/', '', $usulan->kontak);

        $curl = curl_init();

        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://api.fonnte.com/send',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => array(
            'target' => $nomor,
            'message' =>
'📚 *Tanggapan Layanan Perpustakaan*
Assalamu’alaikum warahmatullahi wabarakatuh.
Yth. ' . $usulan->nama . ',

Terima kasih telah menghubungi layanan perpustakaan.
Berikut tanggapan atas pesan/usulan yang Anda kirimkan:
━━━━━━━━━━━━━━━━━━
*_Subjek:_*
' . ($usulan->subjek ?? '-') . '
*_Pesan Anda:_*
' . $usulan->pesan . '

*_Jawaban Admin:_*
' . $validated['jawaban'] . '
━━━━━━━━━━━━━━━━━━
Semoga informasi yang disampaikan dapat membantu.
Wassalamu’alaikum warahmatullahi wabarakatuh.

ⓘ Pesan ini dikirim secara otomatis melalui Apliasi Layanan Digital Library Perpustakaan Ibrahimy.
🌐 www.digilib.ibrahimy.ac.id',
            ),

            CURLOPT_HTTPHEADER => array(
                'Authorization: ' . $token
            ),
        ));

        curl_exec($curl);

        curl_close($curl);

        return redirect('/usulan-list')->with(
            'success',
            'Jawaban berhasil dikirim.'
        );
    }

    public function detail(Usulan $usulan)
    {
        return inertia('usulan/detail', [
            'usulan' => $usulan,
        ]);
    }


    public function destroy(Usulan $usulan)
    {
        $usulan->delete();

        return back()->with(
            'success',
            'Usulan berhasil dihapus.'
        );
    }

}
