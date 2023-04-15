SELECT A.ad
	,A.soyad

FROM kullanıcı AS A
	,kullanıcı AS B

WHERE A.dTarihi > B.dTarihi
	And B.ad = 'Ayşe'
	And B.Soyad = 'Dalgıç';