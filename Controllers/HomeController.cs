using SmartLib.Models;
using System;
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
            var queries = books.OrderBy(r => Guid.NewGuid()).Take(3);
            return View(queries.ToList());
        }
        //Guid: Global unique identifier
        public ActionResult Books()
        {
            return View();
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
    }
}