namespace ClassLibrary.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Setting
    {
        public short Id { get; set; }

        [Required]
        [StringLength(50)]
        public string stKey { get; set; }

        public string stValue { get; set; }

        public bool Status { get; set; }
    }
}
