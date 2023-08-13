using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Pet.Models
{
    public partial class Categories
    {
        public Categories()
        {
            Products = new HashSet<Products>();
        }

        public int CatId { get; set; }
        public string CartName { get; set; }
        public string Description { get; set; }
        public string Thumb { get; set; }
        public string Alias { get; set; }
        public bool? Published { get; set; }
        public int? Ordering { get; set; }
        public string Title { get; set; }

        public virtual ICollection<Products> Products { get; set; }
    }
}
