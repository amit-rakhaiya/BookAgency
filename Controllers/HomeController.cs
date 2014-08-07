using System;
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
    public class HomeController : ApplicationController
    {
        public ActionResult Index(string id, int? page)
        {
            int pageSize = 12;
            int pageNumber = (page ?? 1);

            // Fetching data from application controller
            var booksRecords = ((IEnumerable<book>)ViewData["new_arrivals"]).ToList();
            
            return View(booksRecords.ToPagedList(pageNumber, pageSize));
        }
    }
}
