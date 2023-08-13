using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Pet.Models
{
    public partial class TransactStatus
    {
        public int TransactStatusId { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
    }
}
