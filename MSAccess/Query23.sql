SELECT Ö.kullanıcıKodu
	,H.sınavKodu
	,Ö.ofis

FROM hazırlayan AS H

RIGHT JOIN öğretmen AS Ö ON H.öğretmenKodu = Ö.kullanıcıKodu;