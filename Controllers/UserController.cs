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
    public class UserController : ApplicationController
    {
        //
        // GET: /User/
        [Authorize(Roles="admin")]
        public ViewResult Index()
        {
            var userinfoes = db.UserInfoes.Include(u => u.User).Where(u => u.User.UserName == User.Identity.Name);
            if (User.IsInRole("admin") == true)
            {
                userinfoes = db.UserInfoes.Include(u => u.User);
            }
            return View(userinfoes.ToList());
        }

        //
        // GET: /User/Account/5
        [Authorize(Roles = "user")]
        public ViewResult UserIndex(Guid id)
        {
            UserInfo userinfo = db.UserInfoes.Find(id);
            return View(userinfo);
        }

        //
        // GET: /User/Details/5
        [Authorize(Roles = "user, admin")]
        public ViewResult Details(Guid id)
        {
            UserInfo userinfo = db.UserInfoes.Find(id);
            return View(userinfo);
        }

        //
        // GET: /User/Create
        [Authorize(Roles = "user, admin")]
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.Users, "UserId", "UserName");
            return View();
        } 

        //
        // POST: /User/Create
        [Authorize(Roles = "user, admin")]
        [HttpPost]
        public ActionResult Create(UserInfo userinfo)
        {
            if (ModelState.IsValid)
            {
                userinfo.UserId = Guid.NewGuid();
                db.UserInfoes.Add(userinfo);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.UserId = new SelectList(db.Users, "UserId", "UserName", userinfo.UserId);
            return View(userinfo);
        }
        
        // GET: /User/Edit/5
        [Authorize(Roles = "user, admin")]
        public ActionResult Edit(Guid id)
        {
            UserInfo userinfo = db.UserInfoes.Find(id);
            return View(userinfo);
        }

        //
        // POST: /User/Edit/5
        [Authorize(Roles = "user, admin")]
        [HttpPost]
        public ActionResult Edit(UserInfo userinfo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userinfo).State = EntityState.Modified;
                db.SaveChanges();
                if (User.IsInRole("user") == true)
                {
                    return RedirectToAction("Details", "User", new { id = userinfo.UserId });
                }
                else
                {
                    return RedirectToAction("Index");
                }
            }
            ViewBag.UserId = new SelectList(db.Users, "UserId", "UserName", userinfo.UserId);
            return View(userinfo);
        }

        //
        // GET: /User/Delete/5
        [Authorize(Roles = "user, admin")]
        public ActionResult Delete(Guid id)
        {
            UserInfo userinfo = db.UserInfoes.Find(id);
            return View(userinfo);
        }

        //
        // POST: /User/Delete/5
        [Authorize(Roles = "user, admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            UserInfo userinfo = db.UserInfoes.Find(id);
            string username = userinfo.User.UserName;
            string controllerForNextPage = "Home";

            db.UserInfoes.Remove(userinfo);
            db.SaveChanges();
            Membership.DeleteUser(username, true);

            if (User.IsInRole("user") == true)
            {
                // redirect to home page after a/c delete
                clearUserHistory();
                controllerForNextPage = "Home";
            }
            else
            {
                // redirect to manage user page after a/c delete
                controllerForNextPage = "User";
            }
            return RedirectToAction("Index", controllerForNextPage);
        }

        private void clearUserHistory()
        {
            // clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            // clear session cookie (not necessary for your current problem but i would recommend you do it anyway)
            HttpCookie cookie2 = new HttpCookie("ASP.NET_SessionId", "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}