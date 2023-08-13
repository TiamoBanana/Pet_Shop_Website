using Pet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Pet.ModelViews
{
    public class ProductHomeVM
    {
        public Categories category { get; set; }
        public List<Products> lsProducts { get; set; }
    }
}
