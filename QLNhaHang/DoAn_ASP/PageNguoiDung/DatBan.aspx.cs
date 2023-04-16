using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.Models;
using Newtonsoft.Json;
using System.IO;
namespace DoAn_ASP.PageNguoiDung
{
    public partial class DatBan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDatBan_Click(object sender, EventArgs e)
        {
            DatBanCT datban = null;
            datban = new DatBanCT();
            //datban.soban = Request.QueryString["MaBan"];
            datban.HoTenKH = txtTenKH.Text;
            datban.SDT = txtSDT.Text;
            datban.GioiTinh = rdNam.Checked ? true : false;
            datban.NgayDat = cldNgayDat.SelectedDate;
            datban.GhiChu = txtGhiChu.Text;


            string chuoi_doc = JsonConvert.SerializeObject(datban);
            //2.Ghi chuỗi vào tập tin json 
            string Duong_dan_luuvaoJson = HttpContext.Current.Server.MapPath("~/PageNguoiDung/thongtintam");
            File.WriteAllText(Duong_dan_luuvaoJson, chuoi_doc);

            Response.Redirect("CTDatBan.aspx");
        }

    }
}