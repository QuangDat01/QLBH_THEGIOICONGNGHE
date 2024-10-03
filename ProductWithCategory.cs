using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QLBH.Models
{
    public class ProductWithCategory
    {

        public int ProductID { get; set; }

        public string ProductName { get; set; }
        public int ProductPrice { get; set; }
        public int ProductQuantity { get; set; }
        public string ProductDescription { get; set; }
        public string ProductImage { get; set; }
        public string Detail { get; set; }
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
    }

}

