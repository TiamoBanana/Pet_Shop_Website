using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Pet.Models
{
    public partial class Location
    {
        public int LocationId { get; set; }
        public string Name { get; set; }
        public int? Parent { get; set; }
        public int? Levels { get; set; }
        public string Slug { get; set; }
        public string NameWithType { get; set; }
        public string Type { get; set; }
    }
}
