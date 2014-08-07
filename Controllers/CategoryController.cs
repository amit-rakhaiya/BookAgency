using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookAgency.Models;

namespace BookAgency.Controllers
{ 
    public class CategoryController : ApplicationController
    {
        //private BookAgencyEntities db = new BookAgencyEntities();

        //
        // GET: /Category/

        public ViewResult Index()
        {
            return View(db.categories.ToList());
        }

        //
        // GET: /Category/Details/5

        public ViewResult Details(decimal id)
        {
            category category = db.categories.Find(id);
            return View(category);
        }

        //
        // GET: /Category/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Category/Create

        [HttpPost]
        public ActionResult Create(category category)
        {
            if (ModelState.IsValid)
            {
                db.categories.Add(category);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(category);
        }
        
        //
        // GET: /Category/Edit/5
 
        public ActionResult Edit(decimal id)
        {
            category category = db.categories.Find(id);
            return View(category);
        }

        //
        // POST: /Category/Edit/5

        [HttpPost]
        public ActionResult Edit(category category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category);
        }

        //
        // GET: /Category/Delete/5
 
        public ActionResult Delete(decimal id)
        {
            category category = db.categories.Find(id);
            return View(category);
        }

        //
        // POST: /Category/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(decimal id)
        {            
            category category = db.categories.Find(id);
            db.categories.Remove(category);
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