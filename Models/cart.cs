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
    using System.ComponentModel.DataAnnotations;

    public partial class cart
    {
        public decimal cart_id { get; set; }
        public decimal book_id { get; set; }

        [Required()]
        [Range(0, 9999, ErrorMessage = "Please enter a valid quantity")]
        [Display(Name = "Quantity")]
        public decimal qty { get; set; }
        public System.Guid UserId { get; set; }
    
        public virtual UserInfo UserInfo { get; set; }
        public virtual book book { get; set; }
    }
}
