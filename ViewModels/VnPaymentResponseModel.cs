﻿namespace BanSua4CE.ViewModels
{
    public class VnPaymentResponseModel
    {
        public bool Success { get; set; }
        public string PaymentMethod { get; set; }
        public string OrderDescription { get; set; }
        public string OrderId { get; set; }
        public string PaymentId { get; set; }
        public string TransactionId { get; set; }
        public string Token { get; set; }
        public string VnPayResponseCode { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now;

    }

    public class VnPayRequestModel
    {
        public string FullName { get; set; }

        public string Description { get; set; }

        public double Amount { get; set; }

        public DateTime CreatedDate { get; set; }

        public int OrderId { get; set; }



    }

    public class PaymentInformation
    {
      public string OrderType { get; set; }
        public double Amount { get; set; }
        public string OrderDescription { get; set; }

        public string Name { get; set; }
    }




}