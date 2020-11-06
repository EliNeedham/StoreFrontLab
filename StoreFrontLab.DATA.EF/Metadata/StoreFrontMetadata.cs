using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace StoreFrontLab.DATA.EF//.Metadata commentthis out 
{

    #region Bike Metadata
    public class BikeMetadata
    {
        [Display(Name = "Bike ID")]
        public int BikeID { get; set; }

        [Required(ErrorMessage = " * Bike Model is Required *")]
        [StringLength(50, ErrorMessage = "* Cannot exceed 50 characters *")]
        [Display(Name = "Bike Model")]
        public string BikeModel { get; set; }

        [Display(Name = "Bike Type")]
        public Nullable<int> BikeTypeID { get; set; }

        [DisplayFormat(NullDisplayText = "Not available", DataFormatString = "{0:c}")]//mutliple display formats on one property, comma separated key/value pairs
        [Range(0, double.MaxValue, ErrorMessage = "* price must be a valid number, 0 or larger")]
        public decimal Price { get; set; }

        //TODO Admin or support view only
        [DisplayFormat(NullDisplayText = "Not available")]
        [Range(0, double.MaxValue, ErrorMessage = "* Number of sold units must be a valid number, 0 or larger")]
        [Display(Name = "Units Sold")]
        public Nullable<int> UnitsSold { get; set; }

        [Display(Name = "Year")]
        [Required(ErrorMessage = " * Bike model year is Required *")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime Year { get; set; }

        [Display(Name = "Image")]
        public string BikeImage { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "Not Available")]
        public string Description { get; set; }

        [Display(Name = "Tire Type")]
        [DisplayFormat(NullDisplayText = "Not available")]
        public Nullable<int> TireID { get; set; }

        [DisplayFormat(NullDisplayText = "Not available")]
        [Display(Name = "Bike Status")]
        public Nullable<int> BikeStatusID { get; set; }

        //[Required(ErrorMessage = " * Bike Make ID is Required *")]
        //public int BikeMakeID { get; set; }

        [Display(Name = "Site Feature")]
        [DisplayFormat(NullDisplayText = "Not available")]
        public Nullable<bool> IsSiteFeature { get; set; }

    }

    [MetadataType(typeof(BikeMetadata))] // this is what creates the bridge to the class it is putting metadata on
    public partial class Bike // partial classes are for creating custom properties - there are NOT DB fields
    {

    }
    #endregion

    #region Bike Make ID Metadata

    public class BikeMakeIDMetadata
    {
        [Display(Name = "Bike Make")]
        public int BikeMakeID1 { get; set; }

        [Required(ErrorMessage = " * Manufacturer name is required * ")]
        [StringLength(100, ErrorMessage = "* Cannot exceed 100 characters *")]
        public string Manufacturer { get; set; }

        [DisplayFormat(NullDisplayText = "Not Available")]
        [StringLength(20, ErrorMessage = "* Cannot exceed 20 characters *")]
        public string City { get; set; }

        [DisplayFormat(NullDisplayText = "Not Available")]
        [StringLength(2, ErrorMessage = "* Cannot exceed 2 characters *")]
        public string State { get; set; }
    }

    //[MetadataType(typeof(BikeMakeIDMetadata))]
    [MetadataType(typeof(BikeMakeIDMetadata))]
    public partial class BikeMakeID // partial classes are for creating custom properties - there are NOT DB fields
    {

    }

    #endregion

    #region Tire Type Metadata
    public class TireTypeMetadata
    {
        public int TireID { get; set; }

        [Required(ErrorMessage = " * Bike Tire size is Required *")]
        [Range(0, double.MaxValue, ErrorMessage = "* tire size must be a valid number, 0 or larger")]
        public int TireSize { get; set; }

        [Required(ErrorMessage = " * Tubeless capability is required *")]
        [StringLength(10, ErrorMessage = "* Cannot exceed 10 characters *")]
        public string Tubeless { get; set; }
    }

    [MetadataType(typeof(TireTypeMetadata))]
    public partial class TireType // partial classes are for creating custom properties - there are NOT DB fields

    //we are creating a custom property here to solve the size and tubeless dropdown menu issue - uses info from columns stored in the database - we are doing it in code instead of changing db is bc we are combining info from different columns in the db - db normalization breaks down into smallest piece of info Trim() - removes any extra whitespace
    {
        public string TireTypeSummary
        { get { return String.Format("{0}\" - {1}", TireSize, (Tubeless.ToLower().Trim() == "yes" ? "Tubeless" : "Not Tubeless")); }
        }
    }
    #endregion

    #region Bike Type Metadata
    public class BikeTypeMetadata
    {
        [Display(Name = "Bike Type ID")]
        public int BikeTypeID { get; set; }

        [Required(ErrorMessage = " * Bike type is required *")]
        [StringLength(20, ErrorMessage = "* Cannot exceed 20 characters *")]
        [Display(Name = "Bike Type")]
        public string BikeType1 { get; set; } // why is it bike type 1??????????

    }

    [MetadataType(typeof(BikeTypeMetadata))]
    public partial class BikeType // partial classes are for creating custom properties - there are NOT DB fields
    {

    }
    #endregion

    #region Bike Statuses

    public class BikeStatusMetadata
    {
        [Display(Name = "Bike Status")]
        public int BikeStatusID { get; set; }

        [Required(ErrorMessage = " * Bike Stauts is Required *")]
        [StringLength(25, ErrorMessage = "* Cannot exceed 25 characters *")]
        [Display(Name = "Bike Status")]
        public string BikeStatusName { get; set; }

        [DisplayFormat(NullDisplayText = "Not available")]
        [StringLength(100, ErrorMessage = "* Cannot exceed 100 characters *")]
        public string Notes { get; set; }
    }

    [MetadataType(typeof(BikeStatusMetadata))]
    public partial class BikeStatus // partial classes are for creating custom properties - there are NOT DB fields
    {

    }
    #endregion

}// end namespace
