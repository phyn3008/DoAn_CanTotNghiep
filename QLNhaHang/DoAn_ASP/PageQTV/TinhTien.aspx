<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="TinhTien.aspx.cs" Inherits="DoAn_ASP.PageQTV.TinhTien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTinhTrang" runat="server">
    <form id="f" runat="server">
        <div style="width: 60%; margin: 0 auto; border: solid 2px black; padding: 20px">
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="khachhang">
                    <ItemTemplate>
                        <div class="col-12">Tên khách Hàng:
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenKH")%>'></asp:Label></div>
                        <div class="col-12 pb-5">SĐT:
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("SDT")%>'></asp:Label></div>
                    </ItemTemplate>
                </asp:Repeater>


                <div class="col-3">Tên Món Ăn</div>
                <div class="col-3">Đơn Giá (VNĐ)</div>
                <div class="col-3">Số Lượng</div>
                <div class="col-3">Thành Tiền</div>
                <asp:Repeater ID="rptthucdoncuaban" runat="server" DataSourceID="thucdontinhtien" OnItemDataBound="rptthucdoncuaban_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-3">
                            <asp:Label ID="lbltenmonan" runat="server" Text='<%# Eval("TenMA")%>'></asp:Label>
                        </div>
                        <div class="col-3">
                            <asp:Label ID="lbldongia" runat="server" Text='<%# Eval("DonGiaSP")%>'></asp:Label>
                        </div>
                        <div class="col-3">
                            <asp:Label ID="lblsoluong" runat="server" Text='<%# Eval("SoLuong")%>'></asp:Label>
                        </div>
                        <div class="col-3">
                            <asp:Label ID="lblthanhtien" runat="server" Text=""></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="col-3">
                </div>
                <div class="col-3">
                </div>
                <div class="col-3 pt-5">
                    Tổng Hóa Đơn:
                </div>
                <div class="col-3 pt-5">
                    <asp:Label ID="lbltongthanhtien" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
            </div>

        </div>
        <div class="container row">
            <div class="col-4"></div>
            <div class="col-4"></div>
            <div class="col-4 text-center"> <asp:Button ID="btninbill" runat="server" Text="In Bill" CssClass="btn btn-success" OnClick="btninbill_Click"/></div>
        </div>
        <asp:SqlDataSource ID="thucdontinhtien" runat="server"
            ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>"
            SelectCommand="SELECT Menu.MaMa, Menu.TenMA, Menu.HinhAnh, CTHoaDon.SoLuong, Menu.DonGiaSP
                            FROM HoaDon
                            INNER JOIN CTHoaDon ON HoaDon.MaHD = CTHoaDon.MaHD
                            INNER JOIN Menu ON CTHoaDon.MaMa = Menu.MaMa where HoaDon.MaDat = @MaDat"
            DeleteCommand="DELETE FROM CTHoaDon WHERE MaHD=@MaHD AND MaMA=@MaMA"
            UpdateCommand="UPDATE CTHoaDon SET SoLuong=@SoLuong  WHERE MaHD=@MaHD AND MaMA=@MaMA">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="MaDat" QueryStringField="MaDat" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="MaHD" Type="Int32" />
                <asp:Parameter Name="MaMA" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="MaHD" Type="Int32" />
                <asp:Parameter Name="SoLuong" Type="Int32" />
                <asp:Parameter Name="MaMA" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="khachhang" runat="server"
            ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>"
            SelectCommand="SELECT KhachHang.* 
            FROM DatBan
            INNER JOIN KhachHang ON DatBan.MaKH = KhachHang.MaKH
            WHERE DatBan.madat = @MaDat">
            <SelectParameters>
                <asp:QueryStringParameter Name="MaDat" QueryStringField="MaDat" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
