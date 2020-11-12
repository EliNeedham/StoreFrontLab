using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontLab.DATA.EF;
using StoreFrontLab.Utilities;
using PagedList;
using PagedList.Mvc;
using StoreFrontLab.Models;

namespace StoreFrontLab.Controllers
{
    public class BikesController : Controller
    {
        private StoreFrontEntities1 db = new StoreFrontEntities1();

        // GET: Bikes
        public ActionResult Index(string searchFilter, string currentFilter, int page = 1)
        {
            int pageSize = 5;
            var bikes = db.Bikes.OrderBy(b => b.BikeModel).ToList();

            if (searchFilter != null)
            {
                page = 1;
            }
            else
            {
                searchFilter = currentFilter;
            }
            ViewBag.CurrentFilter = searchFilter;

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

        // GET: Bikes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bike bike = db.Bikes.Find(id);
            if (bike == null)
            {
                return HttpNotFound();
            }
            return View(bike);
        }

        #region Custom Add-to-Cart functionality (called from the Details View)
        public ActionResult AddToCart(int qty, int bikeID)
        {
            //going to use collection type called dictionary to store items into the cart
            //Dictionaries store info as key, value pairs. 
            //you have to declare data type for the key and the value so that is what int and cartitemmodelview are
            Dictionary<int, ShoppingCartViewModel> shoppingCart = null;

            //want to see if session variable shopping cart has been created
            //check if session var called cart already exists, if it does, we will use it to populate the local collection of shopping cart items we called shoppingCart
            if (Session["cart"] != null)
            //if session at the index of "cart"
            {
                //session variable already exists and we will put items from it into our Dictionary called shoppingCart (local list of shopping cart items)
                //have to unbox the info in the cart index of the session into a dictionary where the key is an int and the value is cartitemviewmodel
                shoppingCart = (Dictionary<int, ShoppingCartViewModel>)Session["cart"];
                //when we UNBOX an object stored in Session to its smaller more specific type we are using explicit casting

                //session existed for us already - when we throw things in there it's getting wrapped up so when we unwrap it it will be in the same format that it was thrown in as - just take it out of the box

            }
            else
            {
                //if session cart doesn't xist yet, we need to instatntiate it (aka NEW IT UP)
                shoppingCart = new Dictionary<int, ShoppingCartViewModel>();
                //called on constructor for dictionary
            }
            // after the if else above we have a local version of the shopping cart list that is ready to have items added to it. 

            //find the product referenced by the ID that was passed to this method
            Bike product = db.Bikes.Where(b => b.BikeID == bikeID).FirstOrDefault();
            //first or default makes sure you don't end up with null value
            if (product == null)
            {
                //if bad id, kick them back to some page to try again or you could throw an error. 
                return RedirectToAction("Index");
            }
            else
            {
                //if the book IS valid, add the line-item to the cart
                ShoppingCartViewModel item = new ShoppingCartViewModel(qty, product);
                //what happens if this item has an instance of this item already in the cart? don't want two objects referring to same thingjust want to increase number of that same object, will have to do if checks
                //put the item in the local cart but IF we already have that product as a cart item, then we will just update the quantity. 
                //This is why Dictionary is a great choice for the shopping Cart collection
                //store things by key - normally an id that represents the value - if you're looking at things from db tables the key will be the primary key - the value is the whole object. so we can look for things by key, it is very important that key is disctinct
                if (shoppingCart.ContainsKey(product.BikeID))
                //is this particular book in our shopping cart?
                {
                    shoppingCart[product.BikeID].Qty += qty;
                }
                else
                {
                    //if shopping cart doesn't already have that id
                    shoppingCart.Add(product.BikeID, item);
                    //product.BookID is the key, item is the value
                }

                //Now update the Session version of Shopping Cart so we can maintain the info between request/response cycles
                Session["cart"] = shoppingCart; //implicit casting -> boxing
                //smaller container into a bigger container (Object is the bigger container)
                // we need to let user know that we added their itemt o cart
                Session["confirm"] = $"'{product.BikeModel}' (Quantity: {qty}) added to cart";
            }

            //send user to a view that shows their cart items
            return RedirectToAction("Index", "ShoppingCart");
        }
        #endregion

        // GET: Bikes/Create
        [Authorize(Roles = "Admin, Support")]
        public ActionResult Create()
        {
            //this is making a list of things, and says the info that is being sent back to controller is bikemakeid and info sent to user is manufacturer column
            ViewBag.BikeMakeID = new SelectList(db.BikeMakeIDs, "BikeMakeID1", "Manufacturer");
            //make text box - query db to see if value exists - if it exists get id if it doesn't then add new record into table. 
            ViewBag.BikeStatusID = new SelectList(db.BikeStatuses, "BikeStatusID", "BikeStatusName");
            ViewBag.BikeTypeID = new SelectList(db.BikeTypes, "BikeTypeID", "BikeType1");
            ViewBag.TireID = new SelectList(db.TireTypes, "TireID", "Tubeless");
            return View();
        }

