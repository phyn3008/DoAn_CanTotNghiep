using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace DoAn_ASP.Models
{
    public class MonAnDAO
    {
        // Thêm món ăn mới
        public int Insert(string mama, string mapl, string tenmonan, string dongia, string hinhanh, string mieuta, Boolean cosan)
        {
            //1. mở kết nối 
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();

            //2. Tạo truy vấn
            SqlCommand cmd = new SqlCommand("Insert into Menu (mama, mapl, tenma, dongiasp, hinhanh, mieuta, cosan) values (@mama, @mapl, @tenma, @dongia, @hinhanh, @mieuta, @cosan)", conn);
            cmd.Parameters.AddWithValue("@mama", mama);
            cmd.Parameters.AddWithValue("@mapl", mapl);
            cmd.Parameters.AddWithValue("@tenma", tenmonan);
            cmd.Parameters.AddWithValue("@dongia", dongia);
            cmd.Parameters.AddWithValue("@hinhanh", hinhanh);
            cmd.Parameters.AddWithValue("@mieuta", mieuta);
            cmd.Parameters.AddWithValue("@cosan", cosan);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }

        // Sửa món ăn cũ
        public int Update(string mama, string tenmonan, string dongia, string mieuta )
        {
            //1. mở kết nối 
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();

            //2. Tạo truy vấn
            SqlCommand cmd = new SqlCommand("Update Menu set tenma=@tenma, dongiasp=@dongia, mieuta=@mieuta where mama=@mama", conn);
            cmd.Parameters.AddWithValue("@mama", mama);
            cmd.Parameters.AddWithValue("@tenma", tenmonan);
            cmd.Parameters.AddWithValue("@dongia", dongia);
            cmd.Parameters.AddWithValue("@mieuta", mieuta);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }

        // Xóa món ăn theo mã món ăn (mama)
        public int Delete(string mama)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("Delete From Menu Where mama=@mama ", conn);
            cmd.Parameters.AddWithValue("@mama", mama);

            return cmd.ExecuteNonQuery();
   
        }

        // Kiểm tra món ăn mới đó có trùng với món ăn cũ không
        public MonAn findById(string mama)
        {
            MonAn kq = null;
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("select * from Menu where mama=@mama", conn);
            cmd.Parameters.AddWithValue("@mama", mama);
            //3.thuc thi ket qua;
            SqlDataReader dr = cmd.ExecuteReader();
            //4.xu ly ket qua tra ve
            if (dr.Read())
            {
                //tao doi tuong sinh viên
                kq = new MonAn
                {
                    mama = dr["mama"].ToString(),
                    tenma = dr["tenma"].ToString(),
                    mapl = dr["mapl"].ToString(),
                    dongia = dr["dongiasp"].ToString(),
                    hinhanh = dr["hinhanh"].ToString(),
                    mieuta = dr["mieuta"].ToString(),
                    cosan = (Boolean)dr["cosan"]
                };
            }
            return kq;
        }
    }
}