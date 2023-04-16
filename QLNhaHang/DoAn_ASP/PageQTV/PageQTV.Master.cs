using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.Models;

namespace DoAn_ASP.PageQTV
{
    public partial class PageQTV : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TaiKhoan tk = (TaiKhoan)Session["USER"];
            if (tk == null || tk.VaiTro != "True")
            {
                Response.Redirect("../PageNguoiDung/DangNhap.aspx");
            }
            else
            {
                lbUserName.Text = " " + tk.TenDangNhap;

            }
        }
    }
}