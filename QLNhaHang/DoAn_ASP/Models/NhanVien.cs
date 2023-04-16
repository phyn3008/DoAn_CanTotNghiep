using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_ASP.Models
{
    public class NhanVien
    {
        public string MaNV { set; get; }
        public string TenNV { set; get; }
        public Boolean GioiTinh { set; get; }
        public string SDT { set; get; }
        public DateTime NgaySinh { set; get; }
        public string Diachi { set; get; }
        public string Cmnd { set; get; }
        public string email { set; get; }
        public string tendn { set; get; }
        public string pass { set; get; }
        public Boolean isadmin { set; get; }
        public int Socong { set; get; }

    }
}