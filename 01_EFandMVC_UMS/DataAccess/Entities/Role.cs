#nullable disable // eğer istenirse null değer atanabilen referans tiplerle ilgili gelen yeşil uyarıları dosyada devre dışı bırakmak için kullanılabilir,
                  // entity ve modeller için yazılmalıdır

using System.ComponentModel.DataAnnotations;

namespace DataAccess.Entities
{
    public class Role // Rol
    {
        public int Id { get; set; } // primary key

		public string Guid { get; set; } // zorunlu değil, primary key'e alternatif string key

		[Required]
        [StringLength(20)]
        public string Name { get; set; } // zorunlu

        public List<User> Users { get; set; } // 1 to many ilişkili başka entity kolleksiyonuna referans, 1 rolün 0 veya daha çok kullanıcısı olabilir
    }
}
