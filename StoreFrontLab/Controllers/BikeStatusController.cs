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
    public class BikeStatusController : Controller
    {
        private StoreFrontEntities1 db = new StoreFrontEntities1();

        // GET: BikeStatus
        public ActionResult Index()
        {
            return View(db.BikeStatuses.ToList());
        }

        // GET: BikeStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BikeStatus bikeStatus = db.BikeStatuses.Find(id);
            if (bikeStatus == null)
            {
                return HttpNotFound();
            }
            return View(bikeStatus);
        }

        // GET: BikeStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: BikeStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BikeStatusID,BikeStatusName,Notes")] BikeStatus bikeStatus)
        {
            if (ModelState.IsValid)
            {
                db.BikeStatuses.Add(bikeStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(bikeStatus);
        }

        // GET: BikeStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BikeStatus bikeStatus = db.BikeStatuses.Find(id);
            if (bikeStatus == null)
            {
                return HttpNotFound();
            }
            return View(bikeStatus);
        }

        // POST: BikeStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BikeStatusID,BikeStatusName,Notes")] BikeStatus bikeStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bikeStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(bikeStatus);
        }

        // GET: BikeStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BikeStatus bikeStatus = db.BikeStatuses.Find(id);
            if (bikeStatus == null)
            {
                return HttpNotFound();
            }
            return View(bikeStatus);
        }

        // POST: BikeStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BikeStatus bikeStatus = db.BikeStatuses.Find(id);
            db.BikeStatuses.Remove(bikeStatus);
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
