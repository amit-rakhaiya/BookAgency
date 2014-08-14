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
    public class OrderMasterController : ApplicationController
    {
        private OrderMaster currentOrder = null;
        //
        // GET: /OrderMaster/
        public ViewResult Index()
        {
            var ordermasters = db.OrderMasters.Include(o => o.UserInfo);
            return View(ordermasters.ToList());
        }

        public ViewResult UserOrder(Guid userId)
        {
            OrderMaster OrderMasterEntity = new OrderMaster
            {
                order_id = db.OrderMasters.Count() + 1,
                order_item_id = 1,          // Temp
                order_date = DateTime.Now,
                UserId = userId,
                status = "Unpaid",  // Temp
                total = 123,        // Temp
                delivery_charge = 0,
                payment_status = "",
                payment_amount = 123,   // Temp
                payment_currency = "INR"
            };

            var carts = db.carts.Include(c => c.UserInfo).Include(c => c.book);
            var userCartItems = carts.Where(u => u.UserId == userId);
            
            OrderMasterEntity.OrderDetails = new List<OrderDetail>();
            int orderItemId = db.OrderDetails.Count() + 1;
            foreach (cart c in userCartItems)
            {
                OrderDetail OrderItem = convertToOrderDetails(c);
                OrderMasterEntity.OrderDetails.Add(OrderItem);
                OrderItem.order_item_id = orderItemId++;
                
                db.OrderDetails.Add(OrderItem);
            }
            
            OrderMasterEntity.total = OrderMasterEntity.OrderDetails.Sum(item => item.subtotal);
            OrderMasterEntity.payment_amount = OrderMasterEntity.OrderDetails.Sum(item => item.subtotal);
            db.OrderMasters.Add(OrderMasterEntity);

            // Set current order
            currentOrder = OrderMasterEntity;
            return View(OrderMasterEntity);
        }

        private OrderDetail convertToOrderDetails(cart cart)
        {
            OrderDetail od = new OrderDetail
            {
                order_item_id = 0, // temp
                order_id = db.OrderMasters.Count() + 1,
                book_id = cart.book_id,
                qty = cart.qty,
                price = cart.book.price,
                subtotal = cart.qty * cart.book.price
            };
            od.book = db.books.Find(od.book_id);
            return od;
        }

        public ActionResult PlaceOrder(OrderMaster order)
        {
            db.OrderMasters.Add(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // GET: /OrderMaster/Details/5

        public ViewResult Details(decimal id)
        {
            OrderMaster ordermaster = db.OrderMasters.Find(id);
            return View(ordermaster);
        }

        //
        // GET: /OrderMaster/Create

        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.UserInfoes, "UserId", "address");
            return View();
        } 

        //
        // POST: /OrderMaster/Create

        [HttpPost]
        public ActionResult Create(OrderMaster ordermaster)
        {
            if (ModelState.IsValid)
            {
                db.OrderMasters.Add(ordermaster);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.UserId = new SelectList(db.UserInfoes, "UserId", "address", ordermaster.UserId);
            return View(ordermaster);
        }
        
        //
        // GET: /OrderMaster/Edit/5
 
        public ActionResult Edit(decimal id)
        {
            OrderMaster ordermaster = db.OrderMasters.Find(id);
            ViewBag.UserId = new SelectList(db.UserInfoes, "UserId", "address", ordermaster.UserId);
            return View(ordermaster);
        }

        //
        // POST: /OrderMaster/Edit/5

        [HttpPost]
        public ActionResult Edit(OrderMaster ordermaster)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ordermaster).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.UserInfoes, "UserId", "address", ordermaster.UserId);
            return View(ordermaster);
        }

        //
        // GET: /OrderMaster/Delete/5
 
        public ActionResult Delete(decimal id)
        {
            OrderMaster ordermaster = db.OrderMasters.Find(id);
            return View(ordermaster);
        }

        //
        // POST: /OrderMaster/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(decimal id)
        {            
            OrderMaster ordermaster = db.OrderMasters.Find(id);
            db.OrderMasters.Remove(ordermaster);
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