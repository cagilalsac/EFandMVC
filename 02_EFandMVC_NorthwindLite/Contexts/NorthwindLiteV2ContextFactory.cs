using Microsoft.EntityFrameworkCore.Design;
using Microsoft.EntityFrameworkCore;

namespace _02_EFandMVC_NorthwindLite.Contexts
{
    // NorthwindLiteV2Context objesini oluşturup kullanılmasını sağlayan fabrika class'ı,
    // scaffolding işlemleri için bu class oluşturulmalıdır
    public class NorthwindLiteV2ContextFactory : IDesignTimeDbContextFactory<NorthwindLiteV2Context> 
    {
        public NorthwindLiteV2Context CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<NorthwindLiteV2Context>();

            optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=NorthwindLiteV2;trusted_connection=true;trustservercertificate=true;");
            // önce veritabanımızın connection string'ini içeren NorthwindLiteV2Context tipi üzerinden DbContextOptionsBuilder objesini oluşturuyoruz

            return new NorthwindLiteV2Context(optionsBuilder.Options); 
            // daha sonra yukarıda oluşturduğumuz obje üzerinden NorthwindLiteV2Context tipinde bir obje dönüyoruz
        }
    }
}
