#nullable disable
using _02_EFandMVC_NorthwindLite.Contexts;
using _02_EFandMVC_NorthwindLite.DTOs;
using _02_EFandMVC_NorthwindLite.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace _02_EFandMVC_NorthwindLite.Controllers
{
    // Sipariş CRUD (Create, Read, Update, Delete) işlemlerini gerçekleştireceğimiz ve MVC
    // kütüphanesinin Controller sınıfından miras aldığımız sipariş controller sınıfı.
    // MVC Scaffolding mekanizması üzerinden /Controllers klasörüne fare ile sağ tıklanıp
    // Add -> Controller tıklandıktan sonra "MVC Controller with views, using Entity Framework"
    // tıklanarak açılan pencerede "Model class" Order (her zaman entity seçilmelidir), 
    // "DbContext class" da projede kullandığımız DbContext'ten miras alan sınıf ki burada
    // NorthwindLiteV2Context seçilerek eğer view'ların da seçilen entity model olarak
    // kullanılarak oluşturulması isteniyorsa "Generate views" işaretlenmeli, eğer oluşturulacak
    // tüm view'larda jQuery Validation üzerinden tarayıcı bazlı validasyon (client side validation)
    // yapılmak isteniyorsa "Reference script libraries" işaretlenmeli (genelde işaretlenmez,
    // işaretlenmezse validasyon sunucu bazlı (server side validation) olarak post action'larında
    // ModelState üzerinden gerçekleşir, sadece create ve edit işlemlerinde client side validation yapılmalıdır),
    // eğer oluşturulacak view'ların /Views klasöründe _ViewStart.cshtml'de belirtilen /Views/Shared/_Layout.cshtml
    // layout view'ını kullanmaları isteniyorsa "Use a layout page" işaretlenerek bir altındaki text box boş bırakılabilir
    // ve son olarak da eğer istenirse "Controller name" üzerinden oluşturulacak controller adı değiştirilerek
    // istenen controller, tüm controller action'ları ve tüm view'lar seçilen entity modeli üzerinden oluşturulabilir.
    public class OrdersController : Controller
    {
        private readonly NorthwindLiteV2Context _context;

        public OrdersController(NorthwindLiteV2Context context)
        {
            _context = context;
        }



        /*
         1) Genelde entity'ler action ve view'larda model olarak kullanılmaz. Entity'ler üzerinden oluşturulan
         Model veya Data Transfer Object (DTO) class'ları üzerinden entity verileri DTO tipindeki objeye 
         bind edilir (bağlanır, yani entity özellik verileri DTO özelliklerine atanır) ve view'a DTO objesi
         model olarak gönderilerek view'da kullanılır. Bu işlem read yani listeleme ve detay için geçerlidir.
         Yeni kayıt oluşturma ve mevcut kaydı güncelleme için de ilgili view'larda yine DTO modeli kullanılır
         ve Create ile Edit action'larında parametre olarak DTO tipindeki obje alınarak bu obje üzerinden ilgili
         entity mapping (DTO özelliklerinin entity özelliklerine atanması) gerçekleştirilerek veritabanında 
         ekleme veya güncelleme işlemi gerçekleştirilir.
        */
        // GET: Orders (veya Orders/Index)
        public IActionResult Index()
        {
            // önce DbContext'ten miras alan _context objesi üzerinden Orders DbSet'ine ulaşarak
            // o (order) delegesi üzerinden önce zorunlu teslimat tarihine (RequiredDate) göre azalan,
            // aynı RequiredDate'e sahip siparişler için o (order) delegesi üzerinden teslimat tarihine
            // (ShippedDate) göre azalan, aynı RequiredDate ve ShippedDate'e sahip siparişler için de
            // o (order) delegesi üzerinden müşteri ID'sine (CustomerId) göre artan sıralama yapıyoruz
            // ve o (order) delegesi üzerinden Order tipinde elde ettiğimiz kolleksiyonu
            // (IOrderedQueryable<Order> yani sıralı IQueryable<Order> şeklinde düşünülebilir)
            // Select LINQ methodu ile o (order) delegesi üzerinden kolleksiyondaki her bir Order tipindeki
            // eleman için yeni bir OrderDTO tipindeki elemana mapping (sınıf özelliklerinin atanması)
            // işlemini yaparak elde ettiğimiz IQueryable<OrderDTO> sorgusunu ToList LINQ methodu ile
            // OrderDTO listesine dönüştürüp orderDTOs'a atıyoruz. Select LINQ methoduyla yapılan
            // işleme projeksiyon (projection) işlemi de denir.
            var orderDTOs = _context.Orders.OrderByDescending(o => o.RequiredDate).
                ThenByDescending(o => o.ShippedDate).ThenBy(o => o.CustomerId)
                .Select(o => new OrderDTO()
                {
                    // DTO'daki entity özelliklerinin atanması (map edilmesi)
                    OrderId = o.OrderId,
                    CustomerId = o.CustomerId,
                    OrderDate = o.OrderDate.Value, // mutlaka verisi olacağından Value ile değerini kullanıyoruz
                    RequiredDate = o.RequiredDate.Value,
                    ShippedDate = o.ShippedDate,

					// view'larda gösterim için DTO'daki DateTime tipindeki özelliklerin İngilizce tarih
					// formatıyla string olarak atanması (map edilmesi),
					// format -> MM: iki hane ay, dd: iki hane gün, yyyy: dört hane yıl,
					// HH: 24 saat formatında iki hane saat, mm: iki hane dakika, ss: iki hane saniye

					// 1. yöntem:
					//OrderDateOutput = o.OrderDate != null ? o.OrderDate.Value.ToString("MM/dd/yyyy", new CultureInfo("en-US")) : "",
					// 2. yöntem:
					//OrderDateOutput = o.OrderDate.HasValue ? o.OrderDate.Value.ToString("MM/dd/yyyy HH:mm:ss", new CultureInfo("en-US")) : "",
                    // 3. yöntem: // bölgesel ayarı Program.cs'de Localization region'ları üzerinden konfigüre ettiğimizden
                                  // artık tarih ve ondalık veriler için CultureInfo kullanmamıza gerek yok
                    OrderDateOutput = o.OrderDate.HasValue ? o.OrderDate.Value.ToString("MM/dd/yyyy HH:mm:ss") : "",

                    RequiredDateOutput = o.RequiredDate.HasValue ? o.RequiredDate.Value.ToString("MM/dd/yyyy") : "",
                    ShippedDateOutput = o.ShippedDate.HasValue ? o.ShippedDate.Value.ToString("MM/dd/yyyy") : "Not shipped"
                }).ToList();

            return View(orderDTOs); // bir yukarıda elde ettiğimiz listeyi model olarak view'a gönderiyoruz.
        }

        /* 
         2) Details get action'ında Index view'ındaki Details link'i üzerinden route value olarak id
         değerini alarak _context üzerinden gönderilen id parametresine göre tek bir sipariş entity'sini
         ilişkili ürün sipariş ve ürün kayıtlarını da include (dahil) ederek çekip eğer çekilen sipariş entity objesi 
         null ise 404 HTTP Status Code (kaynak bulunamadı HTTP durum kodu), null değilse entity objesini 
         DTO objesine dönüştürerek (mapping) Details view'ına DTO objesini model olarak gönderiyoruz.
        */
        // GET: Orders/Details/5
        public IActionResult Details(int id)
        {
            // o: Order, od: OrderDetails tipindeki delegeler
            var orderEntity = _context.Orders.Include(o => o.OrderDetails).ThenInclude(od => od.Product)
                .SingleOrDefault(o => o.OrderId == id);

            // 1. yöntem:
            //if (orderEntity == null)
            // 2. yöntem:
            if (orderEntity is null)
            {
                return NotFound(); // 404 HTTP Status Code içeren response (yanıt) döner
            }

            // Order tipindeki entity'i OrderDTO tipindeki DTO'ya mapping işlemi
            var orderDTO = new OrderDTO()
            {
                // DTO'daki entity özelliklerinin atanması (map edilmesi)
                OrderId = orderEntity.OrderId,
                CustomerId = orderEntity.CustomerId,
                OrderDate = orderEntity.OrderDate.Value,
                RequiredDate = orderEntity.RequiredDate.Value,
                ShippedDate = orderEntity.ShippedDate,

                // view'larda gösterim için DTO'daki DateTime tipindeki özelliklerin İngilizce tarih
                // formatıyla string olarak atanması (map edilmesi)
                OrderDateOutput = orderEntity.OrderDate.Value.ToString("MM/dd/yyyy HH:mm:ss"),
                RequiredDateOutput = orderEntity.RequiredDate.Value.ToString("MM/dd/yyyy"),

                ShippedDateOutput = orderEntity.ShippedDate.HasValue ?
                    orderEntity.ShippedDate.Value.ToString("MM/dd/yyyy") : "Not shipped",

                // view'larda gösterim için DTO'da sipariş entity'si ile ilişkili sipariş detayı entity kolleksiyonu
                // üzerinden her bir sipariş detayı entity'sinin ürün entity adına ulaşarak elde edilen ürün adları
                // string kolleksiyonu string tipinin (sınıfının) Join methoduna "<br />" HTML tag ayracı üzerinden
                // gönderilerek siparişle ilişkili tüm ürünlerin adlarının ayraçla birlikte string olarak
                // dönmesi sağlanır ve bu string ProductNamesOutput özelliğine atanarak bu özellik view'larda kullanılır.

                // * 1. yöntem:
                //ProductNamesOutput = ""
                // * 2. yöntem:
                ProductNamesOutput = string.Join("<br />", orderEntity.OrderDetails.Select(od => od.Product.ProductName))
            };

            // * 1 .yöntem:
            //if (orderEntity.OrderDetails is not null && orderEntity.OrderDetails.Any()) // Any() yerine Count > 0 da kullanılabilir
            //{
            //    var seperator = "<br />";
            //    foreach (var orderDetail in orderEntity.OrderDetails)
            //    {
            //        orderDTO.ProductNamesOutput += orderDetail.Product.ProductName + seperator;
            //    }

            //    orderDTO.ProductNamesOutput = orderDTO.ProductNamesOutput.Substring(0, orderDTO.ProductNamesOutput.Length - seperator.Length);
            //    //orderDTO.ProductNamesOutput = orderDTO.ProductNamesOutput.TrimEnd(seperator.ToCharArray()); 
            //    // bir yukarıdaki satır ile de sondaki br tag'i temizlenebilir

            //}

            return View(orderDTO);
        }

        /*
         3.1) Create get action'ı OrderDTO modelini kullanan Create view'ını döner ki kullanıcı
         OrderDTO modeli üzerinden verileri girip Create post action'ına gönderebilsin.
        */
        // GET: Orders/Create
        public IActionResult Create()
        {
            // View'da çoklu seçim yapılabilen liste (list box) için yazı olarak ürün adlarını 
            // değer olarak da ürün ID'lerini tutan listeyi MultiSelectList objesi oluşturarak
            // ViewBag üzerinden view'a taşıyoruz.
            ViewBag.Products = new MultiSelectList(_context.Products.OrderBy(p => p.ProductName).ToList(), 
                "ProductId", "ProductName");

            return View();
        }

        /*
         3.2) Create post action'ı view'dan model olarak aldığı OrderDTO objesi üzerinden
         OrderDTO'daki data annotation'lara ek olarak mevcut müşteri ve zorunlu teslim tarihine sahip kayıt 
         veritabanı tablosunda var mı validasyonunu da yaparak eğer validasyondan geçerse sipariş DTO'sunu
         sipariş entity'sine dönüştürerek siparişler DbSet'ine ekleyecek, validasyondan geçemezse 
         ekleme işlemi yapmadan kullanıcıya validasyon hata mesajını view'a göndererek dönecek.
        */
        // POST: Orders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken] // ilgili view'da AntiForgeryToken HTML Helper'ının ürettiği
                                   // şifreli string verisini kontrol eder ki bu action'a
                                   // verilerin ilgili view'ından geldiğini tespit etsin,
                                   // eğer veriler ilgili view dışından gelirse istek (request)
                                   // içerisinde bu şifreli string olmayacağından action'ın
                                   // çalışmasını engeller
        public IActionResult Create(OrderDTO order)
        {
            if (ModelState.IsValid) // eğer model DTO data annotation validasyonlarından geçerse
            {

                // Sipariş veritabanı tablosunda (Orders) müşteri (CustomerId) ve gerekli teslim tarihi (RequiredDate)
                // tekil olmalıdır yani bir müşteri bir gerekli teslim tarihi için sipariş oluşturabilir, dolayısıyla
                // sipariş kaydını veritabanına eklemeden önce müşteri ID ve gerekli teslim tarihi üzerinden tabloda
                // kayıt var mı diye kontrol etmeliyiz, eğer varsa kullanıcıya daha önce girdiğiniz müşteri ve
                // gerekli teslim tarihi üzerinden kayıt oluşturmuşsunuz demeliyiz, eğer yoksa sipariş kaydını
                // veritabanına ekleyeceğiz
                // 1. yöntem:
                //var existingOrder = _context.Orders.SingleOrDefault(o => o.CustomerId == order.CustomerId.Trim()
                //    && o.RequiredDate == order.RequiredDate);
                //if (existingOrder is null) // mevcut sipariş kaydı yok demektir, ekleme işlemine devam edebiliriz
                // 2. yöntem: girilen müşteri ID ve gerekli teslim tarihine sahip herhangi bir kayıt var mı (any)
                if (!_context.Orders.Any(o => o.CustomerId == order.CustomerId.Trim()
                    && o.RequiredDate == order.RequiredDate)) // eğer koşullara uyan mevcut sipariş kaydı yoksa
                                                              // ekleme işlemine devam edebiliriz, bu yüzden !
                                                              // ile tüm koşulun değilini aldık
                {

                    // model olarak gelen DTO'yu entity'e dönüştürüp veritabanında
                    // ilgili tablosuna ekleyip kaydediyoruz
                    // 1. yöntem:
                    // _context.Orders.Add(new Order()
                    // 2. yöntem:
                    _context.Add(new Order()
                    {

                        // ihtiyaca göre model verileri entity'e dönüştürülürken veri üzerinden düzeltme
                        // işlemleri gerçekleştirilebilir, örneğin string verilerin başındaki ve sonundaki
                        // boşluklar Trim methoduyla temizlenebilir
                        CustomerId = order.CustomerId.Trim(),

                        OrderDate = DateTime.Now, // şimdiki tarih ve saat ataması

                        // Kullanıcının tarayıcısından aldığımız tarihin formatıyla web uygulamamızın tarih formatı
                        // aynı bölge (kültür) için olmalıdır, bunun için Create view'ında tarih formatını İngilizce
                        // olarak belirledik, web uygulamamızda da Program.cs altında web uygulamamızın kullanacağı
                        // bölge ayarını Localization region'ları altında konfigure ediyoruz. Bölgesel ayar genelde
                        // tarih ve ondalık sayı tiplerini etkiler.
                        RequiredDate = order.RequiredDate,

                        ShippedDate = order.ShippedDate,

                        // View'dan aldığımız OrderDTO modelinin ProductIdsInput kolleksiyonundaki her bir product ID
                        // için Order entity'sinin OrderDetails ilişkili kolleksiyonunda OrderDetail tipinde bir obje
                        // oluşturup objenin ProductId özelliğini atamalıyız. Bu işleme ProductIdsInput kolleksiyonunun
                        // OrderDetails kolleksiyonuna projekte edilmesi denir.
                        OrderDetails = order.ProductIdsInput.Select(productId => new OrderDetail()
                        {
                            ProductId = productId
                        }).ToList()

                    });

                    _context.SaveChanges();

                    // ViewData veya ViewBag üzerinden action'ın view'ına herhangi bir obje
                    // taşınabilirken eğer başka bir action'a yönlendirme yapılıyorsa
                    // obje TempData üzerinden yönlendirilen action'ın view'ına taşınır.
                    // Burada Index view'ında TempData'yı kullanacağız.
                    TempData["SuccessMessage"] = "Order created successfully.";

                    // 1. yöntem: action adı string olarak belirtilebilir
                    //return RedirectToAction("Index");
                    // 2. yöntem: Index action'ının method adı nameof üzerinden string olarak belirtilebilir
                    return RedirectToAction(nameof(Index));

                }

                // Validasyon mesajı 1. yöntem: mevcut sipariş kaydı var validasyon mesajı ViewBag üzerinden
                //                              Create view'ına taşınabilir.
                //ViewBag.ErrorMessage = "An order with the same Customer ID and Required Date already exists!";
                // Validasyon mesajı 2. yöntem: view'da validation summary kullanılıyorsa validasyon mesajı ModelState
                //                              üzerinden Create view'ının validation summary'sine taşınabilir.
                ModelState.AddModelError("", "An order with the same Customer ID and Required Date already exists!");

            }

            // 1. yöntem: istenirse model üzerinden kullanıcının seçtiği ürünlerin de seçili gelmesi için
            //            MultiSelectList constructor'ına son parametre gönderilebilir
            //ViewBag.Products = new MultiSelectList(_context.Products.OrderBy(p => p.ProductName).ToList(), 
            //    "ProductId", "ProductName", order.ProductIdsInput);
            // 2. yöntem: MultiSelectList constructor'ına seçili olacak ürün ID'leri parametresi
            //            gönderilmese de yine list box'da bu ürünler seçili gelecektir
            ViewBag.Products = new MultiSelectList(_context.Products.OrderBy(p => p.ProductName).ToList(), 
                "ProductId", "ProductName");

            return View(order);
        }

        /*
         4.1) Edit get action'ı gönderilen id parametresine göre OrderDTO tipi üzerinden sipariş kaydını
         çekip Edit view'ına model olarak gönderir ki kullanıcı model üzerinden verileri girip 
         Edit post action'ına gönderebilsin.
        */
        // GET: Orders/Edit/5
        public IActionResult Edit(int id)
        {
            var orderEntity = _context.Orders.Include(o => o.OrderDetails).SingleOrDefault(o => o.OrderId == id);

            if (orderEntity is null)
            {
                return NotFound(); // 404 Not Found HTTP Status Code
            }

            var order = new OrderDTO()
            {
                // view'da veri güncellenmesi için atanan ilk DTO input özellik verileri
                OrderId = orderEntity.OrderId,
                CustomerId = orderEntity.CustomerId,
                OrderDate = orderEntity.OrderDate.Value,
                RequiredDate = orderEntity.RequiredDate.Value,
                ShippedDate = orderEntity.ShippedDate,
                ProductIdsInput = orderEntity.OrderDetails.Select(od => od.ProductId).ToList()
            };

            // view'da model üzerinden gönderilen veri dışında ekstra ihtiyaç duyulan seçim için tüm ürün listesi
            ViewBag.Products = new MultiSelectList(_context.Products.OrderBy(p => p.ProductName).ToList(),
                "ProductId", "ProductName");

            return View(order);
        }

        /*
         4.2) Edit post action'ı view'dan model olarak aldığı OrderDTO objesi üzerinden
         OrderDTO'daki data annotation'lara ek olarak mevcut müşteri ve zorunlu teslim tarihine sahip 
         güncellenmek istenen kayıt dışında veritabanı tablosunda kayıt var mı validasyonunu da 
         yaparak eğer validasyondan geçerse sipariş DTO'sunu sipariş entity'sine dönüştürerek 
         siparişler DbSet'inde güncelleyecek, validasyondan geçemezse güncelleme işlemi yapmadan 
         kullanıcıya validasyon hata mesajını view'a göndererek dönecek. Birinci yöntem olarak 
         Products controller'ının Edit post action'ında yapıldığı şekilde önce
         sipariş entity DbSet'inden parametre olarak gönderilen sipariş modelinin ID'sine sahip
         kayıt çekilip özellikleri güncellenebilir, ikinci yöntem olarak da parametre olarak gönderilen
         sipariş modeli üzerinden yeni bir sipariş entity'si new'lenerek ID'si ve diğer özellikleri
         model üzerinden atanır ve güncelleme işlemi gerçekleştirilebilir. İkinci yöntemde
         ID'nin view'da hidden bir input HTML tag'inde saklandığından emin olunmalıdır.
        */
        // POST: Orders/Edit
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(OrderDTO order)
        {
            if (ModelState.IsValid)
            {
                
                // Sipariş veritabanı tablosunda (Orders) müşteri (CustomerId) ve gerekli teslim tarihi (RequiredDate)
                // güncellenen kayıt dışında (o.OrderId != order.OrderId koşulu) tekil olmalıdır.
                if (!_context.Orders.Any(o => o.CustomerId == order.CustomerId.Trim()
                    && o.RequiredDate == order.RequiredDate && o.OrderId != order.OrderId))
                {

                    // önce ilişkili sipariş ürün kayıtları (OrderDetails) ilgili entity set'inden sipariş ID'ye göre silinir
                    _context.OrderDetails.RemoveRange(_context.OrderDetails.Where(od => od.OrderId == order.OrderId));

                    var orderEntity = new Order()
                    {
                        OrderId = order.OrderId, // güncelleme için mutlaka atanmalıdır
                        CustomerId = order.CustomerId.Trim(),
                        OrderDate = order.OrderDate,
                        RequiredDate = order.RequiredDate,
                        ShippedDate = order.ShippedDate,

                        // sonra ilişkili sipariş ürün kayıtları (OrderDetails) ürün ID'leri üzerinden oluşturulur
                        OrderDetails = order.ProductIdsInput.Select(productId => new OrderDetail()
                        {
                            ProductId = productId
                        }).ToList()
                    };

                    // 1. yöntem:
                    //_context.Orders.Update(orderEntity);
                    // 2. yöntem:
                    _context.Update(orderEntity);

                    _context.SaveChanges(); // güncelleme işleminden sonra OrderDetails ve Orders DbSet'lerindeki
                                            // tüm değişiklikler tek seferde veritabanına yansıtılır (Unit of Work)

                    TempData["SuccessMessage"] = "Order updated successfully.";
                    return RedirectToAction(nameof(Index));
                }

                ModelState.AddModelError("", "An order with the same Customer ID and Required Date already exists!");
                
            }

            // view'da model üzerinden gönderilen veri dışında ekstra ihtiyaç duyulan seçim için tüm ürün listesi
            ViewBag.Products = new MultiSelectList(_context.Products.OrderBy(p => p.ProductName).ToList(),
                "ProductId", "ProductName");

            return View(order);
        }

        /* Kayıt silme 1. yöntem: */
        /*
         5.1) Delete get action'ı gelen id parametresine göre siparişi veritabanı tablosundan çekip
         DTO'ya dönüştürerek model olarak view'a gönderecek, view içerisinde de sipariş detayını 
         yazdırmak için Details view'ında da kullanılan _Details partial view'ına model gönderilerek 
         hem Delete hem de Details view'larında sipariş detayı için aynı partial view kullanılmış olacak.
        */
        // GET: Orders/Delete/5
        //public IActionResult Delete(int id)
        //{
        //    var orderEntity = _context.Orders.Include(o => o.OrderDetails).ThenInclude(od => od.Product)
        //        .SingleOrDefault(o => o.OrderId == id);

        //    if (orderEntity == null)
        //    {
        //        return NotFound(); // 404 Not Found HTTP Status Code
        //    }

        //    var orderDTO = new OrderDTO()
        //    {
        //        OrderId = orderEntity.OrderId,
        //        CustomerId = orderEntity.CustomerId,
        //        OrderDate = orderEntity.OrderDate.Value,
        //        RequiredDate = orderEntity.RequiredDate.Value,
        //        ShippedDate = orderEntity.ShippedDate,

        //        OrderDateOutput = orderEntity.OrderDate.Value.ToString("MM/dd/yyyy HH:mm:ss"),
        //        RequiredDateOutput = orderEntity.RequiredDate.Value.ToString("MM/dd/yyyy"),
        //        ShippedDateOutput = orderEntity.ShippedDate.HasValue ?
        //            orderEntity.ShippedDate.Value.ToString("MM/dd/yyyy") : "Not shipped",
        //        ProductNamesOutput = string.Join("<br />", orderEntity.OrderDetails.Select(od => od.Product.ProductName))
        //    };

        //    return View(orderDTO);
        //}

        /* Kayıt silme 1. yöntem: */
        /* 
         5.2) Kullanıcı Delete view'ında "Yes" submit butonuna bastığında butonun içerisinde bulunduğu
         post methodlu form sipariş ID'sini ActionName üzerinden route (yolu) değiştirilmiş
         DeleteConfirmed post action'ına parametre olarak gönderecek, önce siparişle ilişkili 
         ürün sipariş kayıtları daha sonra da sipariş kaydı silinecek.
        */
        // POST: Orders/Delete
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public IActionResult DeleteConfirmed(int id)
        //{
        //    var orderEntity = _context.Orders.Include(o => o.OrderDetails).SingleOrDefault(o => o.OrderId == id);

        //    // 1. yöntem:
        //    //_context.OrderDetails.RemoveRange(orderEntity.OrderDetails);
        //    // 2. yöntem:
        //    _context.RemoveRange(orderEntity.OrderDetails);

        //    // 1. yöntem:
        //    //_context.Orders.Remove(orderEntity);
        //    // 2. yöntem:
        //    _context.Remove(orderEntity);

        //    _context.SaveChanges();

        //    TempData["SuccessMessage"] = "Order deleted successfully.";

        //    return RedirectToAction(nameof(Index));
        //}

        /* Kayıt silme 2. yöntem: AlertifyJS */
        public IActionResult Delete(int id)
        {
            var orderEntity = _context.Orders.Include(o => o.OrderDetails).SingleOrDefault(o => o.OrderId == id);

            // 1. yöntem:
            //_context.OrderDetails.RemoveRange(orderEntity.OrderDetails);
            // 2. yöntem:
            _context.RemoveRange(orderEntity.OrderDetails);

            // 1. yöntem:
            //_context.Orders.Remove(orderEntity);
            // 2. yöntem:
            _context.Remove(orderEntity);

            _context.SaveChanges();

            TempData["SuccessMessage"] = "Order deleted successfully.";

            return RedirectToAction(nameof(Index));
        }
    }
}
