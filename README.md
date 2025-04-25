
Praktikum 1

Soal 1

-> Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

-> Gantilah warna tema aplikasi sesuai kesukaan Anda.

-> Lakukan commit hasil jawaban Soal 1 dengan pesan "P1: Jawaban Soal 1"

![take1](./images/p1s1.png)

Soal 2

-> Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.

-> Lakukan commit hasil jawaban Soal 2 dengan pesan "P1: Jawaban Soal 2"

![take2](./images/p1s2.png)


Soal 3

-> Jelaskan fungsi keyword yield* pada kode tersebut!

Jawaban :

Keyword yield* digunakan untuk meneruskan (forward) hasil dari stream lain ke dalam stream ini. Dalam kode tersebut, yield* menyalurkan data dari Stream.periodic secara langsung sebagai bagian dari stream yang dihasilkan oleh getColors().

-> Apa maksud isi perintah kode tersebut?

Jawaban :

Kode tersebut menghasilkan stream warna yang berubah setiap 1 detik. Dengan Stream.periodic, setiap detik akan dihasilkan satu warna dari daftar colors, dimulai dari indeks 0 dan mengulang terus (dengan t % colors.length) agar warnanya bergantian secara siklus.

-> Lakukan commit hasil jawaban Soal 3 dengan pesan "P1: Jawaban Soal 3"

Soal 4

-> Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

-> Lakukan commit hasil jawaban Soal 4 dengan pesan "P1: Jawaban Soal 4"

![take](./images/p1s4.gif)


Soal 5

-> Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

Jawaban :
Perbedaan listen dan await for adalah pada cara mereka menangani stream. listen digunakan untuk mendaftarkan callback yang akan dijalankan setiap kali stream mengeluarkan data, dan tidak perlu berada di dalam fungsi async secara langsung. Sedangkan await for digunakan untuk mengiterasi stream secara asynchronous, jadi harus berada di dalam fungsi async, dan akan menunggu setiap data stream secara berurutan. Keduanya bisa digunakan untuk stream, tapi await for lebih cocok jika kita ingin menunggu dan memproses data satu per satu secara sinkron.

-> Lakukan commit hasil jawaban Soal 5 dengan pesan "P1: Jawaban Soal 5"