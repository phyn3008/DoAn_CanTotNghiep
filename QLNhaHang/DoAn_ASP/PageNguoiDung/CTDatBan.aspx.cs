using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using DoAn_ASP.Models;
using Newtonsoft.Json;
using System.IO;

namespace DoAn_ASP.PageNguoiDung
{
    public partial class CTDatBan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Duong_dan_JSON = HttpContext.Current.Server.MapPath("~/PageNguoiDung/thongtintam");
            string Chuoi_json = File.ReadAllText(Duong_dan_JSON);
            dynamic mang = JsonConvert.DeserializeObject(Chuoi_json);
            lblSoBan.Text = mang.SoBan;
            lblTenkh.Text = mang.HoTenKH;
            lblSDT.Text = mang.SDT;
            Boolean a = mang.GioiTinh;
            if (a)
            {
                lblGioiTinh.Text = "Nam";
            }
            else
            {
                lblGioiTinh.Text = "Nữ";

            }
            lblNgayDat.Text = mang.NgayDat.ToString();
            lblGhiChu.Text = mang.GhiChu;
            if (!IsPostBack)
            {
                Nap_Du_Lieu();
            }
        }

        private void Nap_Du_Lieu()
        {
            CartDAO cart = (CartDAO)Session["CART"];
            if (cart != null)
            {
                //Liên kết dữ liệu cho gvmonan
                gvmonan.DataSource = cart.items;
                gvmonan.DataBind();
                //Gán tổng thành tiền cho lbltongthanhtien
                lbltongthanhtien.Text = cart.Total.ToString();
                //lbltongthanhtien.Text = string.Format("<b> {0:#,##0} VNĐ </b>", cart.Total);
            }
            else
            {
                lbThongBao.Text = "CHƯA CÓ MÓN NÀO ĐƯỢC ĐẶT. BẠN CÓ THỂ ĐẶT MÓN CHO BÀN TẠI ĐÂY.";
            }
        }
        protected void gvmonan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Lấy mã sản phẫm cần xóa khỏi giỏ hàng 
            string mama = gvmonan.DataKeys[e.RowIndex].Value.ToString();
            // lấy giỏ hàng từ session 
            CartDAO cart = (CartDAO)Session["CART"];
            // xóa sản phẩm khỏi giỏ 
            cart.Delete(mama);
            // Nạp lại dữ liệu cho gvmonan
            Nap_Du_Lieu();
        }
        protected void gvmonan_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Lấy mã sản phẫm và số lượng cần cập nhật trong giỏ hàng 
            string mama = gvmonan.DataKeys[e.RowIndex].Value.ToString();
            int soluongmoi = int.Parse(((TextBox)gvmonan.Rows[e.RowIndex].FindControl("txtSoLuong")).Text);
            // lấy giỏ hàng từ session 
            CartDAO cart = (CartDAO)Session["CART"];
            // xóa sản phẩm khỏi giỏ 
            cart.Update(mama, soluongmoi);
            // Nạp lại dữ liệu cho gvmonan
            Nap_Du_Lieu();
        }
        protected void btDatBan_Click(object sender, EventArgs e)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            cnn.Open();

            // Thêm KH 
            SqlCommand cmdKH = new SqlCommand("insert into KhachHang(TenKH, LaNam, SDT, TraTruoc,DiaChi) values (@TenKH,@LaNam,@SDT,@TraTruoc,@DiaChi)", cnn);

            //Thêm Khách Hàng
            cmdKH.Parameters.AddWithValue("@TenKH", lblTenkh.Text);
            Boolean gtinh = lblGioiTinh.Text.ToUpper() == "NAM" ? true : false;
            cmdKH.Parameters.AddWithValue("@LaNam", gtinh);
            cmdKH.Parameters.AddWithValue("@SDT", lblSDT.Text);
            cmdKH.Parameters.AddWithValue("@TraTruoc", 0);
            cmdKH.Parameters.AddWithValue("@DiaChi", "Nhà Hàng Ánh Dương");

            cmdKH.ExecuteNonQuery();
            //if (cmdKH.ExecuteNonQuery() > 0)
            //{
            //   lbtb.Text="Thêm thành công Khách Hàng";
            //}
            //else
            //{
            //    lbtb.Text = "Thêm thất bại Khách Hàng";
            //}

            //Lấy Mã KH
            SqlCommand cmdLayMaKH = new SqlCommand("select MaKH from KhachHang where SDT='" + lblSDT.Text + "'", cnn);
            string MaKH = "";
            SqlDataReader rdLayMaKH = cmdLayMaKH.ExecuteReader();
            while (rdLayMaKH.Read())
            {
                MaKH = rdLayMaKH["MaKH"].ToString();
            }
            lbtb.Text = MaKH;
            rdLayMaKH.Close();

            


            //Đặt Bàn
            SqlCommand cmdDatBan = new SqlCommand("insert into DatBan(MaKH,NgayDat,NgayHetHan,GhiChu) values (@MaKH,@NgayDat,@NgayHetHan,@GhiChu)", cnn);
            cmdDatBan.Parameters.AddWithValue("@MaKH", MaKH);
            cmdDatBan.Parameters.AddWithValue("@NgayDat", DateTime.Today);
            cmdDatBan.Parameters.AddWithValue("@NgayHetHan", lblNgayDat.Text);
            cmdDatBan.Parameters.AddWithValue("@GhiChu", lblGhiChu.Text);
            if (cmdDatBan.ExecuteNonQuery() > 0)
            {
                lbtb.Text = "Đặt bàn thành công";
            }
            else
            {
                lbtb.Text = "Đặt bàn thất bại";
            }

            //// Thêm vào bảng hóa đơn
            if (gvmonan.Rows.Count <= 0)
            {
                return;
            }
            else
            {
                // Lấy MaDat từ bảng datban theo MaKH\
                SqlCommand cmdLayMaDat = new SqlCommand("select MaDat from DatBan where MaKH='" + MaKH + "'", cnn);
                string MaDat = "";
                SqlDataReader rdLayMaDat = cmdLayMaDat.ExecuteReader();
                while (rdLayMaDat.Read())
                {
                    MaDat = rdLayMaDat["MaDat"].ToString();
                }
                //lbtb.Text = MaDat;
                rdLayMaDat.Close();
                SqlCommand cmdHoaDon = new SqlCommand("insert into HoaDon(MaDat,NgayXuatHD,TraChua,MaNV,TongHD) values (@MaDat,@NgayXuatHD,@TraChua,@MaNV,@TongHD)", cnn);
                cmdHoaDon.Parameters.AddWithValue("@MaDat", MaDat);
                cmdHoaDon.Parameters.AddWithValue("@NgayXuatHD", lblNgayDat.Text);
                cmdHoaDon.Parameters.AddWithValue("@TraChua", false);
                cmdHoaDon.Parameters.AddWithValue("@MaNV", 1);
                cmdHoaDon.Parameters.AddWithValue("@TongHD", lbltongthanhtien.Text);
                cmdHoaDon.ExecuteNonQuery();


                // Update Ban
                SqlCommand cmdBan = new SqlCommand("update Ban set TinhTrang = @TinhTrang, MaDat = @MaDat where MaBan = @MaBan", cnn);
                cmdBan.Parameters.AddWithValue("@TinhTrang", 1);
                cmdBan.Parameters.AddWithValue("@MaDat", MaDat);
                cmdBan.Parameters.AddWithValue("@MaBan", lblSoBan.Text);
                cmdBan.ExecuteNonQuery();

                SqlCommand cmdLayMaHD = new SqlCommand("select MaHD from HoaDon where MaDat='" + MaDat + "'", cnn);
                string MaHD = "";
                SqlDataReader rdLayMaHD = cmdLayMaHD.ExecuteReader();
                while (rdLayMaHD.Read())
                {
                    MaHD = rdLayMaHD["MaHD"].ToString();
                }
                //lbtb.Text = MaHD;
                rdLayMaHD.Close();

                SqlCommand cmdctHoaDon = new SqlCommand();
                for (int i = 0; i <= gvmonan.Rows.Count - 1; i++)
                {
                    string mama = gvmonan.DataKeys[i].Value.ToString();
                    TextBox sluong = (TextBox)gvmonan.Rows[i].FindControl("txtSoLuong");
                    int soluong = int.Parse(sluong.Text);
                    cmdctHoaDon = new SqlCommand("insert into CTHoaDon(MaHD,MaMA,SoLuong,DonGia) values (@MaHD,@MaMA,@SoLuong,@DonGia)", cnn);
                    cmdctHoaDon.Parameters.AddWithValue("@MaHD", MaHD);
                    cmdctHoaDon.Parameters.AddWithValue("@MaMA", mama);
                    cmdctHoaDon.Parameters.AddWithValue("@SoLuong", soluong);
                    cmdctHoaDon.Parameters.AddWithValue("@DonGia", LayDonGia(mama, sluong).ToString());
                    cmdctHoaDon.ExecuteNonQuery();
                }

            }
            lbtb.Text = "Đặt bàn và món thành công";

        }

        private int LayDonGia(string mama, TextBox sluong)
        {
            int dongia;
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            cnn.Open();
            SqlCommand cmdLayDonGia = new SqlCommand("select DonGiaSP from Menu where MaMA='" + mama + "'", cnn);
            int dongiaSP = 0;
            SqlDataReader rdLayDonGia = cmdLayDonGia.ExecuteReader();
            while (rdLayDonGia.Read())
            {
                dongiaSP = int.Parse(rdLayDonGia["DonGiaSP"].ToString());
            }
            dongia = dongiaSP * int.Parse(sluong.Text);
            //lbtb.Text = MaHD;
            rdLayDonGia.Close();
            return dongia;
        }
    }
}