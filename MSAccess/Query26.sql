SELECT KÖ.ad AS Öğretmen
	,KÖ.soyAd AS Ad
	,KZB.ad AS ZümreBşk
	,KZB.soyad AS Adı

FROM öğretmen AS Ö
	,öğretmen AS ZB
	,kullanıcı AS KÖ
	,kullanıcı AS KZB

WHERE Ö.zümreBşk = ZB.kullanıcıKodu
	And Ö.kullanıcıKodu = KÖ.kod
	And ZB.kullanıcıKodu = KZB.kod;