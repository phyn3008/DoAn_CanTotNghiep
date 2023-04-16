using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace DoAn_ASP.PageQTV
{
    public partial class TinhTien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbltongthanhtien.Text = Request.QueryString["tonghoadon"];
        }

        protected void rptthucdoncuaban_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Lấy các control trong ItemTemplate
                Label lblsoluong = (Label)e.Item.FindControl("lblsoluong");
                Label lbldongia = (Label)e.Item.FindControl("lbldongia");
                Label lblthanhtien = (Label)e.Item.FindControl("lblthanhtien");

                // Tính giá trị và gán vào lblthanhtien
                int soluong = int.Parse(lblsoluong.Text);
                int dongia = int.Parse(lbldongia.Text);
                int thanhtien = soluong * dongia;
                lblthanhtien.Text = thanhtien.ToString("#,##0");
            }
        }

        protected void btninbill_Click(object sender, EventArgs e)
        {
            string maban = Request.QueryString["maban"];
            string madat = Request.QueryString["madat"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd3 = new SqlCommand("Update ban set tinhtrang = 0, madat = NULL where maban = @maban", conn);
            cmd3.Parameters.AddWithValue("@maban", maban);
            cmd3.ExecuteNonQuery();
            string tonghd = lbltongthanhtien.Text.Replace(",", "").Replace("VNĐ", "");
            SqlCommand cmd4 = new SqlCommand("Update HoaDon set TongHD = @tonghoadon where madat= @madat", conn);
            cmd4.Parameters.AddWithValue("@madat", madat);
            cmd4.Parameters.AddWithValue("@tonghoadon",tonghd);

            cmd4.ExecuteNonQuery();
            conn.Close();

            string message = "Tính Tiền Thành Công, Bạn Có muốn trở lại trình trạng bàn không?";
            string url = "tinhtrang.aspx";
            string script = "window.onload = function() { alert('" + message + "'); window.location.href = '" + url + "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }
    }
}