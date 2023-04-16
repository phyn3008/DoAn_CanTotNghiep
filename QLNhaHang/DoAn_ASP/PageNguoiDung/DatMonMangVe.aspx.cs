using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.Models;

namespace DoAn_ASP.PageNguoiDung
{
    public partial class DatMonMangVe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rptMenu_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            // Lấy mã sản phẩm từ người dùng chọn
            string mama=((Button)sender).CommandArgument;
            //Response.Write("<script> alert('" + mama + "') </script>");

            // Thêm sản phẩm vào giỏ hàng (dùng lớp Cart, CartItem và đối tượng sesion
            CartDAO cart = (CartDAO)Session["CART"]; // Vào sesion lấy ra giỏ hàng của người dùng
            if (cart == null) // Người dùng chưa có giỏ hàng
            {
                cart = new CartDAO(); // Tạo giỏ hàng mới
                Session["CART"] = cart;

            }
      
            // Thêm sản phẩm vào giỏ 

            cart.Add(mama);

            // Thông báo cho người dùng hoặc chuyển hướng đến trang XemGio.aspx
            Response.Write("<script> alert('Đã thêm sản phẩm vào giỏ') </script>");
        }
    }
}