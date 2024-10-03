using QLBH;
using System.Data.Entity;

namespace QLBH.DataService
{
    public class MyDbContext : DbContext
    {
        public MyDbContext() : base("name = constr")
        {

        }
        public virtual DbSet<Models.Category> Categories { get; set; }
        public virtual DbSet<Models.Employee> Employees { get; set; }
        public virtual DbSet<Models.Product> Products { get; set; }
        public virtual DbSet<Models.Mobile> Mobiles { get; set; }
        public virtual DbSet<Models.Cat_Mobile> Cats { get; set; }
        public virtual DbSet<Models.User> Users { get; set; }

    }
}