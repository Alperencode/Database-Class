SELECT Ö.kullanıcıKodu
	,ZB.kullanıcıKodu AS [Zümre Başkanı]

FROM öğretmen AS Ö
	,öğretmen AS ZB

WHERE Ö.zümreBşk = ZB.kullanıcıKodu;