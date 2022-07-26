﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartLib.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Borrow
    {
        public int Id { get; set; }
        [Display(Name = "Học sinh")]
        [Required(ErrorMessage = "Học sinh không được để trống")]
        public int StudentId { get; set; }
        [Display(Name = "Mã sách")]
        public string BookCode { get; set; }
        [Display(Name = "Ngày mượn")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString ="{0:dd/MM/yyyy}")]
        public System.DateTime BorrowDate { get; set; }
        [Display(Name = "Ngày trả")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public Nullable<System.DateTime> ReturnDate { get; set; }
        [Display(Name = "Đã trả")]
        public bool Returned { get; set; }
    
        public virtual Book Book { get; set; }
        public virtual Student Student { get; set; }
    }
}
