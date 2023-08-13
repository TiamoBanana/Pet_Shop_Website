using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Pet.Models
{
    public partial class Transactions
    {
        public Transactions()
        {
            Orders = new HashSet<Orders>();
        }

        public int TransactionId { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }

        public virtual ICollection<Orders> Orders { get; set; }
    }
}
