using Pet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Pet.ModelViews
{
    public class XemDonHang
    {
        public Orders DonHang { get; set; }
        public List<OrderDetails> ChiTietDonHang { get; set; }
    }
}
