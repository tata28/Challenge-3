Proyek ini adalah challenge ke 3 dari bootcamp backend engineering yang diadakan oleh binar. Proyek ini menggunakan database PostgreSQL.

File 'create_and_insert.sql' merupakan file yang berisi query untuk membuat database 'banking_system'. Terdapat 4 entity, yaitu nasabah, akun, jenis_akun, dan transaksi.

Hubungan antar entity:

1. Nasabah : akun = 1 : N
- 1 nasabah bisa mempunyai banyak akun, namun setiap akun hanya dimiliki 1 nasabah.

2. Jenis_akun : akun = 1 : N
- 1 jenis akun bisa dimiliki oleh beberapa akun, namun setiap akun hanya memiliki 1 jenis_akun

3. Akun : transaksi = 1 : N
- 1 akun bisa melakukan beberapa transaksi, namun setiap transaksi hanya bisa dilakukan oleh 1 akun