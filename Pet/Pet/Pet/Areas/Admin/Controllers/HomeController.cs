using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Pet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Pet.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : Controller
    {
        private readonly PetShopContext _context;
       
        public HomeController(PetShopContext context)
        {
            _context = context;
        }
        
        public IActionResult Index()
        {
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            if (taikhoanID != null)
            {
                return View();
            }
            return NotFound();

        }
        
    }
}
