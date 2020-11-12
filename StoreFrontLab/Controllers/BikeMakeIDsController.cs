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
    public class BikeMakeIDsController : Controller
    {
        private StoreFrontEntities1 db = new StoreFrontEntities1();

        // GET: BikeMakeIDs
        public ActionResult Index()
        {
            return View(db.BikeMakeIDs.ToList());
        }

        // GET: BikeMakeIDs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BikeMakeID bikeMakeID = db.BikeMakeIDs.Find(id);
            if (bikeMakeID == null)
            {
                return HttpNotFound();
            }
            return View(bikeMakeID);
        }

        // GET: BikeMakeIDs/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: BikeMakeIDs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BikeMakeID1,Manufacturer,City,State")] BikeMakeID bikeMakeID)
        {
            if (ModelState.IsValid)
            {
                db.BikeMakeIDs.Add(bikeMakeID);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(bikeMakeID);
        }

        // GET: BikeMakeIDs/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BikeMakeID bikeMakeID = db.BikeMakeIDs.Find(id);
            if (bikeMakeID == null)
            {
                return HttpNotFound();
            }
            return View(bikeMakeID);
        }

        // POST: BikeMakeIDs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "BikeMakeID1,Manufacturer,City,State")] BikeMakeID bikeMakeID)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bikeMakeID).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(bikeMakeID);
        }

        // GET: BikeMakeIDs/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BikeMakeID bikeMakeID = db.BikeMakeIDs.Find(id);
            if (bikeMakeID == null)
            {
                return HttpNotFound();
            }
            return View(bikeMakeID);
        }

        // POST: BikeMakeIDs/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BikeMakeID bikeMakeID = db.BikeMakeIDs.Find(id);
            db.BikeMakeIDs.Remove(bikeMakeID);
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
