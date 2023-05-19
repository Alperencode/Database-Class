CREATE TABLE Kullanicilar (
kullanici_id INTEGER PRIMARY KEY,
ad TEXT,
soyad TEXT,
email TEXT,
kayit_tarihi DATE
);

CREATE TABLE Etiketler (
etiket_id INTEGER PRIMARY KEY,
ad TEXT
);

CREATE TABLE Sorular (
soru_id INTEGER PRIMARY KEY,
baslik TEXT,
icerik TEXT,
olusturma_tarihi DATE,
kullanici_id INTEGER,
FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id)
);

CREATE TABLE EtiketSorular (
soru_id INTEGER,
etiket_id INTEGER,
FOREIGN KEY (soru_id) REFERENCES Sorular(soru_id),
FOREIGN KEY (etiket_id) REFERENCES Etiketler(etiket_id),
PRIMARY KEY (soru_id, etiket_id)
);

CREATE TABLE Oylar (
oy_id INTEGER PRIMARY KEY,
kullanici_id INTEGER,
soru_id INTEGER,
yanit_id INTEGER,
deger INTEGER,
FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id),
FOREIGN KEY (soru_id) REFERENCES Sorular(soru_id),
FOREIGN KEY (yanit_id) REFERENCES Yanitlar(yanit_id)
);

CREATE TABLE KullaniciRolleri (
rol_id INTEGER PRIMARY KEY,
ad TEXT
);

CREATE TABLE SoruResimleri (
resim_id INTEGER PRIMARY KEY,
soru_id INTEGER,
dosya_ad TEXT,
FOREIGN KEY (soru_id) REFERENCES Sorular(soru_id)
);

CREATE TABLE Yanitlar (
yanit_id INTEGER PRIMARY KEY,
icerik TEXT,
olusturma_tarihi DATE,
kullanici_id INTEGER,
soru_id INTEGER,
FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id),
FOREIGN KEY (soru_id) REFERENCES Sorular(soru_id)
);

CREATE TABLE Yorumlar (
yorum_id INTEGER PRIMARY KEY,
icerik TEXT,
olusturma_tarihi DATE,
kullanici_id INTEGER,
soru_id INTEGER,
yanit_id INTEGER,
FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id),
FOREIGN KEY (soru_id) REFERENCES Sorular(soru_id),
FOREIGN KEY (yanit_id) REFERENCES Yanitlar(yanit_id)
);

CREATE TABLE FavoriSorular (
kullanici_id INTEGER,
soru_id INTEGER,
FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id),
FOREIGN KEY (soru_id) REFERENCES Sorular(soru_id),
PRIMARY KEY (kullanici_id, soru_id)
);

CREATE TABLE Bildirimler (
bildirim_id INTEGER PRIMARY KEY,
kullanici_id INTEGER,
icerik TEXT,
tarih DATE,
FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id)
);

CREATE TABLE EtiketKullaniciIstatistikleri (
etiket_id INTEGER,
kullanici_id INTEGER,
soru_sayisi INTEGER,
yanit_sayisi INTEGER,
FOREIGN KEY (etiket_id) REFERENCES Etiketler(etiket_id),
FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id),
PRIMARY KEY (etiket_id, kullanici_id)
);

CREATE TABLE SoruEtiketIstatistikleri (
soru_id INTEGER,
etiket_id INTEGER,
yanit_sayisi INTEGER,
FOREIGN KEY (soru_id) REFERENCES Sorular(soru_id),
FOREIGN KEY (etiket_id) REFERENCES Etiketler(etiket_id),
PRIMARY KEY (soru_id, etiket_id)
);

CREATE TABLE KullaniciTakip (
takip_eden_kullanici_id INTEGER,
takip_edilen_kullanici_id INTEGER,
FOREIGN KEY (takip_eden_kullanici_id) REFERENCES Kullanicilar(kullanici_id),
FOREIGN KEY (takip_edilen_kullanici_id) REFERENCES Kullanicilar(kullanici_id),
PRIMARY KEY (takip_eden_kullanici_id, takip_edilen_kullanici_id)
);

CREATE TABLE YanitResimleri (
resim_id INTEGER PRIMARY KEY,
yanit_id INTEGER,
dosya_ad TEXT,
FOREIGN KEY (yanit_id) REFERENCES Yanitlar(yanit_id)
);

-- Kullanicilar tablosuna örnek kullanıcılar ekleme
INSERT INTO Kullanicilar (ad, soyad, email, kayit_tarihi) VALUES ('Ahmet', 'Yılmaz', 'ahmet@example.com', '2022-01-01');
INSERT INTO Kullanicilar (ad, soyad, email, kayit_tarihi) VALUES ('Ayşe', 'Kaya', 'ayse@example.com', '2022-02-15');

-- Etiketler tablosuna örnek etiketler ekleme
INSERT INTO Etiketler (ad) VALUES ('Python');
INSERT INTO Etiketler (ad) VALUES ('JavaScript');

