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

    public partial class Student
    {
        public Student()
        {
            this.Borrows = new HashSet<Borrow>();
            this.Registrations = new HashSet<Registration>();
        }
    
        public int Id { get; set; }
        [Display(Name = "Tên học sinh")]
        public string Name { get; set; }
        [Display(Name = "Tên lớp")]
        public int ClassId { get; set; }
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }
        [Display(Name = "Điện thoại")]
        public string Phone { get; set; }
        [Display(Name = "Email")]
        public string Email { get; set; }
    
        public virtual ICollection<Borrow> Borrows { get; set; }
        public virtual Class Class { get; set; }
        public virtual ICollection<Registration> Registrations { get; set; }
    }
}
