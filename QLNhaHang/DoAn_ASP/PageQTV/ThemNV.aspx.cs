using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.Models;

namespace DoAn_ASP.PageQTV
{
    public partial class ThemXoaNV : System.Web.UI.Page
    {

        NhanVienDAO nvDAO = new NhanVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            // Thêm nhân viên mới vào nhà hàng

            // Thu thập thông tin nhân viên
            string manv = txtMaNV.Text;
            string tennv = txttennv.Text;
            Boolean gioitinh = rdNam.Checked ? true : false;
            string sdt = txtsdt.Text;
            DateTime ngaysinh = DateTime.Parse(txtngaysinh.Text);
            string diachi = txtDiaChi.Text;
            string cmnd = txtcmnd.Text;
            string email = txtemail.Text;
            string tendangnhap = "abc";
            string pass = "abc";
            Boolean isadmin = false;
            int socong = 0;
            
            // Kiểm tra khóa chính của sinh viên
            if (nvDAO.findById(manv) != null)
            {
                Response.Write("<script> alert('Mã Nhân Viên này đã tồn tại')</script>");
                return;
            }

            // Thêm nhân viên vào CSDL
            nvDAO.Insert(manv, tennv, gioitinh, sdt, ngaysinh, diachi, cmnd, email, tendangnhap, pass, isadmin, socong);
            
            // Hiện ra thông báo khi thêm sinh viên thành công
            Response.Write("<script> alert('Thêm nhân viên thành công')</script>");
            
        }
    }
}