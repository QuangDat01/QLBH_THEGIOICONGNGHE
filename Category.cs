namespace QLBH.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Category")]
    public class Category
    {
        public Category()
        {

        }
        [Key]
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }

    }
}