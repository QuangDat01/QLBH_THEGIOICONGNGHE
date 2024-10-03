using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QLBH.Models
{
    [Table("Product")]
    public class Product
    {
        public Product()
        {
        }

        [Key]
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public int ProductPrice { get; set; }

        public int ProductQuantity { get; set; }

        public string ProductDescription { get; set; }
        public string ProductImage { get; set; }
        public string Detail { get; set; }
        public int CategoryID { get; set; }
    }
}
