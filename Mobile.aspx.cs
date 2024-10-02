using QLBH.DataService;
using QLBH.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web.Security;
using System.Web.Services;

namespace QLBH.Admin
{
    public partial class Mobile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any additional logic for page load can go here

        }

        [WebMethod]
        public static List<Models.Mobile> GetAllMobile()
        {
            using (var context = new MyDbContext())
            {
                return context.Mobiles.ToList();
            }
        }

        //[WebMethod]
        //public static Models.Mobile GetbyID(int ID)
        //{
        //    using (var context = new MyDbContext())
        //    {
        //        return context.Mobiles.SingleOrDefault(p => p.MobileID == ID);
        //    }
        //}

        [WebMethod]
        public static Models.Mobile GetbyID(int ID)
        {
            using (var context = new MyDbContext())
            {
                var mobile = context.Mobiles.SingleOrDefault(p => p.MobileID == ID);
                if (mobile != null)
                {
                    System.Diagnostics.Debug.WriteLine("MobileDetail: " + mobile.MobileDetail); // Kiểm tra giá trị của Detail
                }
                return mobile;
            }
        }
        [WebMethod]
        public static int Add(string MobileName, int MobilePrice, int MobileQuantity, string MobileDescription, string MobileImage, string MobileDetail, int CategoryyID)
        {
            using (var context = new MyDbContext())
            {
                var mobile = new Models.Mobile()
                {
                    MobileName = MobileName,
                    MobilePrice = MobilePrice,
                    MobileQuantity = MobileQuantity,
                    MobileDescription = MobileDescription,
                    MobileImage = MobileImage,
                    MobileDetail = string.IsNullOrEmpty(MobileDetail) ? null : MobileDetail, // Handle empty Detail case
                    CategoryyID = CategoryyID,
                };
                context.Mobiles.Add(mobile);
                return context.SaveChanges();
            }
        }

        [WebMethod]
        public static int Delete(int ID)
        {
            using (var context = new MyDbContext())
            {
                var mobile = context.Mobiles.SingleOrDefault(r => r.MobileID == ID);
                if (mobile != null)
                {
                    context.Mobiles.Remove(mobile);
                    return context.SaveChanges();
                }
                return 0;
            }
        }

        [WebMethod]
        public static int Update(int MobileID, string MobileName, int MobilePrice, int MobileQuantity, string MobileDescription, string MobileImage, string MobileDetail, int CategoryyID)
        {
            using (var context = new MyDbContext())
            {
                var mobile = context.Mobiles.SingleOrDefault(r => r.MobileID == MobileID);

                if (mobile != null)
                {
                    mobile.MobileName = MobileName;
                    mobile.MobilePrice = MobilePrice;
                    mobile.MobileQuantity = MobileQuantity;
                    mobile.MobileDescription = MobileDescription;
                    mobile.MobileImage = MobileImage;
                    mobile.MobileDetail = string.IsNullOrEmpty(MobileDetail) ? null : MobileDetail; // Update Detail, handle empty case
                    mobile.CategoryyID = CategoryyID;

                    return context.SaveChanges();
                }
                return 0;
            }
        }

        [WebMethod]
        public static List<MobileWithCatMobile> GetAllMobileWithCatMobile()
        {
            using (var context = new MyDbContext())
            {
                return context.Mobiles
                    .Join(context.Cats,
                        mobile => mobile.CategoryyID,
                        cat => cat.CategoryyID,
                        (mobile, cat) => new MobileWithCatMobile
                        {
                            MobileID = mobile.MobileID,
                            MobileName = mobile.MobileName,
                            MobilePrice = mobile.MobilePrice,
                            MobileQuantity = mobile.MobileQuantity,
                            MobileDescription = mobile.MobileDescription,
                            MobileImage = mobile.MobileImage,
                            MobileDetail = mobile.MobileDetail,
                            CategoryyID = mobile.CategoryyID,
                            CategoryyName = cat.CategoryyName
                        })
                    .ToList();
            }
        }

        [WebMethod]
        public static List<Models.Cat_Mobile> GetAllCat_Mobile()
        {
            using (var context = new MyDbContext())
            {
                return context.Cats.ToList();
            }
        }
        [WebMethod]
        public static List<Models.Mobile> SearchMobiles(string query)
        {
            using (var context = new MyDbContext())
            {
                var result = context.Mobiles
                    .Where(m => m.MobileName.Contains(query))
                    .ToList();
                return result;
            }
        }
    }
}
