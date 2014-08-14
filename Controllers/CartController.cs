using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookAgency.Models;
using System.Web.Security;

namespace BookAgency.Controllers
{ 
    public class CartController : ApplicationController
    {
        //
        // GET: /Cart/

        public ViewResult Index()
        {
            Guid userId = (Guid)Membership.GetUser().ProviderUserKey;
            var carts = db.carts.Include(c => c.UserInfo).Include(c => c.book);
            var userCartItems = carts.Where(u => u.UserId == userId);

            return View(userCartItems.ToList());
        }

        //
        // GET: /Cart/Details/5

        public ViewResult Details(decimal id)
        {
            cart cart = db.carts.Find(id);
            return View(cart);
        }

        [HttpPost]
        public ActionResult AddToCart(int bookId, int qty)
        {
            // Check if cart already exist
            Guid userId = (Guid) Membership.GetUser().ProviderUserKey;
            var userCartItems = db.carts.Where(u => u.UserId == userId);

            if (userCartItems == null)
            {
                var cartItem = new cart
                {
                    cart_id = db.carts.Count() + 1,
                    book_id = bookId,
                    qty = qty,
                    UserId = userId
                };
                db.carts.Add(cartItem);
            }
            else
            {
                var cartItemWithSameBookId = userCartItems.FirstOrDefault(b => b.book_id == bookId);
                if (cartItemWithSameBookId == null)
                {
                    var cartItem = new cart
                    {
                        cart_id = db.carts.Count() + 1,
                        book_id = bookId,
                        qty = qty,
                        UserId = userId
                    };
                    db.carts.Add(cartItem);
                }
                else
                {
                    cartItemWithSameBookId.qty = cartItemWithSameBookId.qty + qty;
                    db.Entry(cartItemWithSameBookId).State = EntityState.Modified;
                }
            }
            db.SaveChanges();
            return RedirectToAction("Index");  
        }
        
        //
        // GET: /Cart/Create
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.UserInfoes, "UserId", "address");
            ViewBag.book_id = new SelectList(db.books, "id", "book_name");
            return View();
        } 

        //
        // POST: /Cart/Create

        [HttpPost]
        public ActionResult Create(cart cart)
        {
            if (ModelState.IsValid)
            {
                db.carts.Add(cart);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.UserId = new SelectList(db.UserInfoes, "UserId", "address", cart.UserId);
            ViewBag.book_id = new SelectList(db.books, "id", "book_name", cart.book_id);
            return View(cart);
        }
        
        //
        // GET: /Cart/Edit/5
 
        public ActionResult Edit(decimal id)
        {
            cart cart = db.carts.Find(id);
            ViewBag.UserId = new SelectList(db.UserInfoes, "UserId", "address", cart.UserId);
            ViewBag.book_id = new SelectList(db.books, "id", "book_name", cart.book_id);
            return View(cart);
        }

        //
        // POST: /Cart/Edit/5

        [HttpPost]
        public ActionResult Edit(cart cart)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cart).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.UserInfoes, "UserId", "address", cart.UserId);
            ViewBag.book_id = new SelectList(db.books, "id", "book_name", cart.book_id);
            return View(cart);
        }

        //
        // GET: /Cart/Delete/5
 
        public ActionResult Delete(decimal id)
        {
            cart cart = db.carts.Find(id);
            return View(cart);
        }

        //
        // POST: /Cart/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(decimal id)
        {            
            cart cart = db.carts.Find(id);
            db.carts.Remove(cart);
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