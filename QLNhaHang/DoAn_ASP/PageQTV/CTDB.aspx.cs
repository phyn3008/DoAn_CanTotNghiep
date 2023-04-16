using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.Models;
using System.Data.SqlClient;
using System.Configuration;

namespace DoAn_ASP.PageQTV
{
    public partial class CTDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {  
            TongBill();
        }

        private void TongBill()
        {
            string maban = Request.QueryString["MaBan"];
            lblmaban.Text = maban;

            double tongThanhTien = 0;

            for (int i = 0; i < gvthucdon.Rows.Count; i++)
            {
                double thanhtien = 0;

                if (Double.TryParse(((Label)gvthucdon.Rows[i].FindControl("lblthanhtien")).Text.Replace(" VNĐ", ""), out thanhtien))
                {
                    tongThanhTien += thanhtien;
                }
            }

            lbltonghoadon.Text = tongThanhTien.ToString("#,##0 VNĐ");
        }

        protected void gvthucdon_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Lấy số lượng từ TextBox trong cột "Số lượng"
                TextBox txtSoLuong = (TextBox)e.Row.FindControl("txtsoluong");
                int soLuong = int.Parse(txtSoLuong.Text);

                // Lấy đơn giá từ BoundField trong cột Đơn Giá
                BoundField bfDonGia = (BoundField)gvthucdon.Columns[3];
                string tenCotDonGia = bfDonGia.DataField;
                decimal donGia = decimal.Parse(DataBinder.Eval(e.Row.DataItem, tenCotDonGia).ToString());

                // Tính thành tiền và gán giá trị cho Label trong cột "Thành tiền"
                Label lblThanhTien = (Label)e.Row.FindControl("lblthanhtien");
                decimal thanhTien = soLuong * donGia;
                lblThanhTien.Text = thanhTien.ToString("#,##0 VNĐ");
            }

            TongBill();

        }

        protected void btnthemmon_Click(object sender, EventArgs e)
        {
            string madat = Request.QueryString["MaDat"];           
            Response.Redirect("ThemMonChoBan.aspx?MaDat=" + madat);
        }

        protected void gvthucdon_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string mama = gvthucdon.DataKeys[e.RowIndex].Value.ToString();
            TextBox txtSoLuong = (TextBox)gvthucdon.Rows[e.RowIndex].FindControl("txtsoluong");
            int soluongmoi = int.Parse(txtSoLuong.Text);
            // 1. Mở kết nối
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            //2.Tạo truy vấn
            SqlCommand cmd = new SqlCommand("Update CTHoaDon set soluong=@soluong where mama=@mama", conn);
            cmd.Parameters.AddWithValue("@mama", mama);
            cmd.Parameters.AddWithValue("@soluong", soluongmoi);
            //3. Thực thi câu truy vấn
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void gvthucdon_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Lấy mã sản phẫm cần xóa khỏi giỏ hàng 
            string mama = gvthucdon.DataKeys[e.RowIndex].Value.ToString();
            // Tiến hành xóa trong CSDL và update lại trang
            // 1. Mở kết nối
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            //2.Tạo truy vấn
            SqlCommand cmd = new SqlCommand("Delete from CTHoaDon where mama=@mama", conn);
            cmd.Parameters.AddWithValue("@mama", mama);
 
            //3. Thực thi câu truy vấn
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script> alert('Xóa thành công') </script>");
        }

        protected void btntinhtien_Click(object sender, EventArgs e)
        {
            string maban = Request.QueryString["MaBan"];
            string madat = Request.QueryString["MaDat"];
            
            Response.Redirect("TinhTien.aspx?MaDat=" + madat + "&maban=" + maban + "&tonghoadon=" + lbltonghoadon.Text);
        }
    }
}