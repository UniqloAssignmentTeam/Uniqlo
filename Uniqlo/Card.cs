using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Uniqlo
{
    public class Card
    {
        public string CardType { get; set; }
        public string CardHolderName { get; set; }
        public string CardNumber { get; set; }
        public string ExpiryDate { get; set; }
        public string CVV { get; set; }
    }
}