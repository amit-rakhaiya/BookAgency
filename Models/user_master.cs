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
    
    public partial class user_master
    {
        public decimal user_id { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string country { get; set; }
        public string telephone { get; set; }
        public string mobile { get; set; }
        public System.DateTime reg_date { get; set; }
        public string comments { get; set; }
        public decimal isactive { get; set; }
    }
}
