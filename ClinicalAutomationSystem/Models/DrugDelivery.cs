//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ClinicalAutomationSystem.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DrugDelivery
    {
        public int DeliveryId { get; set; }
        public int OrderId { get; set; }
        public int SupplierId { get; set; }
        public System.DateTime DeliverDate { get; set; }
    
        public virtual PatientOrderDetail PatientOrderDetail { get; set; }
        public virtual Supplier Supplier { get; set; }
    }
}