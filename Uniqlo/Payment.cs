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
    
    public partial class Payment
    {
        public int Payment_ID { get; set; }
        public int Delivery_ID { get; set; }
        public int Order_ID { get; set; }
        public double Total_Payment { get; set; }
        public double Shipping_Amount { get; set; }
        public string Payment_Method { get; set; }
        public string Payment_Status { get; set; }
        public System.DateTime Payment_DateTime { get; set; }
    
        public virtual Delivery Delivery { get; set; }
        public virtual Order Order { get; set; }
    }
}
