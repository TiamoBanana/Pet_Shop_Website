using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
using Pet.Models;

namespace Pet.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminCategoriesController : Controller
    {
        private readonly PetShopContext _context;

        public AdminCategoriesController(PetShopContext context)
        {
            _context = context;
        }

        // GET: Admin/AdminCategories
        public IActionResult Index(int? page)
        {
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 20;
            var lsCategorys = _context.Categories
                .AsNoTracking()
                .OrderBy(x => x.CatId);
            PagedList<Categories> models = new PagedList<Categories>(lsCategorys, pageNumber, pageSize);

            ViewBag.CurrentPage = pageNumber;
            return View(models);
        }

        // GET: Admin/AdminCategories/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var categories = await _context.Categories
                .FirstOrDefaultAsync(m => m.CatId == id);
            if (categories == null)
            {
                return NotFound();
            }

            return View(categories);
        }

        // GET: Admin/AdminCategories/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/AdminCategories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CatId,CartName,Description,Thumb")] Categories categories)
        {
            if (ModelState.IsValid)
            {
                _context.Add(categories);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(categories);
        }

        // GET: Admin/AdminCategories/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var categories = await _context.Categories.FindAsync(id);
            if (categories == null)
            {
                return NotFound();
            }
            return View(categories);
        }

        // POST: Admin/AdminCategories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CatId,CartName,Description,Thumb")] Categories categories)
        {
            if (id != categories.CatId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(categories);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CategoriesExists(categories.CatId))
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
            return View(categories);
        }

        // GET: Admin/AdminCategories/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var categories = await _context.Categories
                .FirstOrDefaultAsync(m => m.CatId == id);
            if (categories == null)
            {
                return NotFound();
            }

            return View(categories);
        }

        // POST: Admin/AdminCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var categories = await _context.Categories.FindAsync(id);
            _context.Categories.Remove(categories);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CategoriesExists(int id)
        {
            return _context.Categories.Any(e => e.CatId == id);
        }
    }
}
