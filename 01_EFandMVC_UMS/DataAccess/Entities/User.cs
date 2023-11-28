#nullable disable // eğer istenirse null değer atanabilen referans tiplerle ilgili gelen yeşil uyarıları dosyada devre dışı bırakmak için kullanılabilir,
                  // entity ve modeller için yazılmalıdır

using DataAccess.Enums;
using System.ComponentModel.DataAnnotations;

namespace DataAccess.Entities
{
    public class User // Kullanıcı
    {
        public int Id { get; set; } // primary key

        public string Guid { get; set; } // zorunlu değil, primary key'e alternatif string key

        [Required]
        [StringLength(15)]
        public string UserName { get; set; } // zorunlu

        [Required]
        [StringLength(10)]
        public string Password { get; set; } // zorunlu

        public bool IsActive { get; set; } // zorunlu, sadece aktif kullanıcıların (IsActive = true) uygulamaya giriş yapmasını sağlamak için bu özellik kullanılır,
                                           // kullanıcının uygulama üzerinden aktifliği kaldırıldığında (IsActive = false) artık uygulamaya giriş yapamayacaktır

        public DateTime BirthDate { get; set; } // zorunlu

        public Sex Sex { get; set; } // zorunlu

        public int RoleId { get; set; } // zorunlu, 1 to many ilişki (1 kullanıcının mutlaka 1 rolü olmalı)

        public Role Role { get; set; } // has a relationship
    }
}
