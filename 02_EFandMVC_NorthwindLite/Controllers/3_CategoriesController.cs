#nullable disable
using _02_EFandMVC_NorthwindLite.Contexts;
using _02_EFandMVC_NorthwindLite.DTOs;
using _02_EFandMVC_NorthwindLite.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace _02_EFandMVC_NorthwindLite.Controllers
{
    public class CategoriesController : Controller
    {
        private readonly NorthwindLiteV2Context _context;

        public CategoriesController(NorthwindLiteV2Context context)
        {
            _context = context;
        }

        // GET: Categories
        public IActionResult Index()
        {
            var categoryDTOs = _context.Categories.Include(c => c.Products).OrderBy(c => c.CategoryName)
                .Select(c => new CategoryDTO()
                {
                    CategoryId = c.CategoryId,
                    CategoryName = c.CategoryName,

                    ProductsCountOutput = c.Products.Count, // her bir kategoriye bağlı ürün sayısı
                });
            return View(categoryDTOs);
        }

        // GET: Categories/Details/5
        public IActionResult Details(int id)
        {
            var categoryEntity = _context.Categories.Include(c => c.Products).SingleOrDefault(m => m.CategoryId == id);

            if (categoryEntity is null)
            {
                // 404 Not Found HTTP Status Code yerine kendi oluşturduğumuz Views -> Shared
                // klasörü altındaki ve Shared klasöründe olduğu için projemizdeki tüm action
                // ve view'larda kullanabileceğimiz "_Error" partial view'ına mesajı
                // model olarak gönderip kullanıcının istediğimiz mesajı görmesini sağlayabiliriz
                //return NotFound();
                return View("_Error", "Category not found.");
            }

            return View(new CategoryDTO()
            {
                CategoryId = categoryEntity.CategoryId,
                CategoryName = categoryEntity.CategoryName,
                Description = categoryEntity.Description,

                // kategoriye bağlı olan ürünleri adlarına göre sıralayıp ürün adlarını "<br />"
                // yeni satır HTML tag'i üzerinden birleştirerek elde ettiğimiz string'i
                // ProductNamesOutput özelliğine atıyoruz
                ProductNamesOutput = string.Join("<br />", categoryEntity.Products.OrderBy(p => p.ProductName)
                    .Select(p => p.ProductName))
            });
        }

        // GET: Categories/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Categories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(CategoryDTO category)
        {
            if (ModelState.IsValid)
            {

                // Categories veritabanı tablosunda kategori adları tekil olmalıdır,
                // koşulun iki tarafında ToUpper veya ToLower methodları kullanılarak
                // case sensitivity (büyük küçük harf duyarlılık) devre dışı bırakılabilir.
                // Eğer tabloda girilen kategori adına sahip kayıt yoksa DTO entity'e
                // dönüştürülerek ekleme işlemi gerçekleştirilecek.
                if (!_context.Categories.Any(c => c.CategoryName.ToUpper() == category.CategoryName.ToUpper().Trim()))
                {
                    _context.Add(new Category()
                    {
                        CategoryName = category.CategoryName.Trim(), // kullanıcının olası gönderdiği boşlukları temizleyelim

                        /* 1. yöntem: */
                        //Description = category.Description is not null ? category.Description.Trim() : null
                        /* 2. yöntem: */
                        Description = category.Description?.Trim() // Description'ın null gelebilme ihtimali olduğundan ? kullandık,
                                                                   // eğer null gelmezse Description değerinin başındaki ve sonundaki
                                                                   // boşluklar temizlenerek entity'nin Description özelliğine atanacak,
                                                                   // null gelirse entity'nin Description özelliğine null atanacak
                    });
                    _context.SaveChanges();

                    return RedirectToAction(nameof(Index));
                }

                ModelState.AddModelError("", "A category with the same name already exists!");
                
            }

            return View(category);
        }

        // GET: Categories/Edit/5
        public IActionResult Edit(int id)
        {
            var categoryEntity = _context.Categories.Find(id);

            if (categoryEntity == null)
            {
                return View("_Error", "Category not found.");
            }

            return View(new CategoryDTO()
            {
                CategoryId = categoryEntity.CategoryId,
                CategoryName = categoryEntity.CategoryName,
                Description = categoryEntity.Description
            });
        }

        // POST: Categories/Edit
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(CategoryDTO category)
        {
            if (ModelState.IsValid)
            {

                // Categories veritabanı tablosunda kategori adları güncellenecek kayıt dışında
                // (c.CategoryId != category.CategoryId koşulu) tekil olmalıdır
                if (!_context.Categories.Any(c => c.CategoryName.ToUpper() == category.CategoryName.ToUpper().Trim()
                    && c.CategoryId != category.CategoryId))
                {
                    _context.Update(new Category()
                    {
                        CategoryId = category.CategoryId, // mutlaka atanmalıdır
                        CategoryName = category.CategoryName.Trim(),
                        Description = category.Description?.Trim()
                    });
                    _context.SaveChanges();

                    return RedirectToAction(nameof(Index));
                }

                ModelState.AddModelError("", "A category with the same name already exists!");

            }

            return View(category);
        }

        // GET: Categories/Delete/5
        public IActionResult Delete(int id)
        {
            var categoryEntity = _context.Categories.Include(c => c.Products).SingleOrDefault(m => m.CategoryId == id);

            if (categoryEntity is null)
            {
                return View("_Error", "Category not found.");
            }

            return View(new CategoryDTO()
            {
                CategoryId = categoryEntity.CategoryId,
                CategoryName = categoryEntity.CategoryName,
                Description = categoryEntity.Description,

                ProductNamesOutput = string.Join("<br />", categoryEntity.Products.OrderBy(p => p.ProductName)
                    .Select(p => p.ProductName))
            });
        }

        // POST: Categories/Delete
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var categoryEntity = _context.Categories.Include(c => c.Products).SingleOrDefault(m => m.CategoryId == id);

            if (categoryEntity is null)
            {
                return View("_Error", "Category not found.");
            }

            // eğer silinmek istenen kategorinin ilişkili en az bir ürün kaydı varsa silme işlemini
            // gerçekleştirmeyip kullanıcıya silmek istediğiniz kategoriye bağlı ürünler bulunmaktadır
            // mesajını örneğin ViewBag üzerinden göstermeliyiz, eğer kullanıcı kategoriyi gerçekten
            // silmek istiyorsa önce ilişkili ürünleri tek tek siler daha sonra da kategoriyi silebilir
            // 1. yöntem: 
            //if (categoryEntity.Products is not null &&  categoryEntity.Products.Count > 0) 
            // 2. yöntem:
            if (!(categoryEntity.Products is not null &&  categoryEntity.Products.Any())) 
            {
                _context.Remove(categoryEntity);
                _context.SaveChanges();

                return RedirectToAction(nameof(Index));
            }

            ViewBag.ErrorMessage = "Category can't be deleted because it has relational products!";

            return View(new CategoryDTO()
            {
                CategoryId = categoryEntity.CategoryId,
                CategoryName = categoryEntity.CategoryName,
                Description = categoryEntity.Description,

                ProductNamesOutput = string.Join("<br />", categoryEntity.Products.OrderBy(p => p.ProductName)
                    .Select(p => p.ProductName))
            });
        }
	}
}
