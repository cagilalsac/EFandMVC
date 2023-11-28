Entity Framework Object Relational Mapping Kütüphanesi Üzerinden Code First Yaklaþýmýyla 
02_EFandMVC_UMS User Management System ASP.NET Core MVC Web Uygulamasý

Entity Framework Code First yaklaþýmý üzerinden oluþturulan entity
ve entity DbSet'leri üzerinden veritabanýný oluþturmak için
DbContext'ten miras alan sýnýf oluþturulduktan sonra MVC projesinin
appsettings.json dosyasýna ConnectionString tanýmlanýr.
MVC projesinin Program.cs dosyasýnda da IoC Container kýsmýnda DbContext'ten
miras alan sýnýf için baðýmlýlýk yönetimi gerçekleþtirilir.
Daha sonra Visual Studio menüsünden Tools -> NuGet Package Manager -> Package Manager Console
açýlarak Default Project DbContext'ten miras alan sýnýfýn bulunduðu proje seçilir.
Sýrasýyla add-migration v1 (v1 yerine daha önce kullanýlmamýþ herhangi bir isim yazýlabilir) ve
update-database komutlarý çalýþtýrýlýr.