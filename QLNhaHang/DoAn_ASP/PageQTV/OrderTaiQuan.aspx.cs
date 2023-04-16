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
    public partial class OrderTaiQuan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string maban = Request.QueryString["Maban"];
            Label1.Text = "Bàn " + maban;
        }

        protected void btnsudung_Click(object sender, EventArgs e)
        {
            string maban = Request.QueryString["Maban"];

            // Tạo thêm 1 đối tượng trong table KhachHang, DatBan và thay đổi giá trị bàn
            // 1. Mở kết nối
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            int maKH;
            SqlCommand cmd = new SqlCommand("Insert into KhachHang (TenKH, SDT) Values (@TenKH, @SDT); SELECT SCOPE_IDENTITY();", conn);
            cmd.Parameters.AddWithValue("@TenKH", txttenkh.Text);
            cmd.Parameters.AddWithValue("@SDT", int.Parse(txtsdt.Text));
            maKH = Convert.ToInt32(cmd.ExecuteScalar());

            int madat;
            SqlCommand cmd1 = new SqlCommand("Insert into DatBan (MaKH, NgayDat, NgayHetHan) Values (@makh, @ngaydat,@ngayhethan); SELECT SCOPE_IDENTITY();", conn);
            cmd1.Parameters.AddWithValue("@makh", maKH);
            cmd1.Parameters.AddWithValue("@ngaydat", DateTime.Today);
            cmd1.Parameters.AddWithValue("@ngayhethan", DateTime.Today.AddDays(1));
            madat = Convert.ToInt32(cmd1.ExecuteScalar());


            SqlCommand cmd2 = new SqlCommand("Insert into HoaDon (madat,NgayXuatHD) Values (@madat,@ngayxuathd);", conn);
            cmd2.Parameters.AddWithValue("@ngayxuathd", DateTime.Today);
            cmd2.Parameters.AddWithValue("@madat", madat);
            cmd2.ExecuteNonQuery();


            // Đổi trạng thái của bàn thành bàn đã có người sử dụng (true)

            SqlCommand cmd3 = new SqlCommand("Update ban set tinhtrang = 1, madat = @madat where maban = @maban", conn);
            cmd3.Parameters.AddWithValue("@maban", maban);
            cmd3.Parameters.AddWithValue("@madat", madat);
            cmd3.ExecuteNonQuery();

            conn.Close();

            string message = "Tiến hành sử dụng bàn";
            string url = "tinhtrang.aspx";
            string script = "window.onload = function() { alert('" + message + "'); window.location.href = '" + url + "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }
    }
}