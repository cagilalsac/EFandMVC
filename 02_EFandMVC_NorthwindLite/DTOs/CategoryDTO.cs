#nullable disable

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace _02_EFandMVC_NorthwindLite.DTOs
{
    public class CategoryDTO
    {
        #region Entity'den Kopyalanan Özellikler
        public int CategoryId { get; set; }

        [DisplayName("Category")]
        [Required]
        [StringLength(15)]
        public string CategoryName { get; set; }

        public string Description { get; set; }
        #endregion



        #region View'larda Gösterim veya Veri Girişi için Kullanacağımız Özellikler
        [DisplayName("Products")]
        public string ProductNamesOutput { get; set; }

        [DisplayName("Products Count")]
        public int ProductsCountOutput { get; set; }
        #endregion
    }
}
