using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
using Pet.Helpper;
using Pet.Models;

namespace Pet.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminProductsController : Controller
    {
        private readonly PetShopContext _context;
        public INotyfService _notifyService { get; }
        public AdminProductsController(PetShopContext context, INotyfService notifyService)
        {
            _context = context;
            _notifyService = notifyService;
        }

        // GET: Admin/AdminProducts
        public IActionResult Index(int? page = 1, int CatID = 0)
        {

            var pageNumber = page;
            var pageSize = 20;
            List<Products> lsProducts = new List<Products>();
            if (CatID != 0)
            {
                lsProducts = _context.Products
                .AsNoTracking()
                .Where(x => x.CatId == CatID)
                .Include(x => x.Cat)
                .OrderBy(x => x.ProductId).ToList();
            }
            else
            {
                lsProducts = _context.Products
                .AsNoTracking()
                .Include(x => x.Cat)
                .OrderBy(x => x.ProductId).ToList();
            }

            PagedList<Products> models = new PagedList<Products>(lsProducts.AsQueryable(), (int)pageNumber, pageSize);
            ViewBag.CurrentCateID = CatID;

            ViewBag.CurrentPage = pageNumber;

            ViewData["Categories"] = new SelectList(_context.Categories, "CatId", "CartName", CatID);

            return View(models);
        }
        public IActionResult Filtter(int CatID = 0)
        {
            var url = $"/Admin/AdminProducts?CatID={CatID}";
            if (CatID == 0)
            {
                url = $"/Admin/AdminProducts";
            }
            return Json(new { status = "success", redirectUrl = url });
        }

        // GET: Admin/AdminProducts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var products = await _context.Products
                .Include(p => p.Cat)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (products == null)
            {
                return NotFound();
            }

            return View(products);
        }

        // GET: Admin/AdminProducts/Create
        public IActionResult Create()
        {
            ViewData["Categories"] = new SelectList(_context.Categories, "CatId", "CartName");
            return View();
        }

        // POST: Admin/AdminProducts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductId,ProductName,ShortDesc,Description,CatId,Price,Thumb,DateCreated,DateModified,Status,Title,UnitsInstock,Discount,Active,BestSellers,Alias")] Products products, Microsoft.AspNetCore.Http.IFormFile fThumb)
        {
            if (ModelState.IsValid)
            {
                products.ProductName = Utilities.ToTitleCase(products.ProductName);
                if (fThumb != null)
                {
                    string extension = Path.GetExtension(fThumb.FileName);
                    string image = Utilities.SEOUrl(products.ProductName) + extension;
                    products.Thumb = await Utilities.UploadFile(fThumb, @"products", image.ToLower());
                }
                if (string.IsNullOrEmpty(products.Thumb)) products.Thumb = "default.jpg";
                products.Alias = Utilities.SEOUrl(products.ProductName);
                products.DateModified = DateTime.Now;
                products.DateCreated = DateTime.Now;

                _context.Add(products);
                await _context.SaveChangesAsync();
                _notifyService.Success("Add Product Successful !");
                return RedirectToAction(nameof(Index));
            }
            ViewData["Categories"] = new SelectList(_context.Categories, "CatId", "CartName", products.CatId);
            return View(products);
        }

        // GET: Admin/AdminProducts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var products = await _context.Products.FindAsync(id);
            if (products == null)
            {
                return NotFound();
            }
            ViewData["Categories"] = new SelectList(_context.Categories, "CatId", "CartName", products.CatId);
            return View(products);
        }

        // POST: Admin/AdminProducts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,ProductName,ShortDesc,Description,CatId,Price,Thumb,DateCreated,DateModified,Status,Title,UnitsInstock,Discount,Active,BestSellers,Alias")] Products products, Microsoft.AspNetCore.Http.IFormFile fThumb)
        {
            if (id != products.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    products.ProductName = Utilities.ToTitleCase(products.ProductName);
                    if (fThumb != null)
                    {
                        string extension = Path.GetExtension(fThumb.FileName);
                        string image = Utilities.SEOUrl(products.ProductName) + extension;
                        products.Thumb = await Utilities.UploadFile(fThumb, @"products", image.ToLower());
                    }
                    if (string.IsNullOrEmpty(products.Thumb)) products.Thumb = "default.jpg";
                    products.Alias = Utilities.SEOUrl(products.ProductName);
                    products.DateModified = DateTime.Now;
                    

                    _context.Update(products);
                    await _context.SaveChangesAsync();
                    _notifyService.Success("Update Product Successful !");
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductsExists(products.ProductId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Categories"] = new SelectList(_context.Categories, "CatId", "CartName", products.CatId);
            return View(products);
        }

        // GET: Admin/AdminProducts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var products = await _context.Products
                .Include(p => p.Cat)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (products == null)
            {
                return NotFound();
            }

            return View(products);
        }

        // POST: Admin/AdminProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var products = await _context.Products.FindAsync(id);
            _context.Products.Remove(products);
            await _context.SaveChangesAsync();
            _notifyService.Success("Successful Delete !");
            return RedirectToAction(nameof(Index));
        }

        private bool ProductsExists(int id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
