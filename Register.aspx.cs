using QLBH.DataService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;

namespace QLBH.Admin
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Logic khi trang tải lần đầu
            }
        }

        [WebMethod]
        public static Models.User GetbyID(int ID)
        {
            using (var context = new MyDbContext())
            {
                return context.Users.Find(ID);
            }
        }

        [WebMethod]
        public static List<Models.User> GetAll()
        {
            using (var context = new MyDbContext())
            {
                return context.Users.ToList();
            }
        }

        [WebMethod]
        public static string Add(string UserName, string Password, string Email)
        {
            try
            {
                using (var context = new MyDbContext())
                {
                    string hashedPassword = Security.Encrypt(Password); // Mã hóa mật khẩu

                    var user = new Models.User()
                    {
                        UserName = UserName,
                        Password = hashedPassword, // Lưu mật khẩu đã mã hóa
                        Email = Email
                    };
                    context.Users.Add(user);
                    context.SaveChanges();
                    return "User added successfully.";
                }
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }

        [WebMethod]
        public static string Update(int UserID, string UserName, string Password, string Email)
        {
            using (var context = new MyDbContext())
            {
                var user = context.Users.Find(UserID);
                if (user != null)
                {
                    user.UserName = UserName;
                    user.Password = Security.Encrypt(Password); // Mã hóa mật khẩu
                    user.Email = Email;
                    context.SaveChanges();
                    return "User updated successfully.";
                }
                return "User not found.";
            }
        }

        [WebMethod]
        public static string Delete(int ID)
        {
            using (var context = new MyDbContext())
            {
                var user = context.Users.Find(ID);
                if (user != null)
                {
                    context.Users.Remove(user);
                    context.SaveChanges();
                    return "User deleted successfully.";
                }
                return "User not found.";
            }
        }

        [WebMethod]
        public static bool CheckEmailExists(string Email)
        {
            using (var context = new MyDbContext())
            {
                return context.Users.Any(u => u.Email == Email);
            }
        }
    }
}
