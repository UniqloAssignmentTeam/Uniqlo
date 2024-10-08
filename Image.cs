//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Uniqlo
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations;
    public partial class Image
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Image()
        {
            this.Quantities = new HashSet<Quantity>();
        }
    
        public int Image_ID { get; set; }
        public byte[] ProductImage { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Quantity> Quantities { get; set; }
    }
    public class ImageDbContext : DbContext
    {
        public ImageDbContext() : base("name=UniqloEntities") // Ensure this matches your connection string in Web.config
        {
        }

        public DbSet<Image> Image { get; set; } // Make sure 'Staff' is properly defined as a class
        public DbSet<Quantity> Quantities { get; set; }
        public DbSet<Product> Products { get; set; }

    }
}
