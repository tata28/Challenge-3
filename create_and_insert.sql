CREATE TABLE nasabah (
    id_nasabah serial PRIMARY KEY,
    nama varchar(255),
    umur int,
    alamat varchar(255),
    tempat_lahir varchar(255),
    tanggal_lahir timestamp,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp,
    deleted_at timestamp
);

CREATE TABLE akun (
    id_akun SERIAL PRIMARY KEY,
    id_nasabah INT NOT NULL,
    id_jenis_akun INT,
    saldo DOUBLE PRECISION,
    jenis_akun INT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    deleted_at TIMESTAMP
);

CREATE TABLE jenis_akun (
    id_jenis_akun serial PRIMARY KEY,
    biaya_admin DOUBLE PRECISION,
    saldo_minimum DOUBLE PRECISION
);

CREATE TABLE transaksi (
    id_transaksi SERIAL PRIMARY KEY,
    id_akun INTEGER,
    jenis_transaksi INTEGER,
    nominal_transaksi DOUBLE PRECISION,
    created_at TIMESTAMP DEFAULT NOW(),
    deleted_at TIMESTAMP DEFAULT NULL
);

-- adding foreign key constraints

-- 1 nasabah : n akun
ALTER TABLE akun
	ADD CONSTRAINT fk_akun_nasabah FOREIGN KEY (id_nasabah) REFERENCES nasabah (id_nasabah);

-- 1 akun : n transaksi
 ALTER TABLE transaksi
 	ADD CONSTRAINT fk_transaksi_akun FOREIGN KEY (id_akun) REFERENCES akun (id_akun);

-- 1 jenis_akun : n akun
ALTER TABLE akun
  	ADD CONSTRAINT fk_akun_jenis_akun FOREIGN KEY (id_jenis_akun) REFERENCES jenis_akun (id_jenis_akun);

-- populate tables

-- populate table 'nasabah'
INSERT INTO nasabah (nama, umur, alamat, tempat_lahir, tanggal_lahir)
VALUES
  ('Robin Schulz', 30, '123 Main Street', 'Cityville', '1993-05-15 08:30:00'),
  ('Beyonce', 50, '234 Second Street', 'Cityville', '1990-05-15 08:30:00'),
  ('Tate McRae', 28, '321 Third Street', 'Cityville', '1870-06-01 08:30:00'),
  ('Taylor Swift', 29, '456 Main Street', 'Cityville', '1999-08-27 08:30:00'),
  ('Alle Farben', 21, '456 Elm Street', 'Townsville', '2002-02-20 15:45:00');

-- populate table 'jenis_akun'
INSERT INTO jenis_akun(biaya_admin, saldo_minimum)
VALUES
	(17000, 50000),
	(7000, 2500);

-- populate table 'akun'
INSERT INTO akun(id_nasabah, id_jenis_akun, saldo, jenis_akun)
VALUES
	(1, 1, 0, 1),
	(2, 1, 0, 1),
	(2, 2, 0, 1),
	(3, 1, 0, 1),
	(5, 2, 0, 1);

-- populate table 'transaksi'
 INSERT INTO transaksi(id_akun, jenis_transaksi, nominal_transaksi)
 VALUES
 (1, 1, 50000),
	(1, 2, 25000),
	(2, 1, 100000),
	(3, 1, 300000),
	(5, 1, 20000);

-- check population
SELECT * FROM akun;
SELECT * FROM jenis_akun;
SELECT * FROM nasabah;
SELECT * FROM transaksi;
SELECT * FROM akun a JOIN transaksi t ON a.id_akun = t.id_akun;

-- alter table 
ALTER TABLE akun DROP COLUMN jenis_akun;

-- indexing
CREATE INDEX nasabah_yg_punya_akun ON akun(id_nasabah);
SELECT id_nasabah FROM akun; 

-- update row using soft delete 
UPDATE nasabah SET deleted_at=CURRENT_TIMESTAMP, updated_at=CURRENT_TIMESTAMP WHERE id_nasabah=4;
SELECT * FROM nasabah;





