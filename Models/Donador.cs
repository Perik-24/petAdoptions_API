using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace petAdoptions.Models
{
    // Mapear la clase a la tabla `cat_donadores` de la base de datos
    [Table("cat_donadores")]
    public class Donador
    {
        // PK: columna `eCodDonador`
        [Key]
        [Column("eCodDonador")]
        public int Id { get; set; }

        [Column("tNombre")]
        public string Nombre { get; set; }

        [Required]
        [Column("tApellido")]
        public string Apellido { get; set; }

        [Column("tCorreo")]
        public string Correo { get; set; }

        [Column("tTelefono")]
        public string Telefono { get; set; }

        [Column("tTipoDonador")]
        public string Tipo_Donador { get; set; }

        [Column("tDireccion")]
        public string Direccion { get; set; }

        [Column("eCodCiudad")]
        public int CiudadId { get; set; }

        [Column("eCodEstado")]
        public int EstadoId { get; set; }

        [Column("tCodigoPostal")]
        public int Codigo_Postal { get; set; }


    }
}
