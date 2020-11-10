using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations; //added for access to Range
using StoreFrontLab.DATA.EF; //need to access Bike

namespace StoreFrontLab.Models
{
    public class ShoppingCartViewModel
    {
        [Range(1, int.MaxValue)] //ensures values are greater than zero but not greater than the max for the int datatype.
        public int Qty { get; set; }
        public Bike Product { get; set; }

        //FQCTOR
        public ShoppingCartViewModel(int qty, Bike product)
        {
            Qty = qty;
            Product = product;
        }
    }
}