-- Sorular tablosuna örnek sorular ekleme
INSERT INTO Sorular (baslik, icerik, olusturma_tarihi, kullanici_id) VALUES ('Python fonksiyonları hakkında', 'Pythonda fonksiyon tanımlama ve kullanma nasıl yapılır?', '2022-03-10', 1);
INSERT INTO Sorular (baslik, icerik, olusturma_tarihi, kullanici_id) VALUES ('JavaScript hata ayıklama', 'JavaScriptte hata ayıklama nasıl yapılır? İpucu verir misiniz?', '2022-04-20', 2);

-- EtiketSorular tablosuna örnek etiket-soru ilişkileri ekleme
INSERT INTO EtiketSorular (soru_id, etiket_id) VALUES (1, 1);
INSERT INTO EtiketSorular (soru_id, etiket_id) VALUES (2, 2);

-- Oylar tablosuna örnek oylar ekleme
INSERT INTO Oylar (kullanici_id, soru_id, yanit_id, deger) VALUES (1, 1, NULL, 1);
INSERT INTO Oylar (kullanici_id, soru_id, yanit_id, deger) VALUES (2, 2, NULL, -1);

-- KullaniciRolleri tablosuna örnek roller ekleme
INSERT INTO KullaniciRolleri (ad) VALUES ('Admin');
INSERT INTO KullaniciRolleri (ad) VALUES ('Moderatör');

-- SoruResimleri tablosuna örnek soru resimleri ekleme
INSERT INTO SoruResimleri (soru_id, dosya_ad) VALUES (1, 'soru1.jpg');
INSERT INTO SoruResimleri (soru_id, dosya_ad) VALUES (2, 'soru2.png');

-- Yanitlar tablosuna örnek yanıtlar ekleme
INSERT INTO Yanitlar (icerik, olusturma_tarihi, kullanici_id, soru_id) VALUES ('Pythonda fonksiyon tanımlamak için def anahtar kelimesi kullanılır.', '2022-03-12', 2, 1);
INSERT INTO Yanitlar (icerik, olusturma_tarihi, kullanici_id, soru_id) VALUES ('JavaScriptte hata ayıklama yaparken tarayıcının geliştirici araçlarını kullanabilirsiniz.', '2022-04-22', 1, 2);

-- Yorumlar tablosuna örnek yorumlar ekleme
INSERT INTO Yorumlar (icerik, olusturma_tarihi, kullanici_id, soru_id, yanit_id) VALUES ('Teşekkür ederim, yardımcı oldu.', '2022-03-15', 1, 1, NULL);
INSERT INTO Yorumlar (icerik, olusturma_tarihi, kullanici_id, soru_id, yanit_id) VALUES ('Dikkate alacağım, teşekkürler.', '2022-04-25', 2, 2, NULL);

-- FavoriSorular tablosuna örnek favori sorular ekleme
INSERT INTO FavoriSorular (kullanici_id, soru_id) VALUES (1, 2);
INSERT INTO FavoriSorular (kullanici_id, soru_id) VALUES (2, 1);

-- Bildirimler tablosuna örnek bildirimler ekleme
INSERT INTO Bildirimler (kullanici_id, icerik, tarih) VALUES (1, 'Yeni bir yanıt aldınız.', '2022-03-20');
INSERT INTO Bildirimler (kullanici_id, icerik, tarih) VALUES (2, 'Sorunuz beğenildi.', '2022-04-30');

-- EtiketKullaniciIstatistikleri tablosuna örnek etiket-kullanıcı istatistikleri ekleme
INSERT INTO EtiketKullaniciIstatistikleri (etiket_id, kullanici_id, soru_sayisi, yanit_sayisi) VALUES (1, 1, 3, 5);
INSERT INTO EtiketKullaniciIstatistikleri (etiket_id, kullanici_id, soru_sayisi, yanit_sayisi) VALUES (2, 2, 2, 2);

-- SoruEtiketIstatistikleri tablosuna örnek soru-etiket istatistikleri ekleme
INSERT INTO SoruEtiketIstatistikleri (soru_id, etiket_id, yanit_sayisi) VALUES (1, 1, 2);
INSERT INTO SoruEtiketIstatistikleri (soru_id, etiket_id, yanit_sayisi) VALUES (2, 2, 1);

-- KullaniciTakip tablosuna örnek kullanıcı takipleri ekleme
INSERT INTO KullaniciTakip (takip_eden_kullanici_id, takip_edilen_kullanici_id) VALUES (1, 2);
INSERT INTO KullaniciTakip (takip_eden_kullanici_id, takip_edilen_kullanici_id) VALUES (2, 1);

-- YanitResimleri tablosuna örnek yanıt resimleri ekleme
INSERT INTO YanitResimleri (yanit_id, dosya_ad) VALUES (1, 'yanit1.jpg');
INSERT INTO YanitResimleri (yanit_id, dosya_ad) VALUES (2, 'yanit2.png');