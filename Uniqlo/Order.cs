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
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.OrderLists = new HashSet<OrderList>();
            this.Payments = new HashSet<Payment>();
        }
    
        public int Order_ID { get; set; }
        public int Customer_ID { get; set; }
        public double Subtotal { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual Customer Customer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderList> OrderLists { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Payment> Payments { get; set; }
    }
    public class OrderDbContext : DbContext
    {
        public OrderDbContext() : base("name=UniqloEntities")
        {
        }
        public DbSet<Customer> Customer { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<Payment> Payment { get; set; }
        public DbSet<Delivery> Delivery { get; set; }
        public DbSet<OrderList> OrderList { get; set; }
        public DbSet<Discount> Discount { get; set; }

        public DbSet<Review> Review { get; set; }
    }
}
