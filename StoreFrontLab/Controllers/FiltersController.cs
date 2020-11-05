using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFrontLab.DATA.EF; //added for access to the data layer
using System.Data;
using System.Data.Entity;
using System.Linq;
using PagedList;
using PagedList.Mvc;


namespace StoreFrontLab.Controllers
{
    public class FiltersController : Controller
    {

        //private StoreFrontLabEntities1 db = new StoreFrontLabEntities1();
        private StoreFrontEntities1 db = new StoreFrontEntities1();


        // GET: Filters
        public ViewResult Index(string searchFilter, int page = 1)
        {
            int pageSize = 5;
            var bikes = db.Bikes.OrderBy(b => b.BikeModel).ToList();

            if (!String.IsNullOrEmpty(searchFilter))
            {
                bikes = (
                    from b in bikes
                    where b.BikeModel.ToLower().Contains(searchFilter.ToLower())
                    select b
                    ).ToList();

                ViewBag.SearchString = searchFilter;
            }
            return View(bikes.ToPagedList(page, pageSize));
        }

        //public ActionResult Clients
    }
}