using Microsoft.EntityFrameworkCore;
using petAdoptions.Models;

namespace petAdoptions.Data
{
    public class PetDbContext : DbContext
    {
        // Constructor que recibe opciones (cadena de conexión y proveedor) desde Program.cs
        public PetDbContext(DbContextOptions<PetDbContext> options) : base(options)
        {
        }

        // Cada DbSet representa una tabla en la BD y permite consultas LINQ
        public DbSet<Mascota> Mascota { get; set; } = null!;
        public DbSet<Especie> Especie { get; set; } = null!;
        public DbSet<Raza> Raza { get; set; } = null!;
        public DbSet<Adopcion> Adopciones { get; set; } = null!;
        public DbSet<Interesado> Interesados { get; set; } = null!;
        public DbSet<Producto> Producto { get; set; } = null!;
        public DbSet<CategoriaProducto> CategoriaProductos { get; set; } = null!;
        public DbSet<Proveedor> Proveedor { get; set; } = null!;
        public DbSet<Marca> Marca { get; set; } = null!;
        public DbSet<Donador> Donador { get; set; } = null!;
        public DbSet<Usuario> Usuarios { get; set; } = null!;

        // Aquí podemos ajustar mapeos adicionales si fuera necesario
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Aseguramos que EF conozca las tablas (los atributos [Table] en las entidades ya hacen esto,
            // pero aquí se muestra explícitamente cómo forzarlo si se necesitara)
            modelBuilder.Entity<Mascota>().ToTable("cat_mascotas");
            modelBuilder.Entity<Especie>().ToTable("cat_especies");
            modelBuilder.Entity<Raza>().ToTable("cat_razas");
            modelBuilder.Entity<Adopcion>().ToTable("pro_adopciones");
            modelBuilder.Entity<Interesado>().ToTable("cat_interesados");
            modelBuilder.Entity<Producto>().ToTable("cat_productos");
            modelBuilder.Entity<CategoriaProducto>().ToTable("cat_categoriasproductos");
            modelBuilder.Entity<Proveedor>().ToTable("cat_proveedores");
            modelBuilder.Entity<Marca>().ToTable("cat_marcas");
            modelBuilder.Entity<Donador>().ToTable("cat_donadores");
            modelBuilder.Entity<Usuario>().ToTable("cat_usuarios");

            // Relaciones y restricciones adicionales podrían declararse aquí si se requieren más reglas
        }
    }
}
