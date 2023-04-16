using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace DoAn_ASP.Models
{
    public class NhanVienDAO
    {

        //phuong thuc them sinh vien vao CSDL
        public int Insert(string manv, string tennv, Boolean gioitinh, string sdt, DateTime namsinh, string diachi, string cmnd, string email, string tendangnhap, string pass, Boolean isadmin,int socong)
        {
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("insert into NhanVien (manv, tennv, lanam, sdt,namsinh, diachi, cmnd, email, tendangnhap, password, isadmin, socong) values(@manv, @tennv, @lanam, @sdt,@namsinh, @diachi, @cmnd, @email, @tendangnhap, @password, @isadmin, @socong)", conn);
            cmd.Parameters.AddWithValue("@manv", manv);
            cmd.Parameters.AddWithValue("@tennv", tennv);
            cmd.Parameters.AddWithValue("@lanam", gioitinh);
            cmd.Parameters.AddWithValue("@sdt", sdt);
            cmd.Parameters.AddWithValue("@namsinh", namsinh);
            cmd.Parameters.AddWithValue("@diachi", diachi);
            cmd.Parameters.AddWithValue("@cmnd", cmnd);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@tendangnhap", tendangnhap);
            cmd.Parameters.AddWithValue("@password", pass);
            cmd.Parameters.AddWithValue("@isadmin", isadmin);
            cmd.Parameters.AddWithValue("@socong", socong);

            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
        public NhanVien findById(string manv)
        {
            NhanVien kq = null;
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLNH_ASPConnectionString"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("select * from NhanVien where manv=@manv", conn);
            cmd.Parameters.AddWithValue("@manv", manv);
            //3.thuc thi ket qua;
            SqlDataReader dr = cmd.ExecuteReader();
            //4.xu ly ket qua tra ve
            if (dr.Read())
            {
                //tao doi tuong sinh viên
                kq = new NhanVien
                {
                    MaNV = dr["MaNV"].ToString(),
                    TenNV = dr["TenNV"].ToString(),
                    GioiTinh = (Boolean)dr["LaNam"],
                    SDT = dr["SDT"].ToString(),
                    NgaySinh = (DateTime)dr["NamSinh"],
                    Diachi = dr["DiaChi"].ToString(),
                    Cmnd = dr["CMND"].ToString(),
                    email = dr["email"].ToString(),
                    tendn = dr["tendangnhap"].ToString(),
                    pass = dr["password"].ToString(),
                    isadmin = (Boolean)dr["isadmin"],
                    Socong = int.Parse(dr["socong"].ToString())
                };
            }
            return kq;
        }
    }
}