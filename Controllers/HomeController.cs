﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookAgency.Models;
using PagedList;
using PagedList.Mvc;

namespace BookAgency.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        private BookAgencyEntities db = new BookAgencyEntities();

        public ActionResult Index(string id, int? page)
        {
            var booksRecords = from s in db.books select s;
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            
            return View(booksRecords.ToPagedList(pageNumber, pageSize));
        }
    }
}