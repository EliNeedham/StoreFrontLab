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
    public class TireTypesController : Controller
    {
        private StoreFrontEntities1 db = new StoreFrontEntities1();

        // GET: TireTypes
        public ActionResult Index()
        {
            return View(db.TireTypes.ToList());
        }

        // GET: TireTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TireType tireType = db.TireTypes.Find(id);
            if (tireType == null)
            {
                return HttpNotFound();
            }
            return View(tireType);
        }

        // GET: TireTypes/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: TireTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "TireID,TireSize,Tubeless")] TireType tireType)
        {
            if (ModelState.IsValid)
            {
                db.TireTypes.Add(tireType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tireType);
        }

        // GET: TireTypes/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TireType tireType = db.TireTypes.Find(id);
            if (tireType == null)
            {
                return HttpNotFound();
            }
            return View(tireType);
        }

        // POST: TireTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "TireID,TireSize,Tubeless")] TireType tireType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tireType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tireType);
        }

        // GET: TireTypes/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TireType tireType = db.TireTypes.Find(id);
            if (tireType == null)
            {
                return HttpNotFound();
            }
            return View(tireType);
        }

        // POST: TireTypes/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TireType tireType = db.TireTypes.Find(id);
            db.TireTypes.Remove(tireType);
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
