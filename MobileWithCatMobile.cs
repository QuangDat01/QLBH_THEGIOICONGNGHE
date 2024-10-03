namespace QLBH.Models
{
    public class MobileWithCatMobile
    {
        public int MobileID { get; set; }

        public string MobileName { get; set; }

        public int MobilePrice { get; set; }

        public int MobileQuantity { get; set; }

        public string MobileDescription { get; set; }
        public string MobileImage { get; set; }
        public string MobileDetail { get; set; }
        public int CategoryyID { get; set; }

        public string CategoryyName { get; set; }
    }
}