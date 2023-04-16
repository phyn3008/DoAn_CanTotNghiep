using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace DoAn_ASP.PageQTV
{
    public partial class QuanLyLuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Tính lương nhân viên theo số công đọc từ cơ sở dữ liệu và đưa vào txttinhluong
            for (int i = 0; i < gvchamcong.Rows.Count; i++)
            {
                string maNV = gvchamcong.DataKeys[i].Value.ToString();
                int soCong = int.Parse(((TextBox)gvchamcong.Rows[i].FindControl("txtsocong")).Text);
                bool isAdmin = (bool)((CheckBox)gvchamcong.Rows[i].Cells[2].Controls[0]).Checked;
                int luong = isAdmin ? soCong * 500000 : soCong * 300000;

                // Gán giá trị lương vào cột lblluong
                ((Label)gvchamcong.Rows[i].FindControl("lblluong")).Text = luong.ToString("#,##0 VNĐ");
            }

        }
        //protected void btntinhluong_Click(object sender, EventArgs e)
        //{
        //    // Lấy thông tin dòng được chọn
        //    Button btn = (Button)sender;
        //    GridViewRow row = (GridViewRow)btn.NamingContainer;
        //    string MaNV = gvchamcong.DataKeys[row.RowIndex].Value.ToString();
        //    bool isAdmin = Convert.ToBoolean(((CheckBox)row.Cells[2].Controls[0]).Checked);
        //    int soCong = Convert.ToInt32(((TextBox)row.Cells[3].Controls[1]).Text);

        //    // Tính lương
        //    int luong = isAdmin ? soCong * 500000 : soCong * 300000;

        //    // Hiển thị kết quả tính toán
        //    Label lblLuong = (Label)row.FindControl("lblLuong");
        //    lblLuong.Text = luong.ToString("#,##0 VNĐ");

        //    // Tiến hàng lưu socong sau khi cập nhật

        //    //1. Mở kết nối 
        //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
        //    conn.Open();

        //    //2.Tạo truy vấn
        //    SqlCommand cmd = new SqlCommand("Update NhanVien set socong=@socong where manv=@MaNV", conn);
        //    cmd.Parameters.AddWithValue("@socong", soCong);
        //    cmd.Parameters.AddWithValue("@MaNV", MaNV);

        //    //3. Thực thi câu truy vấn
        //    cmd.ExecuteNonQuery();
        //    conn.Close();
        //}

        protected void btntang_Click(object sender, EventArgs e)
        {
            
            for (int i = 0; i < gvchamcong.Rows.Count; i++)
            {
                // Tìm TextBox "txtSoCong" trong hàng hiện tại
                TextBox txtSoCong = (TextBox)gvchamcong.Rows[i].FindControl("txtsocong");

                // Chuyển đổi giá trị của TextBox thành kiểu dữ liệu int và tăng giá trị lên 1
                int soCong = Convert.ToInt32(txtSoCong.Text);
                soCong++;

                // Gán giá trị mới cho TextBox
                txtSoCong.Text = soCong.ToString();
            }
        }

        protected void btnluu_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < gvchamcong.Rows.Count; i++)
            {
                // Tìm TextBox "txtSoCong" trong hàng hiện tại
                string manv = gvchamcong.DataKeys[i].Values["MaNV"].ToString();
                TextBox txtSoCong = (TextBox)gvchamcong.Rows[i].FindControl("txtsocong");

                // Chuyển đổi giá trị của TextBox thành kiểu dữ liệu int và tăng giá trị lên 1
                int soCong = Convert.ToInt32(txtSoCong.Text);


                
                // Tiến hàng lưu socong sau khi cập nhật

                //1. Mở kết nối 
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
                conn.Open();

                //2.Tạo truy vấn
                SqlCommand cmd = new SqlCommand("Update NhanVien set socong=@socong where manv=@MaNV", conn);
                cmd.Parameters.AddWithValue("@socong", soCong);
                cmd.Parameters.AddWithValue("@MaNV", manv);

                //3. Thực thi câu truy vấn
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}