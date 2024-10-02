using QLBH.DataService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.Services;

using System.Web.UI.WebControls;

namespace QLBH.Admin
{

    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }
        [WebMethod]
        public static object GetbyID(int ID)
        {
            return GetAllEmployees().Find(x => x.EmployeeID.Equals(ID));
        }
        [WebMethod]
        public static List<Models.Employee> GetAllEmployees()
        {
            using (var context = new MyDbContext())
            {
                var result = from c in context.Employees select c;
                return result.ToList();
            }
        }
        [WebMethod]
        public static int Add(string EmployeeName, string EmployeeAddress, string EmployeeCountry, DateTime EmployeeBirthday)
        {
            using (var context = new MyDbContext())
            {
                var c = new Models.Employee()
                {
                    EmployeeName = EmployeeName,
                    EmployeeAddress = EmployeeAddress,
                    EmployeeCountry = EmployeeCountry,
                    EmployeeBirthday = EmployeeBirthday
                };
                context.Employees.Add(c);

                return context.SaveChanges();
            }
        }
        [WebMethod]
        public static int Update(int EmployeeID, string EmployeeName, string EmployeeAddress, string EmployeeCountry, DateTime EmployeeBirthday)
        {
            using (var context = new MyDbContext())
            {
                // Tìm kiếm nhân viên theo ID
                var rowToUpdate = context.Employees.SingleOrDefault(r => r.EmployeeID == EmployeeID);

                if (rowToUpdate != null)
                {
                    // Cập nhật các thuộc tính của đối tượng
                    rowToUpdate.EmployeeName = EmployeeName;
                    rowToUpdate.EmployeeAddress = EmployeeAddress;
                    rowToUpdate.EmployeeCountry = EmployeeCountry;
                    rowToUpdate.EmployeeBirthday = EmployeeBirthday;

                    // Lưu các thay đổi vào cơ sở dữ liệu
                    return context.SaveChanges();
                }
                else
                {
                    // Nếu không tìm thấy nhân viên, trả về 0
                    return 0;
                }
            }
        }
        [WebMethod]
        public static int Delete(int ID)
        {
            using (var context = new MyDbContext())
            {
                var rowToUpdate = context.Employees.SingleOrDefault(r => r.EmployeeID == ID);
                if (rowToUpdate != null)
                {
                    context.Employees.Remove(rowToUpdate);
                    return context.SaveChanges();
                }
                return 0;
            }
        }
    }
}