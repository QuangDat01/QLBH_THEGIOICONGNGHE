using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QLBH.Models
{
    [Table("Mobile")]
    public class Mobile
    {
        public Mobile()
        {
        }

        [Key]
        public int MobileID { get; set; }

        public string MobileName { get; set; }

        public int MobilePrice { get; set; }

        public int MobileQuantity { get; set; }

        public string MobileDescription { get; set; }
        public string MobileImage { get; set; }
        public string MobileDetail { get; set; }
        public int CategoryyID { get; set; }
    }
}
