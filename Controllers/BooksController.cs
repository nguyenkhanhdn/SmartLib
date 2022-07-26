﻿using System;
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
    [Authorize(Users ="admin")]
    public class BooksController : Controller
    {
        private SmartLibEntities db = new SmartLibEntities();

        // GET: Books
        public ActionResult Index()
        {
            var books = db.Books.Include(b => b.Category);
            return View(books.ToList());
        }

        // GET: Books/Details/5
        [AllowAnonymous]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.Books.Where(b=>b.Id==id).FirstOrDefault();

            if (book == null)
            {
                return HttpNotFound();
            }
            book.ViewNo = book.ViewNo + 1;
            db.Entry(book).State = EntityState.Modified;
            db.SaveChanges();
            return View(book);
        }

        // GET: Books/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name");
            return View();
        }

        // POST: Books/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Title,CategoryId,Brief,Publisher,PubYear,Author,BookCode,CopyNo,CoverImg")] Book book)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    book.ViewNo = 0;
                    book.QtyInStock = book.CopyNo;
                    book.BorrowNo = 0;

                    db.Books.Add(book);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {

            }
            
            
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name", book.CategoryId);
            
            return View(book);
        }

        // GET: Books/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Book book = db.Books.Find(id);
            Book book = db.Books.Where(b => b.Id == id).FirstOrDefault();
            if (book == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name", book.CategoryId);
            return View(book);
        }

        // POST: Books/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,CategoryId,Brief,Publisher,PubYear,Author,BookCode,QtyInStock,ViewNo,BorrowNo,CopyNo,CoverImg")] Book book)
        {
            if (ModelState.IsValid)
            {
                db.Entry(book).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name", book.CategoryId);
            return View(book);
        }

        // GET: Books/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Book book = db.Books.Find(id); //id Khóa chính
            Book book = db.Books.Where(b => b.Id == id).FirstOrDefault();

            //Book book = db.Books.Where(b => b.Id == id || b.QtyInStock > 0).FirstOrDefault();
            //Book book = db.Books.Where(b => b.Id == id && b.QtyInStock > 0).FirstOrDefault();
            //Book book = db.Books.Where(b => b.Title == "Toán").FirstOrDefault();
            //Book book = db.Books.Where(b => b.Title.Contains("Toán")).FirstOrDefault();
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // POST: Books/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Book book = db.Books.Find(id);
            db.Books.Remove(book);
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
