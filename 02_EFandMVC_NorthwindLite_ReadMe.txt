Entity Framework Object Relational Mapping K�t�phanesi �zerinden Database First Yakla��m�yla 
02_EFandMVC_NorthwindLite E-Ticaret ASP.NET Core MVC Web Uygulamas�

Bu projede veritaban�ndan veri �ekerken ve veritaban�na veri g�nderirken entity �zerinden ger�ekle�tirilen i�lemler 
(1_ProductsController) ile dto (model) entity d�n���mleri �zerinden (2_OrdersController ve 3_CategoriesController)
ger�ekle�tirilen i�lemler veritaban� tablo ili�kileri olarak 1 to Many ve Many to Many �zerinden �rneklenmi�tir.

1) Projenin alt�ndaki SQLs klas�r�ndeki "Northwind Lite v2 DDL ve DML.sql" dosyas�ndan
Microsoft'un �rnek Northwind veritaban�n�n daha sade hali olan NorthwindLite script'i kopyalan�r ve 
SQL Server Management Studio �zerinden New Query sayfas�na yap��t�r�larak �al��t�r�l�r,
b�ylece NorthwindLite veritaban� olu�turulmu� olunur.
2) NuGet'ten Microsoft.EntityFrameworkCore.SqlServer ve Microsoft.EntityFrameworkCore.Tools paketleri indirilir.
3) Package Manager Console'da 
Scaffold-DbContext "Server=(localdb)\mssqllocaldb;Database=NorthwindLiteV2;trusted_connection=true;trustservercertificate=true;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir "Entities" -ContextDir "Contexts"
komutu connection string, provider ve opsiyonel olarak OutputDir ile ContextDir belirtilerek �al��t�r�l�r.
4) Bu i�lemler bittikten sonra veritaban� tablo yap�lar�m�z� tutan entity'ler Entities,
veritaban� yap�m�z� tutan ve veritaban�ndaki tablolar�m�za ula�mam�z� sa�layan context ise Contexts klas�r� alt�ndad�r.
5) Veritaban� yap�s�nda de�i�iklik yap�ld�k�a, mesela tablo yap�lar�nda bir de�i�iklik yap�ld�ysa, �rne�in bir s�tun ad�
veya s�tun veri tipi de�i�mi� olabilir, s�tun eklenmi� olabilir, s�tun silinmi� olabilir,
bir tablo ad� de�i�mi� olabilir, tablo eklenmi� olabilir, tablo silinmi� olabilir, 
Package Manager Console �zerinden Scaffold-DbContext komutu ile bu de�i�iklikler kod taraf�na aktar�l�r.
6) �htiyac�m�z olan veri eri�im class'lar�n� olu�turdu�umuzdan art�k 1_ProductsController �zerinden uygulamay� geli�tirmeye
devam edebiliriz.