using DataAccess.Entities;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Contexts
{
    public class Db : DbContext // veritabanı tablolarına DbSet'ler üzerinden ulaşarak CRUD işlemleri yapacağımız sınıf
    {
        // tüm entity'ler için DbSet özellikleri oluşturulmalı

        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }

        public Db(DbContextOptions options) : base(options) // options parametresi Program.cs IoC Container'ında AddDbContext methodu ile
                                                            // bağımlılığı yönetilen ve appsettings.json veya appsettings.Development.json dosyalarında
                                                            // tanımlanmış connection string'i bu class'ın constructor'ına, dolayısıyla esas veritabanı
                                                            // işlemlerini yapacak olan DbContext class'ının constructor'ına taşır. Genelde bu kullanım tercih edilir.
        {

        }
    }
}
