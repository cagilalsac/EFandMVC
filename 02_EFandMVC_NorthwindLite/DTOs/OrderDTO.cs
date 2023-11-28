// nullable disable yapılarak sınıf özellik tiplerinde referans tipler için ? (nullable)
// kullanımı ortadan kaldırılabilir ve bu özelliklerin veri atama zorunlulukları Required
// data annotation'ı ile gerçekleştirilebilir.
// nullable disable genelde sadece DTO (model) ve entity'lerde kullanılmalıdır.
// Bu projede entity'leri veritabanı üzerinden oluşturduğumuzdan (Database first approach)
// entity'lere dokunmuyoruz, sadece DTO üzerinde ihtiyaç olan işlemleri gerçekleştiriyoruz.
#nullable disable

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace _02_EFandMVC_NorthwindLite.DTOs
{
    public class OrderDTO
    {
        // ilgili entity'de referans olmayan özellikler veya başka bir deyişle veritabanındaki ilgili tablosundaki
        // sütun karşılığı olan özellikler entity'den kopyalanır.
        #region Entity'den Kopyalanan Özellikler
        public int OrderId { get; set; } // nullable olmayan (null atanamayan, zorunlu) değer tip özellik

        [DisplayName("Customer")] // her view'da elle Customer yazmak yerine model (DTO) üzerinden
                                  // bu özelliğin DisplayName'ini kullanacağız, eğer yazılmazsa DisplayName
                                  // üzerinden özelliğin adı (CustomerId) kullanılır.
                                  // DisplayName bir C# Attribute'udur, modellerde (DTO)
                                  // kullanıldığında Data Annotation ismini alır. Attribute'lar özel
                                  // kullanımlı sınıflardır ve üzerinde kullanıldıkları class, field,
                                  // property veya behavior'lara yeni özellikler kazandırır ve kazandırılan
                                  // bu yeni özellikler gerekli yerlerde kullanılabilir. Attribute'lar üzerinden
                                  // Aspect Oriented Programming gerçekleştirilmiş olur.
        [Required] // kullanıcıdan gelen DTO (model) verisi validasyonu için zorunlu olacağını belirtir,
                   // genelde referans ve nullable tipler için kullanılır
        [StringLength(5)] // string tipteki özelliklerin maksimum girilebilecek karakter sayısını belirler
        public string CustomerId { get; set; } // nullable (null atanabilen, zorunlu olmayan) referans tip özellik,
											   // genelde değer tipler için örneğin int? (Nullable<int>)
											   // nullable kullanılır ancak .NET 6 ile birlikte referans
											   // tipler için de örneğin string? nullable kullanımı gelmiştir
											   // ve değer tiplerde olduğu gibi referans tiplerde de
											   // veri girişi zorunluluğu (required) validasyonunu tetikler

		// 1. yöntem: Order entity'sinde zorunlu olmasa da DTO (model) üzerinde ihtiyaca göre
		//            OrderDate özelliği veri girişi zorunlu hale getirilebilir
		//[Required] 
		//[DisplayName("Order Date")]
		//public DateTime? OrderDate { get; set; } // nullable (null atanabilen, zorunlu olmayan) değer tip özellik
		// 2. yöntem: değer tiplerde ? (nullable) tip kullanılmazsa veri girişi zorunlu hale gelir
		[DisplayName("Order Date")]
		public DateTime OrderDate { get; set; } // nullable olmayan (null atanamayan, zorunlu) değer tip özellik 

        [DisplayName("Required Date")]
		public DateTime RequiredDate { get; set; } // RequiredDate de zorunlu olsun 

		[DisplayName("Shipped Date")]
		public DateTime? ShippedDate { get; set; } // ShippedDate zorunlu olmasın
        #endregion



        // ihtiyaç halinde view'larda gösterim veya veri girişi için entity verilerini özelleştirip
        // (formatlama, ilişkili entity referansı üzerinden özellik kullanma, vb.) kullanacağımız
        // yeni özellikler oluşturulabilir.
        #region View'larda Gösterim veya Veri Girişi için Kullanacağımız Özellikler
        [DisplayName("Order Date")] 
        public string OrderDateOutput { get; set; } // OrderDate özelliği üzerinden formatlanarak atanacak,
                                                    // OrderDate null değer alabileceği için nullable tanımladık,
                                                    // view'larda gösterim için kullanacağımızdan sonuna Output ekledik

        [DisplayName("Required Date")]
        public string RequiredDateOutput { get; set; } // RequiredDate özelliği üzerinden formatlanarak atanacak,
                                                       // RequiredDate null değer alabileceği için nullable tanımladık,
                                                       // view'larda gösterim için kullanacağımızdan sonuna Output ekledik

        [DisplayName("Shipped Date")]
        public string ShippedDateOutput { get; set; } // ShippedDate özelliği üzerinden formatlanarak atanacak,
                                                      // ShippedDate null değer alabileceği için nullable tanımladık,
                                                      // view'larda gösterim için kullanacağımızdan sonuna Output ekledik

        [DisplayName("Products")]
        public string ProductNamesOutput { get; set; } // Order entity'sinin ilişkili olduğu OrderDetail entity
                                                       // kolleksiyonu üzerinden OrderDetail entity'sinin
                                                       // ilişkili olduğu Product entity'sinin ProductName
                                                       // özelliği bir siparişin birden çok ürünü olabileceği
                                                       // için ürün adları kolleksiyonu üzerinden bu özelliğe atanacak.

        [DisplayName("Products")]
        [Required]
        public List<int> ProductIdsInput { get; set; } // İlgili view'larda çoklu seçim yapılabilen liste (list box) ile
                                                       // seçilen ürünlerin ID'lerini saklayacak veri girişi özelliği,
                                                       // bu yüzden sonuna Input yazıyoruz.
                                                       // Bir siparişte mutlaka en az bir ürün olması gerektiğinden
                                                       // Required ile ürün seçimini zorunlu hale getiriyoruz.
        #endregion
    }
}
