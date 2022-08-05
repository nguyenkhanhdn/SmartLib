using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartLib.Controllers
{
    [Authorize(Users = "admin")]
    public class AdminController : Controller
    {
        // GET: admin
        public ActionResult Index()
        {
            return View();
        }
    }
}