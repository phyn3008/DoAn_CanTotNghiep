using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_ASP.Models
{
    public class CartItem
    {
        public string mama { get; set; }
        public string tenma { get; set; }
        public int dongia { get; set; }

        public string hinh { get; set; }
        public int soluong { get; set; }
        public int thanhtien { get { return soluong * dongia; } }

    }
}