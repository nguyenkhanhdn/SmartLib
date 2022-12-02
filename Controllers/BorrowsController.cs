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
    public class BorrowsController : Controller
    {
        private SmartLibEntities db = new SmartLibEntities();

        // GET: Borrows
        public ActionResult Index()
        {
            var borrows = db.Borrows.Include(b => b.Book).Include(b => b.Student);

            return View(borrows.ToList());
        }
        //Reminder
        [HttpPost]
        public JsonResult Remind()
        {
            string status = "OK";
            string emails = "";
            try
            {
                DataTable ds = SendEmail.GetData();

                foreach (DataRow row in ds.Rows)
                {
                    string hocsinh = row[0].ToString();
                    string email = row[1].ToString();
                    string tensach = row[2].ToString();
                    string ngaymuon = row[3].ToString();
                    string cont = string.Format("{0} mượn sách {1} từ ngày {2}, " +
                        "sách đã quá hạn yêu cầu trả sách sớm cho thư viện.", hocsinh, tensach, ngaymuon);
                    SendEmail.SendGmail(email, cont);
                }
            }
            catch (Exception ex)
            {
                status = ex.Message;
            }
            return Json(JsonRequestBehavior.AllowGet);
        }
        //GET: NotReturn
        public ActionResult NotReturn()
        {
            var borrows = db.Borrows.ToList();
            var notReturnedBooks = borrows.Where(d => d.ReturnDate == null);
            return View(notReturnedBooks);
        }

        //GET: DueDate
        public ActionResult DueDate()
        {
            var borrows = db.Borrows.ToList();

            var duebooks = borrows.Where((b => b.BorrowDate.AddDays(14) < DateTime.Today));
            duebooks = duebooks.Where(d => d.ReturnDate == null);
            return View(duebooks);
        }
        [AllowAnonymous]
        public ActionResult Top10Books()
        {
            var books = db.Books.ToList().OrderByDescending(b=>b.BorrowNo).Take<Book>(10);

            return View(books);
        }
        [AllowAnonymous]
        public ActionResult Top10Students()
        {
            Top10Students top10 = new Top10Students();
            var students = top10.GetTop10Students();

            return View(students);
        }

        // GET: Borrows/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Borrow borrow = db.Borrows.Find(id);
            if (borrow == null)
            {
                return HttpNotFound();
            }
            return View(borrow);
        }

        // GET: Borrows/Create
        public ActionResult Create()
        {
            ViewBag.BookCode = new SelectList(db.Books, "BookCode", "Title");
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name");
            return View();
        }

        // POST: Borrows/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,StudentId,BookCode,BorrowDate,ReturnDate,Returned")] Borrow borrow)
        {
            if (ModelState.IsValid)
            {
                db.Borrows.Add(borrow);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BookCode = new SelectList(db.Books, "BookCode", "Title", borrow.BookCode);
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name", borrow.StudentId);
            return View(borrow);
        }

        // GET: Borrows/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Borrow borrow = db.Borrows.Find(id);
            if (borrow == null)
            {
                return HttpNotFound();
            }
            ViewBag.BookCode = new SelectList(db.Books, "BookCode", "Title", borrow.BookCode);
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name", borrow.StudentId);
            return View(borrow);
        }

        // POST: Borrows/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,StudentId,BookCode,BorrowDate,ReturnDate,Returned")] Borrow borrow)
        {
            if (ModelState.IsValid)
            {
                db.Entry(borrow).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BookCode = new SelectList(db.Books, "BookCode", "Title", borrow.BookCode);
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name", borrow.StudentId);
            return View(borrow);
        }

        // GET: Borrows/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Borrow borrow = db.Borrows.Find(id);
            if (borrow == null)
            {
                return HttpNotFound();
            }
            return View(borrow);
        }

        // POST: Borrows/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Borrow borrow = db.Borrows.Find(id);
            db.Borrows.Remove(borrow);
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
