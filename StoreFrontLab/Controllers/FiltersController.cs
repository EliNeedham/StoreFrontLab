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


namespace StoreFrontLab.Controllers
{
    public class FiltersController : Controller
    {

        //private StoreFrontLabEntities1 db = new StoreFrontLabEntities1();


        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }
    }
}