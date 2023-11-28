Entity Framework Object Relational Mapping K�t�phanesi �zerinden Code First Yakla��m�yla 
02_EFandMVC_UMS User Management System ASP.NET Core MVC Web Uygulamas�

Entity Framework Code First yakla��m� �zerinden olu�turulan entity
ve entity DbSet'leri �zerinden veritaban�n� olu�turmak i�in
DbContext'ten miras alan s�n�f olu�turulduktan sonra MVC projesinin
appsettings.json dosyas�na ConnectionString tan�mlan�r.
MVC projesinin Program.cs dosyas�nda da IoC Container k�sm�nda DbContext'ten
miras alan s�n�f i�in ba��ml�l�k y�netimi ger�ekle�tirilir.
Daha sonra Visual Studio men�s�nden Tools -> NuGet Package Manager -> Package Manager Console
a��larak Default Project DbContext'ten miras alan s�n�f�n bulundu�u proje se�ilir.
S�ras�yla add-migration v1 (v1 yerine daha �nce kullan�lmam�� herhangi bir isim yaz�labilir) ve
update-database komutlar� �al��t�r�l�r.