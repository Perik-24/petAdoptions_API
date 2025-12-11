using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace petAdoptions.Models
{
    // Mapear la clase a la tabla `cat_mascotas` de la base de datos
    [Table("cat_mascotas")]
    public class Mascota
    {
        // PK: columna `eCodMascota`
        [Key]
        [Column("eCodMascota")]
        public int Id { get; set; }

        [Column("tNombre")]
        public string Nombre { get; set; }

        [Column("eEdad")]
        public int Edad { get; set; }

        [Column("dPeso")]
        public decimal? Peso { get; set; }

        [Column("tEnfermedad")]
        public string Enfermedad { get; set; }

        [Column("tDescripcion")]
        public string Descripcion { get; set; }

        [Column("eCodEspecie")]
        public int EspecieId { get; set; }

        [Column("eCodRaza")]
        public int RazaId { get; set; }

        [Column("tCodEstatus")]
        public string? Estatus { get; set; }

        [Column("fhFechaRegistro")]
        public DateTime Fecha { get; set; }

    }
}
