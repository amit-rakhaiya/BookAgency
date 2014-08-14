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
    public class PublisherController : ApplicationController
    {
        public PublisherController()
        {
            // Accessing page details from db
            page_mgmt page = db.page_mgmt.Find(15);
            ViewBag.pageDetails = page;
        }

        //
        // GET: /Publisher/
        public ViewResult Index()
        {
            return View(db.publishers.ToList());
        }

        //
        // GET: /Publisher/Details/5

        public ViewResult Details(decimal id)
        {
            publisher publisher = db.publishers.Find(id);
            return View(publisher);
        }

        //
        // GET: /Publisher/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Publisher/Create

        [HttpPost]
        public ActionResult Create(publisher publisher)
        {
            if (ModelState.IsValid)
            {
                db.publishers.Add(publisher);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(publisher);
        }
        
        //
        // GET: /Publisher/Edit/5
 
        public ActionResult Edit(decimal id)
        {
            publisher publisher = db.publishers.Find(id);
            return View(publisher);
        }

        //
        // POST: /Publisher/Edit/5

        [HttpPost]
        public ActionResult Edit(publisher publisher)
        {
            if (ModelState.IsValid)
            {
                db.Entry(publisher).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(publisher);
        }

        //
        // GET: /Publisher/Delete/5
 
        public ActionResult Delete(decimal id)
        {
            publisher publisher = db.publishers.Find(id);
            return View(publisher);
        }

        //
        // POST: /Publisher/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(decimal id)
        {            
            publisher publisher = db.publishers.Find(id);
            db.publishers.Remove(publisher);
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