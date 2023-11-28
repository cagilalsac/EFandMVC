using _02_EFandMVC_NorthwindLite.Contexts;
using _02_EFandMVC_NorthwindLite.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace _02_EFandMVC_NorthwindLite.Controllers
{
    // Ürün CRUD (Create, Read, Update, Delete) işlemlerini gerçekleştireceğimiz ve MVC
    // kütüphanesinin Controller sınıfından miras aldığımız ürün controller sınıfı
    public class ProductsController : Controller
    {
        /*
         1) Veritabanındaki tablolarımıza DbContext'teki DbSet'ler üzerinden ulaşabilmek için bir 
         _db objesine ihtiyacımız var. Bu objeyi new'lemek yerine Constructor Injection yaparak
         controller class'ına enjekte etmeliyiz.
        */
        // 1. yanlış yöntem:
        //NorthwindLiteV2Context _db = new NorthwindLiteV2Context();
        // 2. doğru yöntem:
        private readonly NorthwindLiteV2Context _db; // readonly alanlar veya özelliklere atama işlemi
                                                     // sadace bu satırda veya constructor'da yapılabilir

        public ProductsController(NorthwindLiteV2Context db)
        {
            _db = db;
        }



        /*
         2) Ürün listesini görmek için aşağıdaki methodu (action) oluşturuyoruz.
         Bu controller'ın bu action'ını tarayıcımızdan domain'den (örneğin https://localhost:1234) sonra
         controller adı ve sonrasında da action adını yazarak çalıştıracağız.
         Örnek: https://localhost:1234/Products/GetList
         Eğer web uygulamamızın üstteki menüsüne bu url link'ini eklemek istersek projemizin altındaki 
         Views klasörü altındaki Shared klasöründeki _Layout.cshtml dosyasında aşağıdaki menü elemanları için 
         HTML kodunu 
         <li class="nav-item">
            <a class="nav-link text-dark" asp-area="" asp-controller="Home" asp-action="Privacy">Privacy</a>
         </li>
         bulup bir alt satırına 
         <li class="nav-item">
            <a class="nav-link text-dark" href="/Products/GetList">Products</a>
         </li>
         eklememiz yeterlidir.
        */
        public IActionResult GetList()
        {
            /*
             3) Ürünleri _db objemiz üzerinden Products DbSet'ine ToList methodunu yazarak ürün listesini 
             veritabanından çekip Products listesi tipinde productEntities değişkenimize atıyoruz.
             Dönülen ürün listesindeki kayıt sayısına List class'ının Count özelliği ile ulaşılabilir.
             Eğer istenirse DbSet üzerinden Count methodu çağrılarak da kayıt sayısına ulaşılabilir.
             Entity Framework Core'da lazy loading (ihtiyaca göre include yapmadan otomatik ilişkili verileri yükleme) 
             default olarak aktif değildir. Eager loading (ihtiyaca göre include ile ilişkili verileri yükleme) kullanabilmek için 
             _db üzerinden çekilen DbSet'ten sonra Include methodu ile lambda expression veya string üzerinden istenilen ilişkili 
             entity özelliği yazılır. Eğer include edilen entity'nin de ilişkili entity özelliği sorguya dahil
             edilmek isteniyorsa ThenInclude methodunda include edilen entity tipindeki delege üzerinden
             include edilen entity'nin ilişkili entity özelliği yazılmalıdır. Ancak ThenInclude methodu kullanılacaksa
             Include methodunda lamda expression kullanılmalıdır.
            */
            //List<Product> productEntities = _db.Products.Include("Category")
            //    .Include("OrderDetails").ToList(); // Eager Loading kullanılıyor (1. yöntem), bu yöntemde ThenInclude kullanılamaz
            //List<Product> productEntities = _db.Products.Include(product => product.Category)
            //    .Include(product => product.OrderDetails)
            //    .ThenInclude(orderDetails => orderDetails.Order)
            //    .ToList(); // Eager Loading kullanılıyor (2. yöntem), bu yöntemde ThenInclude kullanılabilir
            List<Product> productEntities = _db.Products.ToList(); // Eager Loading kullanılmıyor, çünkü sadace Product ile ilgili Category ve OrderDetails
                                                                   // ile ilişkili olmayan bazı özellikler üzerinden ürün bilgilerini özet olarak listeleyeceğiz

            // Products DbSet'i üzerinden çektiğimiz ürün listesini action'ın view'ına (cshtml) gönderiyoruz.
            // View'ı istersek projenin altındaki Views klasörü altına controller adı ile aynı (Products)
            // bir klasör oluşturup bu klasör altına da action adı ile aynı (GetList) cshtml dosyası 
            // şeklinde oluşturabiliriz. İstersek de view'ın adını değiştirip (List) yukarıdaki View methoduna
            // bu adı ikinci parametre olarak gönderip objemizi bu view'a gönderebiliriz.
            // View oluşturmak için bir diğer kolay yöntem ise action altında herhangi bir yere fare ile sağ
            // tıklayıp Add View'a tıkladıktan sonra boş (empty) veya bir şablon (listeleme, detay, oluşurma, düzenleme, silme, vb.)
            // üzerinden view adını verip projenin Views klasörü altında controller adlı klasör altında
            // belirttiğimiz view adı üzerinden view'ı (cshtml) oluşturmaktır. Bu örnekte empty (boş) view oluşturtacağız.

            // 1. yöntem: GetList view'ına ürün listesinin gönderilmesi
            //return View(productEntities); 
            // 2. yöntem: List view'ına ürün listesinin gönderilmesi
            return View("List", productEntities);
        }



        /*
         4) Products tablosundaki herhangi bir kaydın detayına ulaşmak için ProductId değerine
         ihtiyacımız var. Bu değeri view'da kullanıcının tıkladığı Find link'i üzerinden alıyoruz
         (örnek: 
         <a href="/Products/GetByFind?id=7">Find</a>
         query string'li link veya
         <a href="/Products/GetByFind/7">Find</a>
         MVC yol (route) tanımlı link).
         MVC route tanımı: controller/action/id? (?: opsiyonel)
         ProductId değeri alındıktan sonra detay kaydına Find LINQ (Language Integrated Query)
         methoduyla primary key ile ulaşılabilir.
         Dikkat edilmelidir ki herhangi bir DbSet üzerinde Find LINQ methodu kullanıldığında 
         eğer Include methodu (dahil etme) veya Select methodu (projeksiyon) kullanılmazsa 
         ilişkili entitylerin verileri otomatik çekilmez. Include methodu kullanıldıktan sonra 
         Find methodu çağrılamaz.
        */
        public IActionResult GetByFind(int id) // id parametresi mutlaka MVC route tanımındaki şekilde tanımlanmalıdır
        {
            Product productEntity = _db.Products.Find(id);

            // Ürünü Find methodu ile DbSet üzerinden çektikten sonra Details adlı view'a model olarak gönderiyoruz,
            // Details view'ını model'i Product olacak şekilde boş (empty) olarak oluşturmamız gerekiyor.
            return View("Details", productEntity);
        }



        /*
         5) Find methodu yerine SingleOrDefault methodu da kullanılarak ID üzerinden tek bir kayda ulaşılabilir 
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
        public IActionResult GetBySingle(int id)
        {
            // Include kullanılmadan Single, SingleOrDefault, First ve FirstOrDefault çağrılması:
            //Product productEntity = _db.Products.Single(product => product.ProductId == id);
            //Product productEntity = _db.Products.SingleOrDefault(product => product.ProductId == id);
            //Product productEntity = _db.Products.First(product => product.ProductId == id);
            //Product productEntity = _db.Products.FirstOrDefault(product => product.ProductId == id);

            // Include kullanılarak SingleOrDefault ve FirstOrDefault çağrılması:
            // Burada include işlemi yapmalıyız çünkü daha önce oluşturduğumuz Details view'ında
            // Category ve Order Details bilgilerini de göstereceğiz.
            //Product productEntity = _db.Products.Include(product => product.Category)
            //    .Include(product => product.OrderDetails)
            //    .ThenInclude(orderDetails => orderDetails.Order)
            //    .FirstOrDefault(product => product.ProductId == id);

            Product productEntity = _db.Products.Include(product => product.Category)
                .Include(product => product.OrderDetails)
                .ThenInclude(orderDetails => orderDetails.Order)
                .SingleOrDefault(product => product.ProductId == id);

            return View("Details", productEntity);
        }



        /*
         6.1) Where ile herhangi bir DbSet üzerinden kayıtlar lamda expression kullanılarak bir veya daha fazla
         koşul üzerinden filtrelenerek kolleksiyon olarak geri dönülebilir.
         Koşullarda && (and), || (or) ile ! (not) operatorleri istenirse bir arada kullanılabilir.
         Bu operatörler ile oluşturulan koşullar SingleOrDefault, Single, FirstOrDefault, First,
         LastOrDefault ve Last gibi methodlarda da kullanılabilir.
         Aşağıdaki aksiyonda önce kullanıcıya içerisinde arama kriterlerini girebileceği 2 form
         olan view'ı dönüyoruz. Kullanıcı formlardaki butonlara bastığında kullanıcıyı 
         ilgili form tag'inde belirttiğimiz action'a yönlendirerek where ile kayıtları filtreleyeceğiz.
         Formları da WhereForms adında bir view içerisine koyup aşağıdaki aksiyonda bu view'ı döneceğiz.   
        */
        public IActionResult GetByWhere()
        {
            //return View(); // bu şekilde aksiyon adındaki GetByWhere view'ı dönülür
            return View("WhereForms"); // bu şekilde WhereForms view'ı dönülür
        }



        /*
         6.2) WhereForms view'ındaki methodu "get" olarak tanımlanmış ve bu action'a verileri gönderen
         form verileri "HttpGet" C# attribute'u (action method da denir) tanımlanmış aşağıdaki action
         ile method parametreleri üzerinden form'da "name" HTML attribute'u belirtilmiş veri giriş tag'leri üzerinden alınır. 
         Eğer action'a "HttpGet" yazılmazsa action default (varsayılan) olarak "HttpGet" action methodu üzerinden çalışır.
         Aşağıdaki action'da koşullar and operatörleri ile bağlanmıştır dolayısıyla HTML formunda
         tüm veri giriş tag verileri boş olarak action'a gönderildiğinde (submit) NameGet parametresinin tipi string 
         olduğundan null, UnitsInStockBeginGet ve UnitsInStockEndGet parametrelerinin tipleri de int olduğundan 0 
         değerlerini alır, dolayısıyla filtreleme sonucunda bu koşullara uyan hiç bir ürün dönmez.
         ProductName için kullanılan Contains methodu like içeren where koşullu bir SQL sorgusu oluşturur,
         dolayısıyla girilen ürün adını içeren kayıtlar getirilir.
         StartsWith methodu ile girilen ürün adı ile başlayan, EndsWith methodu ile de sonu girilen 
         ürün adı ile biten kayıtlar filtrelenir. == operatörü veya Equals methodu ile de ürün adı eşit olan kayıtlar filtrelenir.
         Where methodu belirtilen koşul veya koşullara uyan bir kolleksiyon sorgusu döner.
        */
        [HttpGet] // her zaman yazmak zorunlu değil çünkü default olarak "HttpGet"
        public IActionResult GetByWhereWithHttpGet(string NameGet, int UnitsInStockBeginGet, int UnitsInStockEndGet)
        {
            // Ürünleri Where methodu ile filtreleyerek liste olarak çekiyoruz.
            List<Product> filteredProductEntities = _db.Products.Where(product => product.ProductName.Contains(NameGet)
                && product.UnitsInStock >= UnitsInStockBeginGet && product.UnitsInStock <= UnitsInStockEndGet).ToList();

            // Çektiğimiz ürünleri List view'ına model olarak gönderiyoruz.
            return View("List", filteredProductEntities);
        }



        /*
         6.3) WhereForms view'ındaki methodu "post" olarak tanımlanmış ve bu action'a verileri gönderen
         form verileri "HttpPost" C# attribute'u (action method da denir) tanımlanmış aşağıdaki action
         ile method parametreleri üzerinden form'da "name" HTML attribute'u belirtilmiş veri giriş tag'leri üzerinden alınır. 
         Aşağıdaki action'da önce sorgu tüm ürünleri çekecek şekilde oluşturulmuştur.
         Sonra ürün adı dolu ise Where methodu ile ürün adı üzerinden filtrelenmiştir.
         Sonra filtrelenmiş sorgu stok miktarı başlangıç dolu ise Where methodu ile stok miktarı başlangıç üzerinden filtrelenmiştir.
         Son olarak da filtrelenmiş sorgu stok miktarı bitiş dolu ise Where methodu ile stok miktarı bitiş üzerinden filtrelenmiştir.
         HTML formunda tüm veri giriş tag'leri boş olarak action'a gönderildiğinde (submit) tüm ürünler geri döner.
         Stok miktarı başlangıç ve bitiş parametreleri null gelebileceğinden int? olarak tanımlanmıştır ve WhereForms view'ındaki
         formda da boş girilebilmeleri için input'ların type'ları "text" olarak belirtilmiştir.
         Genelde raporlama işlemlerinde yapılan filtrelemeler aşağıdaki şekilde IQueryable üzerinden gerçekleştirilir.
        */
        [HttpPost] // "post" methodu üzerinden yapılan istekler (request) için mutlaka yazılmalıdır
        public IActionResult GetByWhereWithHttpPost(string NamePost, int? UnitsInStockBeginPost, int? UnitsInStockEndPost)
        {
            // Product DbSet'i üzerinden Product IQueryable'ı (sorgusu) oluşturmak için AsQueryable methodu
            // isteğe bağlı olarak kullanılabilir. Önce tüm ürünleri çeken sorguyu oluşturuyoruz.
            //IQueryable<Product> productQuery = _db.Products.AsQueryable();
            IQueryable<Product> productQuery = _db.Products;

            if (!string.IsNullOrWhiteSpace(NamePost)) // NamePost parametresinde veri varsa
            {
                // Sorguyu Where methodu ile NamePost parametre verisini küçük harfe dönüştürüp
                // başındaki ve sonundaki boşlukları da temizleyerek product delegesi üzerinden
                // ulaştığımız ProductName özelliğini de küçük harfe dönüştürerek filtreleyip güncelliyoruz ki
                // böylece büyük küçük harf duyarlılığını ortadan kaldırabilelim (case sensitivity).
                productQuery = productQuery.Where(product => product.ProductName.ToLower().Contains(NamePost.ToLower().Trim()));
            }

            if (UnitsInStockBeginPost.HasValue) // UnitsInStockBeginPost parametresinde veri varsa
            {
                // Sorguyu Where methodu ile UnitsInStockBeginPost parametre değeri
                // üzerinden filtreleyip güncelliyoruz.
                productQuery = productQuery.Where(product => product.UnitsInStock >= UnitsInStockBeginPost.Value);
            }

            if (UnitsInStockEndPost.HasValue) // UnitsInStockEndPost parametresinde veri varsa
            {
                // Sorguyu Where methodu ile UnitsInStockEndPost parametre değeri
                // üzerinden filtreleyip güncelliyoruz.
                productQuery = productQuery.Where(product => product.UnitsInStock <= UnitsInStockEndPost.Value);
            }

            // Sorguyu filtreleme işlemleri bittikten sonra ToList methodu ile veritabanında çalıştırıp
            // ürün listesi olarak filteredProductEntities değişkenine atıyoruz.
            List<Product> filteredProductEntities = productQuery.ToList();

            // Filtrelenmiş ürün listesini (filteredProductEntities) List view'ına model olarak gönderiyoruz.
            return View("List", filteredProductEntities);
        }



        /* 
         7.1) Önce kullanıcının HTML form üzerinden verileri girebilmesi ve web sunucusuna 
         gönderebilmesi (post) için HttpGet action method'lu Create action'ı üzerinden  
         Create view'ını dönüyoruz. View'da kullanıcının kategori seçebilmesi için bir açılır listeye 
         (drop down list) ihtiyacımız var, dolayısıyla kategori listesini ilgili DbSet'inden çektikten
         sonra Create view'ına "ViewBag.Categories" veya "ViewData["Categories"]"
         olarak gönderiyoruz. ViewBag ile ViewData model dışında bir action'dan action'ın view'ına ya da
         view'lar arası ekstra verileri taşımak için kullanılır ve birbirlerinin yerine kullanılabilir.
         Kullanıcıdan verileri aldıktan sonra Product entity'sini HttpPost action method'lu
         Create action'ında DbContext'imizdeki Products DbSet'ine Add methodu ile ekleyip daha sonra
         DbSet'teki bu değişikliği SaveChanges methoduyla kaydediyoruz ve veritabanına iletiyoruz.
         SaveChanges çağrıldıktan sonra entity üzerinden veritabanına eklenen kaydın ID değeri alınabilir.
        */
        public IActionResult Create()
        {
            List<Category> categories = _db.Categories.OrderBy(category => category.CategoryName).ToList();
            // OrderBy LINQ methodu parametre olarak kullanılan delegenin seçilen özelliğine göre kayıtların
            // artan sıralanmasını sağlar. Azalan sıralama için de OrderByDescending kullanılabilir.

            ViewBag.Categories = new SelectList(categories, "CategoryId", "CategoryName");
            // ViewData["Categories"] de kullanılabilir. Yeni bir SelectList objesine yukarıda çektiğimiz
            // kategori listesini, açılır listede (drop down list) kullanıcıya gösterilmeyen değer olarak
            // Category sınıfındaki hangi özelliğin (CategoryId) kullanılacağını ve kullanıcıya gösterilen
            // yazı olarak Category sınıfındaki hangi özelliğin (CategoryName) kullanılacağını parametre
            // olarak gönderip ViewBag veya ViewData'ya atıyoruz.

            return View("CreateWithTagHelpers"); // İçerisinde HTML form olan CreateWithTagHelpers view'ını kullanıcıya dönüyoruz.
		}



        /*
         7.2) Kullanıcıdan Product tipindeki product parametresi (modeli) üzerinden verileri aldıktan sonra 
         yeni bir Product entity'si oluşturup DbContext'imizdeki Products DbSet'ine Add methodu ile ekleyip daha sonra
         DbSet'teki bu değişikliği SaveChanges methoduyla kaydediyoruz ve veritabanına iletiyoruz.
         SaveChanges çağrıldıktan sonra entity üzerinden veritabanına eklenen kaydın ID değeri alınabilir.
         Create view'ındaki methodu post olan formun verilerini aşağıdaki HttpPost action method'u ile
         işaretlenmiş Create action'ında parametre olarak gönderilen ve view'ın da modeli olan Product tipindeki 
         product parametresi üzerinden alıyoruz.
        */
        [HttpPost]
        public IActionResult Create(Product product)
        {
            // ModelState.IsValid bu action'a parametre olarak gönderilen product modelinin (parametresinin)
            // özellikleri üzerinden validasyon yaparak eğer tüm özellikler validasyondan geçerse true,
            // en az bir özellik validasyondan geçemezse false döner.
            if (ModelState.IsValid) // eğer product modeli validasyondan geçerse
            {

                // product entity'sini Products DbSet'ine ekle ve SaveChanges methodu ile ürün ekleme işlemini veritabanına yansıt.
                _db.Products.Add(product);
                _db.SaveChanges();

                // Kullanıcıyı tekrar bu controller'ın GetList action'ına yönlendiriyoruz ki kullanıcıya
                // eklenen ürünle birlikte tekrar ürün listesi gelsin.
                // MVC'de herhangi bir controller'ın herhangi bir action'ına yönlendirme için
                // RedirectToAction methodu kullanılır.
                // 1. yöntem:
                //return RedirectToAction("GetList", "Products");
                // 2. yöntem: controller ismini yazmamıza gerek yok çünkü zaten Products controller'ı içerisinde yönlendirme yapıyoruz.
                return RedirectToAction("GetList");
            }

            // Eğer product modeli validasyondan geçemezse tekrar kategori listesini doldurup
            // validasyon sonucuyla birlikte kullanıcının Create view'ındaki form üzerinden doldurup gönderdiği
            // product modelini Create view'ına gönderiyoruz ki kullanıcı validasyon hatalarını giderip
            // tekrar ürünü bu aksiyona gönderme (submit) işlemini gerçekleştirebilsin.

            // 1. yöntem: SelectList constructor'ına son parametre olarak (seçili değer yani selected value)
            // aksiyona gelen modelin CategoryId'sini gönderebiliriz ki view'da bu kategori seçili gelsin
            //ViewBag.Categories = new SelectList(_db.Categories.OrderBy(category => category.CategoryName).ToList(), "CategoryId", "CategoryName", product.CategoryId);
            // 2. yöntem: modelin CategoryId'sini son parametre üzerinden selected value olarak göndermesek de
            // view'da ürünün kategorisi bu CategoryId'ye göre seçili gelir
            ViewBag.Categories = new SelectList(_db.Categories.OrderBy(category => category.CategoryName).ToList(), "CategoryId", "CategoryName");
            
            return View("CreateWithTagHelpers", product);
        }



        /*
         8.1) Önce kullanıcının HTML form üzerinden verileri girebilmesi ve web sunucusuna 
         gönderebilmesi (post) için HttpGet action method'lu Edit action'ı üzerinden  
         Edit view'ını dönüyoruz. Action'daki id parametresi ürün listeleme view'ındaki (List)
         Edit link'i üzerinden route değeri ({controller}/{action}/{route değeri}) olarak gelecek, 
         biz de bu id'ye sahip ürünü veritabanından çekip kategori listesini de bir ViewBag'e 
         attıktan sonra ürünü Edit view'ına model olarak göndereceğiz.
        */
        public IActionResult Edit(int id)
        {
			// ürünle ilişkili verilere ihtiyacımız olmadığından Find methodunu kullandık
			Product product = _db.Products.Find(id); 

			ViewBag.Categories = new SelectList(_db.Categories.OrderBy(category => category.CategoryName).ToList(), "CategoryId", "CategoryName");

            return View("EditWithHtmlHelpers", product);
		}



        /*
         8.2) Kullanıcıdan Product tipindeki product parametresi (modeli) üzerinden verileri aldıktan sonra  
         veritabanından Product entity'sini ProductId'ye göre çekip özelliklerini product modeli üzerinden güncelliyoruz, 
         daha sonra DbContext'imizdeki Products DbSet'inde entity'i Update methodu ile güncelleyip son olarak da DbSet'teki 
         bu değişikliği SaveChanges methoduyla kaydediyoruz ve veritabanına iletiyoruz.
         Edit view'ındaki methodu post olan formun verilerini aşağıdaki HttpPost action method'u ile
         işaretlenmiş Edit action'ında parametre olarak gönderilen ve view'ın da modeli olan Product tipindeki 
         product parametresi üzerinden alıyoruz.
        */
        [HttpPost]
        public IActionResult Edit(Product product)
        {
            if (ModelState.IsValid) // eğer product modeli validasyondan geçerse
            {

                // product entity'sini Products DbSet'inden ProductId'ye göre çek.
                Product entity = _db.Products.Find(product.ProductId);

                // entity özelliklerini product modeline göre güncelle.
                entity.ProductName = product.ProductName;
                entity.UnitPrice = product.UnitPrice;
                entity.UnitsInStock = product.UnitsInStock;
                entity.CategoryId = product.CategoryId;
                entity.Discontinued = product.Discontinued;

                // product entity'sini Products DbSet'inde güncelle ve SaveChanges methodu ile ürün güncelleme işlemini veritabanına yansıt.
                _db.Products.Update(entity);
                _db.SaveChanges();

                // Kullanıcıyı tekrar bu controller'ın GetList action'ına yönlendiriyoruz ki kullanıcıya
                // eklenen ürünle birlikte tekrar ürün listesi gelsin.
                return RedirectToAction("GetList");
            }

            // Eğer product modeli validasyondan geçemezse tekrar kategori listesini doldurup
            // validasyon sonucuyla birlikte kullanıcının Edit view'ındaki form üzerinden doldurup gönderdiği
            // product modelini Edit view'ına gönderiyoruz ki kullanıcı validasyon hatalarını giderip
            // tekrar ürünü bu aksiyona gönderme (submit) işlemini gerçekleştirebilsin.
           
            ViewBag.Categories = new SelectList(_db.Categories.OrderBy(category => category.CategoryName).ToList(), "CategoryId", "CategoryName");

            return View("EditWithHtmlHelpers", product);
        }



		/*
         9.1) Kullanıcıdan aldığımız ürün ID verisi üzerinden entity'yi veritabanından çekiyoruz
         ve kullanıcının entity detayını görmesi, aynı zamanda da silme işlemini konfirme etmesi
         için Delete view'ına entity'i model olarak gönderiyoruz.
        */
		public IActionResult Delete(int id)
        {
            Product productEntity = _db.Products.Find(id);

			return View(productEntity);
		}



        /*
         9.2) Aşağıda örnek çağrımı "/Products/Delete/7" olan, kullanıcı Delete view'ında "Yes" butonuna bastığında
         çalışacak ve method adı ActionName attribute'u ile değiştirilmiş post action'ı üzerinden eğer bu entity'nin 
         ilişkili entity'leri varsa ilişkili entity'leri kendi DbSet'leri üzerinden RemoveRange ile siliyoruz. 
         Sonrasında bu entity ile ilgili DbSet üzerinden Remove methoduna bu entity'yi gönderiyoruz. Son olarak da 
         SaveChanges methodunu çağırıp DbSet'lerdeki tüm değişiklikleri tek seferde veritabanına iletiyoruz (Unit of Work). 
         Products, OrderDetails ile ilişkili olduğundan önce OrderDetails verilerini silmeliyiz.
        */
        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            Product productEntity = _db.Products.Include(product => product.OrderDetails)
                .SingleOrDefault(product => product.ProductId == id); // önce ürünü ürün siparişlerini de dahil ederek
                                                                      // veritabanından ID'ye göre çekiyoruz

            _db.OrderDetails.RemoveRange(productEntity.OrderDetails); // sonra ürünle ilişkili ürün sipariş kayıtlarını siliyoruz

            _db.Products.Remove(productEntity); // son olarak da ürün kaydını siliyoruz

            _db.SaveChanges(); // DbSet'lerdeki tüm değişiklikleri tek seferde Unit of Work olarak veritabanına yansıtıyoruz

			return RedirectToAction("GetList");
		}
    }
}
