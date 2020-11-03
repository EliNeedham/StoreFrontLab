using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontLab.DATA.EF;

namespace StoreFrontLab.Controllers
{
    public class BikeTypesController : Controller
    {
        private StoreFrontEntities1 db = new StoreFrontEntities1();

        // GET: BikeTypes
        public ActionResult Index()
        {
            return View(db.BikeTypes.ToList());
        }

        // GET: BikeTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BikeType bikeType = db.BikeTypes.Find(id);
            if (bikeType == null)
            {
                return HttpNotFound();
            }
            return View(bikeType);
        }

        // GET: BikeTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: BikeTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BikeTypeID,BikeType1")] BikeType bikeType)
        {
            if (ModelState.IsValid)
            {
                db.BikeTypes.Add(bikeType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(bikeType);
        }

        // GET: BikeTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BikeType bikeType = db.BikeTypes.Find(id);
            if (bikeType == null)
            {
                return HttpNotFound();
            }
            return View(bikeType);
        }

        // POST: BikeTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BikeTypeID,BikeType1")] BikeType bikeType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bikeType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(bikeType);
        }

        // GET: BikeTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BikeType bikeType = db.BikeTypes.Find(id);
            if (bikeType == null)
            {
                return HttpNotFound();
            }
            return View(bikeType);
        }

        // POST: BikeTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BikeType bikeType = db.BikeTypes.Find(id);
            db.BikeTypes.Remove(bikeType);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
