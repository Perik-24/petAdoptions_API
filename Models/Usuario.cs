using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace petAdoptions.Models
{
    // Mapea la tabla `cat_usuarios` para poder autenticar/consultar usuarios
    [Table("cat_usuarios")]
    public class Usuario
    {
        [Key]
        [Column("eCodUsuario")]
        public int Id { get; set; }

        [Column("eCodEmpresa")]
        public int? EmpresaId { get; set; }

        [Column("eCodDepartamento")]
        public int? DepartamentoId { get; set; }

        [Column("eCodPerfil")]
        public int PerfilId { get; set; }

        [Column("tNombre")]
        public string? Nombre { get; set; }

        [Column("tCorreo")]
        public string? Correo { get; set; }

        // Usuario (login)
        [Column("tUsuario")]
        public string UsuarioLogin { get; set; } = null!;

        // Contraseña (hash) almacenado en la BD -> tPassword
        [Column("tPassword")]
        public string? PasswordHash { get; set; }

        [Column("tCodEstatus")]
        public string? CodEstatus { get; set; }
    }
}
