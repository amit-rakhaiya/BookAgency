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
    public class BooksController : Controller
    {
        private BookAgencyEntities db = new BookAgencyEntities();

        //
        // GET: /Books/

        public ViewResult Index()
        {
            return View(db.books.ToList());
        }

        public ActionResult Search(string searchString)
        {
            if (String.IsNullOrEmpty(searchString) == false)
            {
                
            }
            var booksRecords = db.books.Where(s =>
                                        s.book_name.ToUpper().Contains(searchString.ToUpper()) ||
                                        s.book_isbn.ToUpper().Contains(searchString.ToUpper()) ||
                                        s.author.ToUpper().Contains(searchString.ToUpper()));
            return View(booksRecords);
        }

        private List<SelectListItem> GetCategories()
        {
            var selectList = new List<SelectListItem>();
            foreach (category c in db.categories)
            {
                selectList.Add(new SelectListItem { Value = c.id + "", Text = c.category_name });
            }
            return selectList;
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