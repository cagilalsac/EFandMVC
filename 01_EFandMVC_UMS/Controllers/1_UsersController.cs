#nullable disable
using DataAccess.Contexts;
using DataAccess.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace MVC.Controllers
{
	public class UsersController : Controller
	{
        #region Constructor Dependency Injection
        private readonly Db _context;

		// Program.cs IoC Container'da bağımlılığını yönettiğimiz DbContext'ten
		// miras alan Db tipindeki objeyi (context) bu controller'a enjekte
		// ediyoruz ki _context referansı üzerinden action'larda
		// veritabanı işlemleri yapabilelim.
		public UsersController(Db context)
		{
			_context = context;
		}
		#endregion

		/*
        Önce sorgumuzu Users DbSet'i üzerinden Include ve Order işlemleri yaparak
        oluşturuyoruz, sonra da ToList methodunu çağırarak oluşturduğumuz sorgunun
        veritabanında çalışması üzerinden User tipindeki liste objesinin dolmasını 
        sağlayıp Index view'ına objeyi model olarak gönderiyoruz.
        */
		// GET: Users
		public IActionResult Index()
		{
			List<User> users = _context.Users.
				Include(u => u.Role).
				OrderByDescending(u => u.IsActive). // önce aktiflik durumuna göre azalan
				ThenByDescending(u => u.BirthDate). // sonra doğum tarihine göre azalan
				ThenBy(u => u.UserName). // en son olarak da kullanıcı adına göre artan sıralama
				ToList();

            return View(users);
		}

		/*
        Find methodu yerine SingleOrDefault methodu da kullanılarak ID üzerinden tek bir kayda ulaşılabilir 
        ki genelde ID üzerinden tek bir kayda ulaşmak için SingleOrDefault methodu kullanılır.
        SingleOrDefault lambda expression kullanılarak belirtilen koşul üzerinden tek bir kayıt döner,
        eğer sorgu sonucunda birden çok kayıt dönerse exception fırlatır, eğer belirtilen koşula sahip
        kayıt bulamazsa null referansı döner.
        Single, SingleOrDefault yerine kullanılabilir, eğer belirtilen koşula sahip birden çok kayıt bulursa
        veya kayıt bulamazsa exception fırlatır.
        Eğer ilişkili entity verileri de Include ile çekiliyorsa Find kullanılamadığından 
        SingleOrDefault veya Single methodları kullanılabilir.
        SingleOrDefault yerine FirstOrDefault da kullanılabilir.
        FirstOrDefault lamda expression kullanılarak belirtilen koşul üzerinden sorgu sonucunda
        tek kayıt dönse de birden çok kayıt dönse de her zaman ilk kaydı döner,
        eğer kayıt bulunamazsa null referansı döner.
        First, FirstOrDefault yerine kullanılabilir, eğer belirtilen koşula sahip kayıt bulunamazsa
        exception fırlatır.
        LastOrDefault ve Last methodları da FirstOrDefault ve First methodlarının tersi düşünülerek
        belirtilen koşula göre bulunan son kayıt üzerinden işlemi gerçekleştirir.
        Eğer ilişkili entity verileri de Include ile çekiliyorsa Find kullanılamadığından 
        FirstOrDefault veya First methodları kullanılabilir.
        Herhangi bir DbSet üzerinden son kayda ulaşmak için LastOrDefault veya Last methodları yerine 
        genelde kayıtlar azalan bir şekilde sıralanarak FirstOrDefault veya First methodları kullanılır.
        Genelde kayıt bulunamadığında null sonuç dönen OrDefault ile biten methodlar kullanılır. 
        */
		// GET: Users/Details/5
		public IActionResult Details(int id)
		{
			User user = _context.Users
				.Include(u => u.Role)
				.SingleOrDefault(m => m.Id == id);

			if (user == null)
			{
				// 1. yöntem:
				//return NotFound();
				// 2. yöntem:
				//return NotFound("User couldn't be found!");
				// 3. yöntem: _Error partial view'ına mesajın model olarak gönderilmesi
				return View("_Error", "User couldn't be found!");
			}

			return View(user);
		}

		/*
        Önce kullanıcının HTML form üzerinden verileri girebilmesi ve web sunucusuna 
        gönderebilmesi (post) için HttpGet action method'lu Create action'ı üzerinden  
        Create view'ını dönüyoruz. View'da kullanıcının rol seçebilmesi için bir açılır listeye 
        (drop down list) ihtiyacımız var, dolayısıyla rol listesini ilgili DbSet'inden çektikten
        sonra Create view'ına "ViewBag.Roles" veya "ViewData["Roles"]"
        olarak gönderiyoruz. ViewBag ile ViewData model dışında bir action'dan action'ın view'ına ya da
        view'lar arası ekstra verileri taşımak için kullanılır ve birbirlerinin yerine kullanılabilir.
        Kullanıcıdan verileri aldıktan sonra User entity'sini HttpPost action method'lu
        Create action'ında DbContext'imizdeki Users DbSet'ine Add methodu ile ekleyip daha sonra
        DbSet'teki bu değişikliği SaveChanges methoduyla kaydediyoruz ve veritabanına iletiyoruz.
        SaveChanges çağrıldıktan sonra entity üzerinden veritabanına eklenen kaydın ID değeri alınabilir.
        */
		// GET: Users/Create
		public IActionResult Create()
		{
			ViewData["Roles"] = new SelectList(_context.Roles.OrderBy(r => r.Name).ToList(), "Id", "Name");

			// 1. yöntem: form verileri boş olan view dönülmesi
			//return View();
			// 2. yöntem: eğer istenirse yeni bir model üzerinden istenilen bazı özellikler
			// atanarak model view'a gönderilir ve bu özellikler üzerinden bazı form verilerinin
			// dolu gelmesi sağlanabilir
			User user = new User()
			{
				IsActive = true,
				BirthDate = new DateTime(2000, 1, 1)
			};
			return View(user);
		}

		// POST: Users/Create
		// To protect from overposting attacks, enable the specific properties you want to bind to.
		// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult Create(User user)
		{
			if (ModelState.IsValid) // User class'ındaki data annotation'lar üzerinden
									// validasyon gerçekleştirir
			{
				// eğer veritabanındaki Users tablosunda girilen kullanıcı adına sahip kayıt yoksa
				if (!_context.Users.Any(u => u.UserName.ToUpper() == user.UserName.ToUpper().Trim()))
				{
					// kullanıcıdan aldığımız User tipindeki user modeli üzerinden kullanıcı adı
					// ve şifre için baştaki ve sondaki boşlukları temizleme gibi ekstra işlemler
					// yapmamız gerekebilir, ayrıca sadece yeni kayıtlar için GUID de oluşturuyoruz
					user.UserName = user.UserName.Trim();
					user.Password = user.Password.Trim();
					user.Guid = Guid.NewGuid().ToString();

					_context.Users.Add(user); // Users DbSet'ine user'ı ekliyoruz
					_context.SaveChanges(); // değişikliklikleri tek seferde veritabanına yansıtıyoruz
											// (Unit of Work)

					// Index action'ı üzerinden Index view'ında işlem sonucunu görebilmek için
					// Index action'ına yönlendirme yaptığımızdan mesaj verisini TempData olarak atıyoruz
					TempData["Message"] = "User created successfully.";

                    // kullanıcıyı listeleme için Index action'ına yönlendiriyoruz
                    // 1. yöntem:
                    //return RedirectToAction("Index");
                    // 2. yöntem:
                    return RedirectToAction(nameof(Index)); 
				}

				// eğer veritabanındaki Users tablosunda girilen kullanıcı adına sahip kayıt varsa
				// Create view'ında validation summary kullandığımızdan validation summary'e
				// aşağıdaki mesajı taşıyoruz
				ModelState.AddModelError("", "User with the same user name exists!");
			}

			// eğer user modeli data annotation validasyonlarından geçemezse rolleri tekrar
			// doldurup kullanıcının gönderdiği bu action'a parametre olarak gelen dolu
			// user model objesini tekrar kullanıcıya view üzerinden gönderiyoruz
			ViewBag.Roles = new SelectList(_context.Roles.OrderBy(r => r.Name).ToList(), "Id", "Name");
			return View(user); // Create view'ına user modeli göderiyoruz
		}

		/*
        Önce kullanıcının HTML form üzerinden verileri girebilmesi ve web sunucusuna 
        gönderebilmesi (post) için HttpGet action method'lu Edit action'ı üzerinden  
        Edit view'ını dönüyoruz. Action'daki id parametresi kullanıcı listeleme view'ındaki (Index)
        Edit link'i üzerinden route değeri ({controller}/{action}/{route değeri}) olarak gelecek, 
        biz de bu id'ye sahip kullanıcıyı veritabanından çekip rol listesini de bir ViewBag'e 
        attıktan sonra kullanıcıyı Edit view'ına model olarak göndereceğiz.
        */
		// GET: Users/Edit/5
		public IActionResult Edit(int id)
		{
			User user = _context.Users.Find(id);

			if (user == null)
			{
				return View("_Error", "User couldn't be found!");
			}

			ViewData["RoleId"] = new SelectList(_context.Roles.OrderBy(r => r.Name).ToList(), "Id", "Name");
			return View(user);
		}

		// POST: Users/Edit
		// To protect from overposting attacks, enable the specific properties you want to bind to.
		// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult Edit(User user)
		{
			if (ModelState.IsValid) // User class'ındaki data annotation'lar üzerinden
									// validasyon gerçekleştirir
			{
				// eğer veritabanındaki Users tablosunda girilen kullanıcı adına sahip
				// düzenlediğimiz kayıt dışında (u.Id != user.Id koşulu) kayıt yoksa
				if (!_context.Users.Any(u => u.UserName.ToUpper() == user.UserName.ToUpper().Trim() &&
					u.Id != user.Id))
				{
					// kullanıcıdan aldığımız User tipindeki user modeli üzerinden kullanıcı adı
					// ve şifre için baştaki ve sondaki boşlukları temizleme gibi ekstra işlemler
					// yapmamız gerekebilir
					user.UserName = user.UserName.Trim();
					user.Password = user.Password.Trim();

					_context.Users.Update(user); // Users DbSet'inde user'ı güncelliyoruz
					_context.SaveChanges(); // değişikliklikleri tek seferde veritabanına yansıtıyoruz
											// (Unit of Work)

					// Index action'ı üzerinden Index view'ında işlem sonucunu görebilmek için
					// Index action'ına yönlendirme yaptığımızdan mesaj verisini TempData olarak atıyoruz
					TempData["Message"] = "User updated successfully.";

					return RedirectToAction(nameof(Index)); // kullanıcıyı listeleme için
															// Index action'ına yönlendiriyoruz
				}

				// eğer veritabanındaki Users tablosunda girilen kullanıcı adına sahip
				// düzenlediğimiz kayıt dışında kayıt varsa Edit view'ında validation summary
				// kullandığımızdan validation summary'e aşağıdaki mesajı taşıyoruz
				ModelState.AddModelError("", "User with the same user name exists!");
			}

			// eğer user modeli data annotation validasyonlarından geçemezse rolleri tekrar
			// doldurup kullanıcının gönderdiği bu action'a parametre olarak gelen dolu
			// user model objesini tekrar kullanıcıya view üzerinden gönderiyoruz
			ViewBag.Roles = new SelectList(_context.Roles.OrderBy(r => r.Name).ToList(), "Id", "Name");
			return View(user); // Edit view'ına user modeli göderiyoruz
		}

        /*
		Index view'ından Delete link'i üzerinden aldığımız user id verisi üzerinden 
		entity'yi veritabanından çekiyoruz ve kullanıcının entity detayını görmesi, 
		aynı zamanda da silme işlemini konfirme etmesi için Delete view'ına 
		entity'i model olarak gönderiyoruz.
		*/
        // GET: Users/Delete/5
        public IActionResult Delete(int id)
		{
            User user = _context.Users
                .Include(u => u.Role)
                .SingleOrDefault(m => m.Id == id);

            if (user == null)
            {
                return View("_Error", "User couldn't be found!");
            }

            return View(user);
        }

        /*
		Kullanıcı Delete view'ında "Yes" butonuna bastığında aşağıda çalışan ve method adı 
		route üzerinden çağrımı için ActionName attribute'u ile değiştirilmiş post action'ı 
		üzerinden eğer bu entity'nin ilişkili entity'leri varsa ilişkili entity'leri kendi 
		DbSet'leri üzerinden RemoveRange ile siliyoruz. 
        Sonrasında bu entity ile ilgili DbSet üzerinden Remove methoduna bu entity'yi gönderiyoruz. 
		Son olarak da SaveChanges methodunu çağırıp DbSet'lerdeki tüm değişiklikleri 
		tek seferde veritabanına iletiyoruz (Unit of Work).
		User entity'sinin önce silmemiz gereken ilişkili entity'leri olmadığından yani RoleId 
		foreign key'i bu entity'de olduğundan sadece Users DbSet'inden User entity'sini silmemiz yeterli.
		Silme işlemine önce içerisinde foreign key olan entity'ler üzerinden başlanır daha sonra
		ilişkili entity'ler silinir. Ekleme işleminde ise sıra tam tersidir.
        */
        // POST: Users/Delete
        [HttpPost, ActionName("Delete")] // ActionName ile action route çağrımını Delete olarak değiştiriyoruz
		[ValidateAntiForgeryToken]
		public IActionResult DeleteConfirmed(int id)
		{
			User user = _context.Users.Find(id); // önce User entity'sini ilgili DbSet'inden id'ye göre çekiyoruz

			_context.Users.Remove(user); // daha sonra entity'yi ilgili DbSet'inden çıkarıyoruz

			_context.SaveChanges(); // son olarak da değişiklikleri veritabanına iletiyoruz

            // Index action'ı üzerinden Index view'ında işlem sonucunu görebilmek için
            // Index action'ına yönlendirme yaptığımızdan mesaj verisini TempData olarak atıyoruz
            TempData["Message"] = "User deleted successfully.";

            return RedirectToAction(nameof(Index)); // kullanıcıyı listeleme için Index action'ına yönlendiriyoruz
		}
	}
}
