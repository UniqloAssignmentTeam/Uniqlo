using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Uniqlo
{
    public class Address
    {
        public string AddressLine { get; set; }  
        public string State { get; set; }        
        public string City { get; set; }         
        public string Postcode { get; set; }        
        public string Country { get; set; }
    }
}