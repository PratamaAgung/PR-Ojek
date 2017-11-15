# Tugas 2 IF3110 Pengembangan Aplikasi Berbasis Web
### Group HaveFun 
Faiz Ghifari Haznitrama/13515010, Jehian Norman Saviero/13515139, Pratamamia Agung P/13515142

-----------
### Overview
Melakukan *upgrade* Website ojek online sederhana pada Tugas 1 dengan mengaplikasikan **arsitektur web service REST dan SOAP**.

### Arsitektur Umum Server
![Gambar Arsitektur Umum](arsitektur_umum.png)

#### Setup Environment
**Identity Service**
Untuk menjalankan identity service, diperlukan konfigurasi database dan virtual server pada Glassfish.
Untuk melakukan konfigurasi database, buatlah sebuah database dengan nama `ojek_season2`. Database ini mempunyai 2 buah tabel, yaitu `users` dan `user_token`. Tabel `user` mempunyai 3 kolom, yaitu `ID`, `username`, dan `password`. Tabel `user_token` mempunyai 4 kolom, yaitu `ID`, `user_id`, `token`, dan `time`.
Untuk melakukan setup virtual server, pertama-tama perlu dinyalakan server glassfish terlebih dahulu. Kemudian, masuk ke halaman admin dari glassfish, default-nya berada pada URL 
```
http://localhost:4848
``` 
Kemudian, masuk ke menu *Configurations->server_config->Virtual Servers*. Buatlah suatu instance virtual server baru dengan suatu nama yang unik, misalkan `IdentityService`. Langkah selanjutnya adalah membuat http-listener untuk virtual server tersebut. Hal tersebut dapat dilakukan dengan mengeksekusi command berikut
```
asadmin create-http-listener --listeneraddress 127.0.0.1 --listenerport <port> --defaultvs <nama virtual server> --servername host1.sun.com --acceptorthreads 100 --securityenabled=false --enabled=true <nama http listener>
```
Command tersebut akan membuat suatu http-listener pada port yang telah diberikan pada argumen. Kemudian, kembali lagi ke admin page dari glassfish, ubah *Network Listener* dari virtual server yang telah dibuat agar menuju ke http-listener yang baru dibuat. Finally, virtual server telah selesai dikonfigurasi dan siap digunakan untuk deploy aplikasi Identity Service.

#### Penjelasan Aplikasi
**Basis data dari sistem yang Anda buat**
Terdapat 2 basis data yang kami gunakan dalam pengerjaan tugas ini.
    1. `ojek_season2`
Basis data `ojek_season2` ini merupakan basis data yang digunakan oleh IdentityService secara khusus untuk melakukan validasi token, login, register/signup, dan logout. Hanya ada 2 tabel, yaitu `users` dan `user_token`. `Users` memiliki atribut ID, username, password, dan email. Tabel `users` digunakan untuk melakukan validasi login dan pengecekan register/signup. Tabel `user_token` digunakan untuk menggenerate token setiap akun dan juga melakukan validasi token serta reset token baik ketika logout (time di set menjadi 0) maupun renew. 
    2. `pr-ojek`
Basis data ini meliputi seluruh data yang digunakan pada web app, dan diakses secara khusus oleh web service dengan protokol SOAP. Terdapat 3 tabel yaitu `driver_locations` , `transactions`, dan `user`. Tabel `user` berisi informasi user seperti biasanya, `driver_locations` menyimpan preferred locations dari tiap user, dan `transactions` untuk menyimpan data-data order.

**Konsep shared session dengan menggunakan REST**
Pada dasarnya REST merupakan sebuah web service yang menyediakan keterhubungan antara computer system dengan internet, dengan beberapa set operasi yang stateless. Implementasi token pada arsitektur REST yang digunakan pada tugas besar ini, memunculkan konsep shared session sebagai bentuk komunikasi antara client dan server. Token bertindak sebagai session yang unik bagi setiap user dan mengatur lamanya komunikasi yang terbentuk antara client dan server. Pada tugas ini, juga terdapat penyedia web service dengan protocol SOAP, yang juga berhubungan dengan client. Maka token yang disediakan oleh REST, selain digunakan oleh client, juga digunakan oleh protokol SOAP untuk melakukan validasi pada token yang diberikan oleh client sehingga dapat dipastikan token yang memanggil fungsi atau prosedur melalui servlet merupakan token yang masih aktif

**Pembangkitan token dan expire time pada sistem yang anda buat**
Token dibangkitkan oleh IdentityService dengan menggunakan pembangkitan string random (UUID: Universally Unique Identifier) , id_user, dan timestamp tepat saat token dibuat. Expiry time dari setiap token yang baru dibuat adalah `30 menit`. Setiap terjadi aktivitas oleh client baik yang berhubungan dengan IdentityService maupun web service melalui protokol SOAP, token akan divalidasi terlebih dahulu apakah sudah melewati expire time atau belum. Setiap ada aktivitas, maka expiry token akan diperbaharui kembali. 

**Kelebihan dan kelemahan dari arsitektur aplikasi tugas ini, dibandingkan dengan aplikasi monolitik (login, CRUD DB, dll jadi dalam satu aplikasi)**
Kelebihan : Jelas menggunakan arsitektur REST API dan protokol SOAP membuat software ini menjadi lebih lossly coupled dibandingkan dengan tugas sebelumnya. Service-service yang terpisah dari web app membuat perubahan service tidak memberikan pengaruh yang signifikan pada web app. Dibandingkan dengan aplikasi monolitik, arsitektur ini menawarkan software yang berdependensi rendah sehingga stabil dan tidak sulit untuk me-maintain software tersebut dalam jangka yang cukup panjang, ditambah dengan performansi dan reliability yang baik.
Kekurangan : Karena setiap bagian software mempunyai bagian masing-masing yang berbeda satu sama lain, perlu adanya penyesuaian ketika melakukan passing parameter dari suatu file ke lainnya. Tidak adanya aturan baku dalam melakukan passing parameter membuat banyak sekali terjadi perubahan bentuk variabel ketika berpindah file. Kemudian meskipun memiliki performansi yang cukup tinggi dikarenakan pembuatan process / thread baru untuk setiap session yang terbentuk, sewaktu-waktu akan terjadi overhead pada resource penunjangnya. Sehingga hal ini perlu dipertimbangkan

### Pembagian Tugas
Pembagian tugas seperti berikut ini.

REST :
1. DB Connection : 13515142
2. Register Manager & Handler  : 13515010
3. Login Manager & Handler : 13515142
4. Query Manager, Token Manager, Validate Handler : 13515142
5. Logout Manager & Handler : 13515139

SOAP :
1. Database Method (Connection, query, etc) : 13515139
2. User Method : 13515010
3. Driver Method : 13515142

Web app (JSP) :
1. Login, Register/Signup, Profile, EditProfile, EditPrefLoc : 13515010
2. HistoryDriver, HistoryOrder, Logout : 13515142
3. MakeOrder : 13515139

## About

HaveFun | Kelas 01
13515010 | 13515139 | 13515142