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

    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            this.Orders = new HashSet<Order>();
            this.WishlistItems = new HashSet<WishlistItem>();
        }
    
        public int Customer_ID { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string Contact_No { get; set; }
        public string Address { get; set; }
        public string State { get; set; }
        public string City { get; set; }
        public string Postcode { get; set; }
        public string Country { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public byte[] ProfileImage { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WishlistItem> WishlistItems { get; set; }
    }

    public class CustomerDBContext : DbContext
    {
        public CustomerDBContext() : base("name=UniqloEntities")
        {
        }

        public DbSet<Customer> Customer { get; set; }
    }
}
