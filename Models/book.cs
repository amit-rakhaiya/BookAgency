//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BookAgency.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class book
    {
        public decimal id { get; set; }
        public string book_name { get; set; }
        public string book_isbn { get; set; }
        public string photo { get; set; }
        public decimal category_id { get; set; }
        public decimal publisher_id { get; set; }
        public string author { get; set; }
        public string small_desc { get; set; }
        public decimal price { get; set; }
        public decimal new_arrival { get; set; }
    }
}
