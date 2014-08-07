using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookAgency.Models;
using PagedList;
using PagedList.Mvc;

namespace BookAgency.Controllers
{
    public class BooksController : ApplicationController
    {

        public BooksController()
        {
            page_mgmt page = db.page_mgmt.Find(13);
            ViewBag.pageDetails = page;
        }
        //
        // GET: /Books/
        public ViewResult Index(string id, int? page, int? size)
        {
            int pageSize = (size ?? 10);
            int pageNumber = (page ?? 1);
            var booksRecords = db.books.ToList();
            return View(booksRecords.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Search(string searchString, string categoryId, string publisherId)
        {
            IEnumerable<book> booksRecords = new List<book>();
            if (String.IsNullOrEmpty(searchString) == false)
            {
                booksRecords = db.books.Where(s =>
                                    s.book_name.ToUpper().Contains(searchString.ToUpper()) ||
                                    s.book_isbn.ToUpper().Contains(searchString.ToUpper()) ||
                                    s.author.ToUpper().Contains(searchString.ToUpper()));
            }

            if (String.IsNullOrEmpty(categoryId) == false)
            {
                if(String.IsNullOrEmpty(searchString) == true)
                {
                    booksRecords = db.books;
                }
                int id = Int16.Parse(categoryId);
                booksRecords = booksRecords.Where(s => s.category_id == id);
            }

            if (String.IsNullOrEmpty(publisherId) == false)
            {
                if (String.IsNullOrEmpty(searchString) == true && String.IsNullOrEmpty(categoryId) == true)
                {
                    booksRecords = db.books;
                }
                int id = Int16.Parse(publisherId);
                booksRecords = booksRecords.Where(s => s.publisher_id == id);
            }

            return View(booksRecords);
        }

        //
        // GET: /Books/Details/5
        public ViewResult Details(decimal id)
        {
            book book = db.books.Find(id);
            return View(book);
        }

        //
        // GET: /Books/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.categories, "id", "category_name");
            ViewBag.PublisherId = new SelectList(db.publishers, "id", "publisher_name");
            return View();
        } 

        //
        // POST: /Books/Create
        [HttpPost]
        public ActionResult Create(book book)
        {
            if (ModelState.IsValid)
            {
                db.books.Add(book);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }
            return View(book);
        }
        
        //
        // GET: /Books/Edit/5
 
        public ActionResult Edit(decimal id)
        {
            book book = db.books.Find(id);
            ViewBag.CategoryId = new SelectList(db.categories, "id", "category_name", book.category_id);
            ViewBag.PublisherId = new SelectList(db.publishers, "id", "publisher_name", book.publisher_id);
            
            return View(book);
        }

        //
        // POST: /Books/Edit/5

        [HttpPost]
        public ActionResult Edit(book book)
        {
            if (ModelState.IsValid)
            {
                db.Entry(book).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(book);
        }

        //
        // GET: /Books/Delete/5
 
        public ActionResult Delete(decimal id)
        {
            book book = db.books.Find(id);
            return View(book);
        }

        //
        // POST: /Books/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(decimal id)
        {            
            book book = db.books.Find(id);
            db.books.Remove(book);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}