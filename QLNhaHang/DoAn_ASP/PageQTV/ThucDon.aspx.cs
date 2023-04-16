using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.Models;

namespace DoAn_ASP.PageQTV
{
    public partial class ThucDon : System.Web.UI.Page
    {
        MonAn ma = new MonAn();
        MonAnDAO madao = new MonAnDAO();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnthemmonan_Click(object sender, EventArgs e)
        {
            string mama = txtMaMA.Text;
            string mapl = ddlthemma.SelectedValue.ToString();
            string tenma = txttenMA.Text;
            string dongia = txtdongia.Text;
            
            string mieuta = txtmieuta.Text;
            Boolean cosan = true;
            // Kiểm tra khóa chính của Món ăn
            if(madao.findById(mama) != null)
            {
                lblthongbao.Text = "Mã món ăn đã tồn tại !!!";
                return;
            }

            // Kiểm tra xem fileupload có file chưa
            if (fulhinhanh.HasFile)
            {
                //1. Khai báo đường dẩn để lưu tập tin trên sever
                string path = Server.MapPath("../Images/") + fulhinhanh.FileName;
                //2. Thực hiện Upload
                fulhinhanh.SaveAs(path);
            }
            else
            {
                lblthongbao.Text = "Bạn chưa thêm hình ảnh món ăn";
                return;
            }
            string hinhanh = fulhinhanh.FileName.ToString();

            // Thực hiện thêm mới món ăn
            madao.Insert(mama, mapl, tenma, dongia, hinhanh, mieuta, cosan);
            lblthongbao.Text = "Thêm món ăn thành công";
            Response.Redirect("ThucDon.aspx");

        }
    }
}