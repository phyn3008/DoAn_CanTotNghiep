using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DoAn_ASP.Models;

namespace DoAn_ASP.PageQTV
{
    public partial class ThayDoi : System.Web.UI.Page
    {

        MonAnDAO mad = new MonAnDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                string ma = Request.QueryString["mama"];
                if (ma != null)
                {
                    MonAn monan = mad.findById(ma);
                    txttenma.Text = monan.tenma;
                    txtdongia.Text = monan.dongia;
                    txtmieuta.Text = monan.mieuta;
                    hinh.ImageUrl = string.Format("../Images/{0}", monan.hinhanh.Trim());
                }
            }
        }

        protected void btnthaydoi_Click(object sender, EventArgs e)
        {
            // Lấy ra món ăn cần thay đổi 
            string ma = Request.QueryString["mama"];
            mad.Update(ma, txttenma.Text, txtdongia.Text, txtmieuta.Text);

            Response.Redirect("ThucDon.aspx");

        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            // Lấy ra món ăn cần xóa
            string ma = Request.QueryString["mama"];
            mad.Delete(ma);

            Response.Redirect("ThucDon.aspx");
        }
    }
}