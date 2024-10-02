using QLBH.DataService;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Security;
using System.Web.Services;

namespace QLBH.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }
        [WebMethod]
        public static List<Models.Category> GetAll()
        {
            using (var context = new MyDbContext())
            {
                var result = from c in context.Categories select c;
                return result.ToList();
            }
        }
        [WebMethod]
        public static int Add(string CategoryName)
        {
            using (var context = new MyDbContext())
            {
                var c = new Models.Category()
                {
                    CategoryName = CategoryName
                };
                context.Categories.Add(c);
                return context.SaveChanges();
            }
        }

        //[WebMethod]
        //public static string GetAll1()
        //{
        //    string query = "SELECT CategoryID, CategoryName FROM Category";
        //    SqlCommand cmd = new SqlCommand(query);
        //    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlDataAdapter sda = new SqlDataAdapter())
        //        {
        //            cmd.Connection = con;
        //            sda.SelectCommand = cmd;
        //            using (DataSet ds = new DataSet())
        //            {
        //                sda.Fill(ds);
        //                return ds.GetXml();
        //            }
        //        }
        //    }
        //}
        // Xử lý Update
        //[WebMethod]
        //public static string GetbyID1(int ID)
        //{
        //    string query = "SELECT CategoryID, CategoryName FROM Category Where CategoryID=" + ID + "";
        //    SqlCommand cmd = new SqlCommand(query);
        //    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlDataAdapter sda = new SqlDataAdapter())
        //        {
        //            cmd.Connection = con;
        //            sda.SelectCommand = cmd;
        //            using (DataSet ds = new DataSet())
        //            {
        //                sda.Fill(ds);
        //                return ds.GetXml();
        //            }
        //        }
        //    }
        //}
        // Xử lý Update
        [WebMethod]
        public static object GetbyID(int ID)
        {
            return GetAll().Find(x => x.CategoryID.Equals(ID));
        }
        [WebMethod]
        public static int UpdateCategory(int CategoryID, string CategoryName)
        {
            using (var context = new MyDbContext())
            {
                int ID = CategoryID;
                var rowToUpdate = context.Categories.SingleOrDefault(r => r.CategoryID == ID);
                if (rowToUpdate != null)
                {
                    rowToUpdate.CategoryName = CategoryName;
                    return context.SaveChanges();
                }
                else return 0;
            }
        }
        [WebMethod]
        public static int Delete(int ID)
        {
            using (var context = new MyDbContext())
            {
                var rowToUpdate = context.Categories.SingleOrDefault(r => r.CategoryID == ID);
                if (rowToUpdate != null)
                {
                    context.Categories.Remove(rowToUpdate);
                    return context.SaveChanges();
                }
                return 0;
            }
        }
    }
}