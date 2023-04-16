using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_ASP.Models
{
    public class DatBanCT
    {
        public string SoBan { set; get; }
        public string HoTenKH { set; get; }
        public string SDT { set; get; }
        public Boolean GioiTinh { set; get; }
        public DateTime NgayDat { set; get; }
        public string GhiChu { set; get; }
    }
}