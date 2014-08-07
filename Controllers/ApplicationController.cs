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
    public class ApplicationController : Controller
    {
        private BookAgencyEntities _dataContext = new BookAgencyEntities();

        public BookAgencyEntities db
        {
            get { return _dataContext; }
        }

        public ApplicationController()
        {
            ViewData["categories"] = from c in db.categories select c;
            ViewData["new_arrivals"] = from b in db.books where b.new_arrival == 1 select b;
            ViewData["category_select_list"] = GetCategoriesSelectItems();
            ViewData["publisher_select_list"] = GetPublisherSelectItems();
        }

        private List<SelectListItem> GetCategoriesSelectItems()
        {
            var selectList = new List<SelectListItem>();
            foreach (category c in db.categories)
            {
                selectList.Add(new SelectListItem { Value = c.id + "", Text = c.category_name });
            }
            return selectList;
        }

        private List<SelectListItem> GetPublisherSelectItems()
        {
            var selectList = new List<SelectListItem>();
            foreach (publisher c in db.publishers)
            {
                selectList.Add(new SelectListItem { Value = c.id + "", Text = c.publisher_name });
            }
            return selectList;
        }
    }
}
