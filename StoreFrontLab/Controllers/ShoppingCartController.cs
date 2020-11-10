using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFrontLab.Models;

namespace StoreFrontLab.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        public ActionResult Index()
        {
            //pull in session based cart into a local variable that we can pass to the view
            var shoppingCart = (Dictionary<int, ShoppingCartViewModel>)Session["cart"];

            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                //nothing in cart or session expired
                shoppingCart = new Dictionary<int, ShoppingCartViewModel>();

                ViewBag.Message = "There are no items in your cart.";
            }
            else
            {
                ViewBag.Message = null; //we have to do this to clear out the value in Message
            }

            return View(shoppingCart);
        }

        public ActionResult RemoveFromCart(int id)
        {
            Dictionary<int, ShoppingCartViewModel> shoppingCart = (Dictionary<int, ShoppingCartViewModel>)Session["cart"];
            shoppingCart.Remove(id);
            Session["cart"] = shoppingCart;
            
            return RedirectToAction("Index");
        }

        public ActionResult UpdateCart(int bikeID, int qty)
        {
            //get cart out of session - unbox to dictionary
            Dictionary<int, ShoppingCartViewModel> shoppingCart = (Dictionary<int, ShoppingCartViewModel>)Session["cart"];

            //target the correct cart item using the bikeID key then change the qty property using the qty parameter. bikeID and qty are coming from form we made 
            shoppingCart[bikeID].Qty = qty;
            //reassign value to whatever was passed over in form

            //return local shopping cart to the session and send the user back to the shopping cart Index
            Session["cart"] = shoppingCart;

            //send user back to index of shoppingcartcontroller
            return RedirectToAction("Index");
        }
    }
}