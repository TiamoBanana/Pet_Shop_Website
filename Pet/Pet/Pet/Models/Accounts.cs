using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Pet.Models
{
    public partial class Accounts
    {
        public int AccountId { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string EncryptString { get; set; }
        public bool Status { get; set; }
        public string UserName { get; set; }
        public int? RoleId { get; set; }
        public DateTime? LastLogin { get; set; }
        public DateTime? CreateDate { get; set; }

        public virtual Roles Role { get; set; }
    }
}
