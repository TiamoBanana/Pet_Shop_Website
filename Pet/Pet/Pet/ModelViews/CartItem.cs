using Pet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Pet.ModelViews
{
    public class CartItem
    {
        public Products product { get; set; }
        public int amount { get; set; }
        public double TotalMoney => amount * product.Price.Value;
    }
}
