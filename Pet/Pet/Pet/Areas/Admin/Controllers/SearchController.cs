using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Pet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Pet.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class SearchController : Controller
    {
        private readonly PetShopContext _context;

        public SearchController(PetShopContext context)
        {
            _context = context;
        }

        [HttpPost]
        public IActionResult FindProduct(string keyword)
        {
            List<Products> ls = new List<Products>();
            if (string.IsNullOrEmpty(keyword) || keyword.Length < 1)
            {
                return PartialView("ListProductsSearchPartial", null);
            }
            ls = _context.Products.AsNoTracking()
                                  .Include(a => a.Cat)
                                  .Where(x => x.ProductName.Contains(keyword))
                                  .OrderByDescending(x => x.ProductName)
                                  .Take(10)
                                  .ToList();
            if (ls == null)
            {
                return PartialView("ListProductsSearchPartial", null);
            }
            else
            {
                return PartialView("ListProductsSearchPartial", ls);
            }
        }
    }
}
