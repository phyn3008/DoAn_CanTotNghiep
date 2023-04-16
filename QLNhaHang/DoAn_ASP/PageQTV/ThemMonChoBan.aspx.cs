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
    public partial class ThemMonChoBan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            // lấy thông Món Ăn vừa click
            int madat = int.Parse(Request.QueryString["MaDat"]);
            string mama = ((Button)sender).CommandArgument;
            int soluong = 1;
            // Lấy đối tượng Repeater Item hiện tại
            RepeaterItem currentItem = (sender as Button).NamingContainer as RepeaterItem;

            // Lấy giá trị của control lblgiaban bằng cách truy cập tới control đó thông qua Repeater Item
            Label lblgiaban = currentItem.FindControl("lblgiaban") as Label;
            int donGia = Convert.ToInt32(lblgiaban.Text);
            

            // Thêm món ăn vừa click vào hóa đơn
            //1. mở kết nối 
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            //2. Tạo truy vấn
            // Lấy mahd của madat muốn thêm
            SqlCommand laymahd = new SqlCommand("SELECT HoaDon.mahd FROM HoaDon WHERE madat=@madat", conn);
            laymahd.Parameters.AddWithValue("madat", madat);
            int mahd;
            mahd = Convert.ToInt32(laymahd.ExecuteScalar());

            SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM CTHOADON WHERE mama=@mama AND mahd=@mahd", conn);
            checkCmd.Parameters.AddWithValue("@mama", mama);
            checkCmd.Parameters.AddWithValue("@mahd", mahd);

            int count = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (count > 0) // Nếu đã có mama trong CSDL thì cập nhật số lượng
            {
                SqlCommand updateCmd = new SqlCommand("UPDATE CTHOADON SET soluong = soluong + 1 WHERE mama=@mama AND mahd=@mahd", conn);
                updateCmd.Parameters.AddWithValue("@mama", mama);
                updateCmd.Parameters.AddWithValue("@mahd", mahd);
                updateCmd.ExecuteNonQuery();
            }
            else // Nếu chưa có mama trong CSDL thì thêm mới
            {
                SqlCommand insertCmd = new SqlCommand("INSERT INTO CTHOADON (mahd, mama, soluong, dongia) VALUES (@mahd, @mama, @soluong, @dongia)", conn);
                insertCmd.Parameters.AddWithValue("@mahd", mahd);
                insertCmd.Parameters.AddWithValue("@mama", mama);
                insertCmd.Parameters.AddWithValue("@soluong", soluong);
                insertCmd.Parameters.AddWithValue("@dongia", donGia);
                insertCmd.ExecuteNonQuery();
            }

            Response.Write("<script> alert('Thêm thành công') </script>");

        }
    }
}