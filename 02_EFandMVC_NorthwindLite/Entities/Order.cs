using System;
using System.Collections.Generic;

namespace _02_EFandMVC_NorthwindLite.Entities;

public partial class Order
{
    public int OrderId { get; set; }

    public string? CustomerId { get; set; }

    public DateTime? OrderDate { get; set; }

    public DateTime? RequiredDate { get; set; }

    public DateTime? ShippedDate { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
