using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SmartLib.Models;

namespace SmartLib.Controllers
{
    [Authorize(Users = "admin")]
    public class RegistrationsController : Controller
    {
        private SmartLibEntities db = new SmartLibEntities();

        [HttpGet]
        public ActionResult Xuly(int id)
        {
            //Nếu id = 0 thì yêu cầu chọn lại
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Cập nhật thuộc tính status = true
            Registration reg = db.Registrations.Find(id);
            reg.Status = true;
            db.Entry(reg).State = EntityState.Modified;

            //Thêm 1 dòng vào bảng Borrows (mượn trả)
            Borrow borrow = new Borrow();
            borrow.BookCode = reg.BookCode;
            borrow.StudentId = reg.StudentId;
            borrow.BorrowDate = DateTime.Today;
            //borrow.ReturnDate = null;
            borrow.Returned = false;

            db.Borrows.Add(borrow);
            db.SaveChanges();

            var sid = reg.StudentId;
            var stud = db.Students.Find(sid);
            string email = "";
            if (stud != null)
            {
                email = stud.Email;
            }
            SendEmail.Send(email);

            return RedirectToAction("Index");
        }

        // GET: Registrations
        public ActionResult Index()
        {
            var registrations = db.Registrations.Include(r => r.Book).Include(r => r.Student).Where(r => r.Status == false);

            return View(registrations.ToList());
        }

        public ActionResult ShowAll()
        {
            var registrations = db.Registrations.Include(r => r.Book).Include(r => r.Student);

            return View(registrations.ToList());
        }


        // GET: Registrations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registration registration = db.Registrations.Find(id);
            if (registration == null)
            {
                return HttpNotFound();
            }
            return View(registration);
        }

        // GET: Registrations/Create
        public ActionResult Create()
        {
            ViewBag.BookCode = new SelectList(db.Books, "BookCode", "Title");
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name");
            return View();
        }

        // POST: Registrations/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,StudentId,BookCode,RegDate,RecMethod,Address,Phone,Note")] Registration registration)
        {
            if (ModelState.IsValid)
            {
                registration.Status = false;
                db.Registrations.Add(registration);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BookCode = new SelectList(db.Books, "BookCode", "Title", registration.BookCode);
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name", registration.StudentId);
            return View(registration);
        }

        // GET: Registrations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registration registration = db.Registrations.Find(id);
            if (registration == null)
            {
                return HttpNotFound();
            }
            ViewBag.BookCode = new SelectList(db.Books, "BookCode", "Title", registration.BookCode);
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name", registration.StudentId);
            return View(registration);
        }

        // POST: Registrations/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,StudentId,BookCode,RegDate,RecMethod,Address,Phone,Note,Status")] Registration registration)
        {
            if (ModelState.IsValid)
            {
                db.Entry(registration).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BookCode = new SelectList(db.Books, "BookCode", "Title", registration.BookCode);
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name", registration.StudentId);
            return View(registration);
        }

        // GET: Registrations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registration registration = db.Registrations.Find(id);
            if (registration == null)
            {
                return HttpNotFound();
            }
            return View(registration);
        }

        // POST: Registrations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Registration registration = db.Registrations.Find(id);
            db.Registrations.Remove(registration);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
