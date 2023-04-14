SELECT Ö.kullanıcıKodu
	,H.sınavKodu
	,Ö.ofis

FROM öğretmen AS Ö

LEFT JOIN hazırlayan AS H ON H.öğretmenKodu = Ö.kullanıcıKodu;