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

    public partial class OrderList
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OrderList()
        {
            this.Reviews = new HashSet<Review>();
        }
    
        public int OrderList_ID { get; set; }
        public int Quantity_ID { get; set; }
        public int Order_ID { get; set; }
        public int Qty { get; set; }
        public double Item_Price { get; set; }
    
        public virtual Order Order { get; set; }
        public virtual Quantity Quantity { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Review> Reviews { get; set; }

        public class OrderListDbContext : DbContext
        {
            public OrderListDbContext() : base("name=UniqloEntities")
            {
            }

            public DbSet<Review> Review { get; set; }
            public DbSet<OrderList> OrderList { get; set; }
        }
    }
}
