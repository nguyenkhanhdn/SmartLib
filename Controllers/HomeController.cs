using SmartLib.Models;
using System;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace SmartLib.Controllers
{
    public class HomeController : Controller
    {

        private SmartLibEntities db = new SmartLibEntities();

        // GET: Books
        public ActionResult Index()
        {
            var books = db.Books.Include(b => b.Category);
            var queries = books.OrderBy(r => Guid.NewGuid()).Take(6);
            return View(queries.ToList());
        }
        public ActionResult History()
        {
            //int studentId = 0;
            var email = GetEmailFromUserName(User.Identity.Name);

            var borrows = db.Borrows.Include(b => b.Book).Include(b => b.Student).Where(b=>b.Student.Email == email);
            return View(borrows.ToList());
        }

        [HttpPost]
        public ActionResult SearchBook(string bookTitle)
        {
            var books = db.Books.Where(b => b.Title.Contains(bookTitle)).ToList();
            return View("Explorer",books);
        }
        public ActionResult Explorer()
        {
            var books = db.Books.OrderByDescending(b => b.Id).ToList();
            return View(books);
        }
        //Guid: Global unique identifier
        public ActionResult Books()
        {
            return View();
        }

        public ActionResult AddToCart(int id, string title, int quantity = 1)
        {
            //string[] s = id.Split('-');
            //string bookId = s[0];
            //string bookTitle = s[1];
            //
            string bookTitle = "None";
            var book = db.Books.Where(b => b.Id == id).FirstOrDefault(); //Tìm sách có Id = id được truyền qua, lấy dòng đầu (và là duy nhất)

            if (book != null)
            {                
                bookTitle = book.Title;
            }
            BookCart cart = (BookCart)Session["cart"];//Lấy giỏ sách từ session
            //Nếu cart rỗng -> mới vào thư viện, chưa mượn sách
            if (cart == null)
            {
                cart = new BookCart();//Lấy giỏ trống mới để vào thư viện đựng sách
            }
            cart.AddItem(id.ToString(), bookTitle, quantity);
            //Save cart
            Session["cart"] = cart;//Lưu vào session
            return RedirectToAction("YourCart");
        }
        public ActionResult YourCart()
        {
            return View();
        }

        public ActionResult RemoveBook(string id)
        {
            BookCart cart = (BookCart)Session["cart"];
            if (cart == null)
            {
                cart = new BookCart();
            }
            cart.RemoveItem(id);
            Session["cart"] = cart;//Biến session để lưu dữ liệu giữa các trang
            return RedirectToAction("YourCart");
        }

        private string GetEmailFromUserName(string userName)
        {
            string email = "";
            var user = db.AspNetUsers.Where(u => u.UserName == userName).FirstOrDefault();
            if (user != null)
            {
                email = user.Email;
            }
            return email;
        }
        [HttpGet]
        public ActionResult Registration()
        {
            try
            {
                var email = GetEmailFromUserName(User.Identity.Name);

                BookCart cart = Session["cart"] as BookCart;//Sách trong session (giỏ)
                if (cart == null)
                {
                    RedirectToAction("Index");
                }
                var student = db.Students.Where(s => s.Email == email).FirstOrDefault();
                ViewBag.StudentId = student.Id;
                ViewBag.Address = student.Address;
                ViewBag.Phone = student.Phone;
                ViewBag.Fullname = student.Name;
            }
            catch(Exception ex)
            {

            }
            
            return View();
        }

        private string GetBookCodeFromBookId(int bookId)
        {
            string bookCode = "";
            var book = db.Books.Where(b => b.Id == bookId).FirstOrDefault();
            if (book != null)
            {
                bookCode = book.BookCode;
            }
            return bookCode;
        }

        [Authorize()]//Những người đã đăng nhập
        [HttpPost]
        public ActionResult Registration(string StudentId, string RegDate, string RecMethod, string address, string Phone, string note)
        {
            Registration regInfo = null;

            BookCart cart = (BookCart)Session["cart"];
            if (cart == null) //Nếu trong giỏ chưa có cuốn sách nào -> về trang chủ
            {
                cart = new BookCart();
                RedirectToAction("Index");
            }
            else
            {
                foreach (DataRow row in cart.CartItems.Rows)
                {
                    regInfo = new Registration();
                    regInfo.BookCode = GetBookCodeFromBookId(int.Parse(row[0].ToString()));
                    regInfo.StudentId = int.Parse(StudentId);
                    regInfo.RegDate = DateTime.Parse(RegDate);
                    regInfo.RecMethod = RecMethod;
                    regInfo.Address = address;
                    regInfo.Phone = Phone;
                    regInfo.Note = note;
                    db.Registrations.Add(regInfo);
                }
                db.SaveChanges();
            }

            Session["cart"] = null;
            return View("Success");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Policy()
        {
            return View();
        }
    }
}