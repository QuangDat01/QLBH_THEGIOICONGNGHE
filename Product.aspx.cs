using QLBH.DataService;
using QLBH.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;

namespace QLBH.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any additional logic for page load can go here
        }

        [WebMethod]
        public static List<Models.Product> GetAllProduct()
        {
            using (var context = new MyDbContext())
            {
                return context.Products.ToList();
            }
        }

        //[WebMethod]
        //public static Models.Product GetbyID(int ID)
        //{
        //    using (var context = new MyDbContext())
        //    {
        //        var product = context.Products.SingleOrDefault(p => p.ProductID == ID);

        //        // Kiểm tra xem sản phẩm có tồn tại hay không
        //        if (product != null)
        //        {
        //            // Log thông tin sản phẩm
        //            System.Diagnostics.Debug.WriteLine(product.Detail); // Hoặc dùng Console.WriteLine
        //        }

        //        return product;
        //    }
        //}

        [WebMethod]
        public static Models.Product GetbyID(int ID)
        {
            using (var context = new MyDbContext())
            {
                var product = context.Products.SingleOrDefault(p => p.ProductID == ID);
                if (product != null)
                {
                    System.Diagnostics.Debug.WriteLine("Detail: " + product.Detail); // Kiểm tra giá trị của Detail
                }
                return product;
            }
        }

        [WebMethod]
        public static int Add(string ProductName, int ProductPrice, int ProductQuantity, string ProductDescription, string ProductImage, string Detail, int CategoryID)
        {
            using (var context = new MyDbContext())
            {
                var product = new Models.Product()
                {
                    ProductName = ProductName,
                    ProductPrice = ProductPrice,
                    ProductQuantity = ProductQuantity,
                    ProductDescription = ProductDescription,
                    ProductImage = ProductImage,
                    Detail = string.IsNullOrEmpty(Detail) ? null : Detail, // Handle empty Detail case
                    CategoryID = CategoryID,
                };
                context.Products.Add(product);
                return context.SaveChanges();
            }
        }

        [WebMethod]
        public static int Update(int ProductID, string ProductName, int ProductPrice, int ProductQuantity, string ProductDescription, string ProductImage, string Detail, int CategoryID)
        {
            using (var context = new MyDbContext())
            {
                var product = context.Products.SingleOrDefault(r => r.ProductID == ProductID);

                if (product != null)
                {
                    product.ProductName = ProductName;
                    product.ProductPrice = ProductPrice;
                    product.ProductQuantity = ProductQuantity;
                    product.ProductDescription = ProductDescription;
                    product.ProductImage = ProductImage;
                    product.Detail = string.IsNullOrEmpty(Detail) ? null : Detail; // Update Detail, handle empty case
                    product.CategoryID = CategoryID;
                    return context.SaveChanges();
                }
                return 0; // Product not found
            }
        }

        [WebMethod]
        public static int Delete(int ID)
        {
            using (var context = new MyDbContext())
            {
                var product = context.Products.SingleOrDefault(r => r.ProductID == ID);
                if (product != null)
                {
                    context.Products.Remove(product);
                    return context.SaveChanges();
                }
                return 0; // Product not found
            }
        }

        [WebMethod]
        public static List<ProductWithCategory> GetAllProductsWithCategory()
        {
            using (var context = new MyDbContext())
            {
                var products = context.Products
                    .Join(context.Categories,
                        product => product.CategoryID,
                        category => category.CategoryID,
                        (product, category) => new ProductWithCategory
                        {
                            ProductID = product.ProductID,
                            ProductName = product.ProductName,
                            ProductPrice = product.ProductPrice,
                            ProductQuantity = product.ProductQuantity,
                            ProductDescription = product.ProductDescription,
                            ProductImage = product.ProductImage,
                            Detail = product.Detail, // Include Detail in the selection
                            CategoryID = product.CategoryID,
                            CategoryName = category.CategoryName
                        })
                    .ToList();

                return products;
            }
        }
        [WebMethod]
        public static List<Models.Product> SearchProducts(string query)
        {
            using (var context = new MyDbContext())
            {
                var result = context.Products
                    .Where(p => p.ProductName.Contains(query))
                    .ToList();
                return result;
            }
        }
    }
}
