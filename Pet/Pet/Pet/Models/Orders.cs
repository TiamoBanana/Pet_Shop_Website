using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Pet.Models
{
    public partial class Orders
    {
        public Orders()
        {
            OrderDetails = new HashSet<OrderDetails>();
        }

        public int OrderId { get; set; }
        public int? CustomerId { get; set; }
        public DateTime? OrderDate { get; set; }
        public DateTime? Shipdate { get; set; }
        public int? TransactionId { get; set; }
        public bool? Deleted { get; set; }
        public bool? Paid { get; set; }
        public DateTime? PaymentDate { get; set; }
        public int? PaymentId { get; set; }
        public string Note { get; set; }
        public int? TotalMoney { get; set; }
        public int? LocationId { get; set; }
        public int? District { get; set; }
        public int? Ward { get; set; }
        public string Address { get; set; }

        public virtual Customers Customer { get; set; }
        public virtual Transactions Transaction { get; set; }
        public virtual ICollection<OrderDetails> OrderDetails { get; set; }
    }
}