        // POST: Bikes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Support")]
        public ActionResult Create([Bind(Include = "BikeID,BikeModel,BikeTypeID,Price,UnitsSold,Year,BikeImage,Description,TireID,BikeStatusID,BikeMakeID,IsSiteFeature")] Bike bike, HttpPostedFileBase bikeImage, string BikeMake)
        {

            bike.BikeMakeID = 0; // we are defaulting it to a value to check validity

            if (ModelState.IsValid)
            {

                #region Bike Make or Manufacturer Info

                //query bikemakeid table to see if that make already exists on the table
                BikeMakeID record = db.BikeMakeIDs.Where(x => x.Manufacturer == BikeMake).FirstOrDefault();

                //if this query gets nothing back then we need to add something
                if (record != null)
                {
                    bike.BikeMakeID = record.BikeMakeID1;

                }
                else
                {
                    BikeMakeID newRecord = new BikeMakeID();
                    newRecord.Manufacturer = BikeMake;
                    db.BikeMakeIDs.Add(newRecord);
                    db.SaveChanges();
                    bike.BikeMakeID = newRecord.BikeMakeID1;
                }

                #endregion
                #region file upload
                string file = "NoImage.png";

                if (bikeImage != null)
                {
                    file = bikeImage.FileName;

                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext))
                    {
                        if (bikeImage.ContentLength <= 4194304)
                        {
                            file = Guid.NewGuid() + ext;

                            #region resize image
                            string savePath = Server.MapPath("~/Content/imgstore/bikes/");

                            Image convertedImage = Image.FromStream(bikeImage.InputStream);

                            int maxImageSize = 500;

                            int maxThumbSize = 100;

                            ImageService.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            #endregion
                        }
                    }

                    bike.BikeImage = file;
                }
                #endregion
                db.Bikes.Add(bike);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BikeMakeID = new SelectList(db.BikeMakeIDs, "BikeMakeID1", "Manufacturer", bike.BikeMakeID);
            ViewBag.BikeStatusID = new SelectList(db.BikeStatuses, "BikeStatusID", "BikeStatusName", bike.BikeStatusID);
            ViewBag.BikeTypeID = new SelectList(db.BikeTypes, "BikeTypeID", "BikeType1", bike.BikeTypeID);
            ViewBag.TireID = new SelectList(db.TireTypes, "TireID", "Tubeless", bike.TireID);
            return View(bike);
        }

        // GET: Bikes/Edit/5
        [Authorize(Roles = "Admin, Support")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bike bike = db.Bikes.Find(id);
            if (bike == null)
            {
                return HttpNotFound();
            }
            ViewBag.BikeMakeID = new SelectList(db.BikeMakeIDs, "BikeMakeID1", "Manufacturer", bike.BikeMakeID);
            ViewBag.BikeStatusID = new SelectList(db.BikeStatuses, "BikeStatusID", "BikeStatusName", bike.BikeStatusID);
            ViewBag.BikeTypeID = new SelectList(db.BikeTypes, "BikeTypeID", "BikeType1", bike.BikeTypeID);
            ViewBag.TireID = new SelectList(db.TireTypes, "TireID", "TireTypeSummary", bike.TireID);
            return View(bike);
        }

        // POST: Bikes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Support")]
        public ActionResult Edit([Bind(Include = "BikeID,BikeModel,BikeTypeID,Price,UnitsSold,Year,BikeImage,Description,TireID,BikeStatusID,BikeMakeID,IsSiteFeature")] Bike bike, HttpPostedFileBase bikeImage)
        {
            if (ModelState.IsValid)
            {

                #region File Upload
                string file = "NoImage.png";

                if (bikeImage != null)
                    file = bikeImage.FileName;
                //we need to make sure they are actually uploading an appropriate file type
                string ext = file.Substring(file.LastIndexOf('.'));
                string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                //check that the uploaded file is in our list of good file extensions
                if (goodExts.Contains(ext))
                {
                    //if valid ext, check file size <= 4mb (max by default from ASP.net)
                    if (bikeImage.ContentLength <= 4194304) // specifying in bytes how big file can be
                    {
                        //create a new file name using a guid - a lot of users probably have images with the same names so we change it from what the user had to a guid Globally Unique Identifier
                        file = Guid.NewGuid() + ext;

                        #region Resize Image
                        string savePath = Server.MapPath("~/Content/imgstore/bikes/");

                        //taking the contents of this file and creatign a stream of bytes, http file base type is becmonig a stream of bytes into a type of image. this conversion has to take place for us to be able to resize the image
                        Image convertedImage = Image.FromStream(bikeImage.InputStream);

                        int maxImageSize = 500;

                        int maxThumbSize = 100;
                        //if you allowed image uploads for magazine and books - you would need to repeat that code - that's why the image service code is in an imageservice area

                        ImageService.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        //saves image onto server - but doesn't update db need to make sure to update what is stored in the db
                        #endregion
                    }
                }

                bike.BikeImage = file;
                #endregion
            db.Entry(bike).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BikeMakeID = new SelectList(db.BikeMakeIDs, "BikeMakeID1", "Manufacturer", bike.BikeMakeID);
            ViewBag.BikeStatusID = new SelectList(db.BikeStatuses, "BikeStatusID", "BikeStatusName", bike.BikeStatusID);
            ViewBag.BikeTypeID = new SelectList(db.BikeTypes, "BikeTypeID", "BikeType1", bike.BikeTypeID);
            ViewBag.TireID = new SelectList(db.TireTypes, "TireID", "Tubeless", bike.TireID);
            return View(bike);
        }

        // GET: Bikes/Delete/5
        [Authorize(Roles = "Admin, Support")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bike bike = db.Bikes.Find(id);
            if (bike == null)
            {
                return HttpNotFound();
            }
            return View(bike);
        }

        // POST: Bikes/Delete/5
        [Authorize(Roles = "Admin, Support")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                Bike bike = db.Bikes.Find(id);
                db.Bikes.Remove(bike);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch(CustomError ex)
            {
                ViewBag.CustomError = ex.Message;
                Bike bike = db.Bikes.Find(id);
                return View(bike);
            }


        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public class CustomError : Exception
        {
            private readonly string _message = "Whoops! Something went wrong....";
            public override string Message
            {
                get { return _message; }
            }
        }
    }
}
