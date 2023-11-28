Entity Framework Object Relational Mapping Kütüphanesi Üzerinden Database First Yaklaþýmýyla 
02_EFandMVC_NorthwindLite E-Ticaret ASP.NET Core MVC Web Uygulamasý

Bu projede veritabanýndan veri çekerken ve veritabanýna veri gönderirken entity üzerinden gerçekleþtirilen iþlemler 
(1_ProductsController) ile dto (model) entity dönüþümleri üzerinden (2_OrdersController ve 3_CategoriesController)
gerçekleþtirilen iþlemler veritabaný tablo iliþkileri olarak 1 to Many ve Many to Many üzerinden örneklenmiþtir.

1) Projenin altýndaki SQLs klasöründeki "Northwind Lite v2 DDL ve DML.sql" dosyasýndan
Microsoft'un örnek Northwind veritabanýnýn daha sade hali olan NorthwindLite script'i kopyalanýr ve 
SQL Server Management Studio üzerinden New Query sayfasýna yapýþtýrýlarak çalýþtýrýlýr,
böylece NorthwindLite veritabaný oluþturulmuþ olunur.
2) NuGet'ten Microsoft.EntityFrameworkCore.SqlServer ve Microsoft.EntityFrameworkCore.Tools paketleri indirilir.
3) Package Manager Console'da 
Scaffold-DbContext "Server=(localdb)\mssqllocaldb;Database=NorthwindLiteV2;trusted_connection=true;trustservercertificate=true;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir "Entities" -ContextDir "Contexts"
komutu connection string, provider ve opsiyonel olarak OutputDir ile ContextDir belirtilerek çalýþtýrýlýr.
4) Bu iþlemler bittikten sonra veritabaný tablo yapýlarýmýzý tutan entity'ler Entities,
veritabaný yapýmýzý tutan ve veritabanýndaki tablolarýmýza ulaþmamýzý saðlayan context ise Contexts klasörü altýndadýr.
5) Veritabaný yapýsýnda deðiþiklik yapýldýkça, mesela tablo yapýlarýnda bir deðiþiklik yapýldýysa, örneðin bir sütun adý
veya sütun veri tipi deðiþmiþ olabilir, sütun eklenmiþ olabilir, sütun silinmiþ olabilir,
bir tablo adý deðiþmiþ olabilir, tablo eklenmiþ olabilir, tablo silinmiþ olabilir, 
Package Manager Console üzerinden Scaffold-DbContext komutu ile bu deðiþiklikler kod tarafýna aktarýlýr.
6) Ýhtiyacýmýz olan veri eriþim class'larýný oluþturduðumuzdan artýk 1_ProductsController üzerinden uygulamayý geliþtirmeye
devam edebiliriz.