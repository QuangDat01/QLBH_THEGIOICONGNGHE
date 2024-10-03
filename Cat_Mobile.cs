namespace QLBH.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Cat_Mobile")]
    public class Cat_Mobile
    {
        public Cat_Mobile()
        {

        }
        [Key]
        public int CategoryyID { get; set; }
        public string CategoryyName { get; set; }

    }
}