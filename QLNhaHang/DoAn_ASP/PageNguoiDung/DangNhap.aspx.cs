using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using DoAn_ASP.Models;

namespace DoAn_ASP.PageNguoiDung
{
    public partial class DangNhap : System.Web.UI.Page
    {
        TaiKhoanDAO tkDAO = new TaiKhoanDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btDangNhap_Click(object sender, EventArgs e)
        {
            string tendangnhap = txtTenDangNhap.Text;
            string matkhau = txtMatKhau.Text;
            //truy xuat CSDL de kiem tra ton tai tai khoan can dang nhap
            TaiKhoan tk =tkDAO.checkLogin(tendangnhap, matkhau);
            if (tk == null)
            {
                lbThongBao.Text = "Tên đăng nhập hoặc mật khẩu không đúng. Đăng nhập thất bại";
            }
            else
            {
                lbThongBao.Text = "Đăng nhập thành công";
                //luu lại trang thái đã đăng nhập thành công của người dùng vào Session
                Session["USER"] = tk;
                if (tk.VaiTro == "True") //neu nguoi dung co vai tro la CANBODAOTAO
                {
                    //điều hướng người dùng đến trang dành cho đối tượng là Cán bộ đào tạo
                    Response.Redirect("../PageQTV/TinhTrang.aspx");
                }
                else if (tk.VaiTro == "False")
                {
                    lbThongBao.Text = "Bạn không phải Admin";
                }
            }
        }
    }
}