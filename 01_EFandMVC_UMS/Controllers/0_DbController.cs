using DataAccess.Contexts;
using DataAccess.Entities;
using DataAccess.Enums;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using System.Text;

namespace _01_EFandMVC_UMS.Controllers
{
    public class DbController : Controller
    {
        private readonly Db _db; // bu controller'ı kendimize development ortamında ilk verileri oluşturması bakımından kolaylık sağlaması
                                 // için oluşturduğumuzdan direkt DbContext objesini constructor üzerinden enjekte edip Seed action'ında kullanıyoruz.

        public DbController(Db db)
        {
            _db = db;
        }

        // Tarayıcı adresi veya link üzerinden çağrımı:
        // ~/Db/Seed (~ yerinde https://localhost:port olacak)
        public IActionResult Seed()
        {
            #region Mevcut verilerin silinmesi
            var users = _db.Users.ToList();
            _db.Users.RemoveRange(users);

            var roles = _db.Roles.ToList();
            _db.Roles.RemoveRange(roles);

            if (roles.Count > 0) // eğer veritabanında rol kaydı varsa eklenecek rollerin rol id'lerini aşağıdaki SQL komutu üzerinden 1'den başlayacak hale getiriyoruz
                                 // eğer kayıt yoksa o zaman zaten rol tablosuna daha önce veri eklenmemiştir dolayısıyla rol id'leri 1'den başlayacaktır
            {
                _db.Database.ExecuteSqlRaw("dbcc CHECKIDENT ('Roles', RESEED, 0)"); // ExecuteSqlRaw methodu üzerinden istenilen SQL sorgusu elle yazılıp veritabanında çalıştırılabilir
            }
            #endregion

            #region İlk verilerin oluşturulması
            _db.Roles.Add(new Role()
            {
                Name = "Admin",
                Users = new List<User>()
                {
                    new User()
                    {
                        IsActive = true,
                        Password = "cagil",
                        UserName = "cagil",
                        BirthDate = new DateTime(1980, 5, 27),
                        Sex = Sex.Man
                    }
                }
            });
            _db.Roles.Add(new Role()
            {
                Name = "User",
                Users = new List<User>()
                {
                    new User()
                    {
                        IsActive = true,
                        Password = "luna",
                        UserName = "luna",
                        BirthDate = DateTime.Parse("23.09.2022", new CultureInfo("tr-TR")),
                        Sex = Sex.Woman
                    }
                }
            });
            #endregion

            #region DbSet'ler üzerinden yapılan değişikliklerin tek seferde veritabanına yansıtılması (Unit of Work)
            _db.SaveChanges();
            #endregion

            //return Content("Database seed successful."); // *1
            //return Content("<label style=\"color:red;\"><b>Database seed successful.</b></label>", "text/html"); // *2
            return Content("<label style=\"color:red;\"><b>Database seed successful.</b></label>", "text/html", Encoding.UTF8); // *3
            // Yeni bir view oluşturup işlem sonucunu göstermek yerine Controller base class'ının Content methodunu kullanıp işlem sonucunun boş bir sayfada gösterilmesini sağladık.
            // *1: Metinsel verinin düz yazı (plain text) olarak sayfada gösterilmesini sağlar.
            // *2: HTML verisinin sayfada HTML içerik olarak gösterilmesini sağlar.
            // *3: HTML verisinin sayfada Türkçe karakterleri destekleyen UTF8 karakter kümesi üzerinden HTML içerik olarak gösterilmesini sağlar.
        }
    }
}
