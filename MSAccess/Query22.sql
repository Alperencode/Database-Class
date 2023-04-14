SELECT T1.ad
	,T1.soyad
	,T2.tel

FROM kullanıcı AS T1

LEFT JOIN kullanıcıTel AS T2 ON T1.kod = T2.kullanıcıKodu;