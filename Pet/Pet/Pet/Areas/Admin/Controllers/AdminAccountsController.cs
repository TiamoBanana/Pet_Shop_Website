using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Pet.Areas.Admin.Models;
using Pet.Extension;
using Pet.Helpper;
using Pet.Models;


namespace Pet.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminAccountsController : Controller
    {
        private readonly PetShopContext _context;

        public INotyfService _notifyService { get; }
        public AdminAccountsController(PetShopContext context, INotyfService notifyService)
        {
            _context = context;
            _notifyService = notifyService;
        }

        // GET: Admin/AdminAccounts
        public async Task<IActionResult> Index()
        {
            ViewData["RolesManagement"] = new SelectList(_context.Roles, "RoleId", "Description");
            List<SelectListItem> lsTrangThai = new List<SelectListItem>();
            lsTrangThai.Add(new SelectListItem() { Text = "Active", Value = "1" });
            lsTrangThai.Add(new SelectListItem() { Text = "Block", Value = "0" });
            ViewData["lsTrangThai"] = lsTrangThai;

            var petShopContext = _context.Accounts.Include(a => a.Role);
            return View(await petShopContext.ToListAsync());
        }

        // GET: Admin/AdminAccounts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var accounts = await _context.Accounts
                .Include(a => a.Role)
                .FirstOrDefaultAsync(m => m.AccountId == id);
            if (accounts == null)
            {
                return NotFound();
            }

            return View(accounts);
        }

        // GET: Admin/AdminAccounts/Create
        public IActionResult Create()
        {
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName");
            return View();
        }

        // POST: Admin/AdminAccounts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("AccountId,PhoneNumber,Email,Password,EncryptString,Status,UserName,RoleId,LastLogin,CreateDate")] Accounts accounts)
        {
            if (ModelState.IsValid)
            {
                string salt = Utilities.GetRandomKey();
                accounts.EncryptString = salt;

                accounts.Password = (accounts.PhoneNumber + salt.Trim()).ToMD5();
                accounts.CreateDate = DateTime.Now;


                _context.Add(accounts);
                await _context.SaveChangesAsync();
                _notifyService.Success("Tạo mới tài khoản thành công");
                return RedirectToAction(nameof(Index));
            }
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName", accounts.RoleId);
            return View(accounts);
        }

        //ChangePassword
        public IActionResult ChangePassword()
        {
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName");
            return View();
        }

        [HttpPost]
        public IActionResult ChangePassword(ChangePasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var taikhoan = _context.Accounts.AsNoTracking().SingleOrDefault(x => x.Email == model.Email);
                if (taikhoan == null) return RedirectToAction("Login", "Accounts");
                var pass = (model.PasswordNow.Trim() + taikhoan.EncryptString.Trim()).ToMD5();
                {
                    string passnew = (model.Password.Trim() + taikhoan.EncryptString.Trim()).ToMD5();
                    taikhoan.Password = passnew;
                    taikhoan.LastLogin = DateTime.Now;
                    _context.Update(taikhoan);
                    _context.SaveChanges();
                    _notifyService.Success("Đổi mật khẩu thành công");
                    return RedirectToAction("Login", "Accounts", new { Area = "Admin" });
                }
            }


            return View();
        }

        // GET: Admin/AdminAccounts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var accounts = await _context.Accounts.FindAsync(id);
            if (accounts == null)
            {
                return NotFound();
            }
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName", accounts.RoleId);
            return View(accounts);
        }

        // POST: Admin/AdminAccounts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("AccountId,PhoneNumber,Email,Password,EncryptString,Status,UserName,RoleId,LastLogin,CreateDate")] Accounts accounts)
        {
            if (id != accounts.AccountId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(accounts);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AccountsExists(accounts.AccountId))
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
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName", accounts.RoleId);
            return View(accounts);
        }

        // GET: Admin/AdminAccounts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var accounts = await _context.Accounts
                .Include(a => a.Role)
                .FirstOrDefaultAsync(m => m.AccountId == id);
            if (accounts == null)
            {
                return NotFound();
            }

            return View(accounts);
        }

        // POST: Admin/AdminAccounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var accounts = await _context.Accounts.FindAsync(id);
            _context.Accounts.Remove(accounts);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AccountsExists(int id)
        {
            return _context.Accounts.Any(e => e.AccountId == id);
        }
    }
}
