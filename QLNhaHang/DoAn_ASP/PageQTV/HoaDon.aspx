<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="HoaDon.aspx.cs" Inherits="DoAn_ASP.PageQTV.HoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphHoaDon" runat="server">
    <form id="f" runat="server">
        <div style="width:70%; margin: 0 auto;">
            <asp:GridView ID="gvhoadon" Width="100%" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaDat" DataSourceID="hoadonfd" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>

                    <asp:BoundField DataField="TenKH" HeaderText="Tên KH" ReadOnly="True" SortExpression="MaDat" />
                    <asp:BoundField DataField="NgayXuatHD" HeaderText="Ngày Xuất" SortExpression="NgayXuatHD" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="MaNV" HeaderText="MaNV" SortExpression="MaNV" />
                    <asp:BoundField DataField="TongHD" HeaderText="Tổng Hóa Đơn" DataFormatString="{0:#,##0 VNĐ}" SortExpression="TongHD" />
                </Columns>

                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="hoadonfd" runat="server"
            ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>"
            SelectCommand="SELECT KhachHang.TenKH, HoaDon.*
                            FROM KhachHang
                            INNER JOIN DatBan ON KhachHang.MaKH = DatBan.MaKH
                            INNER JOIN HoaDon ON DatBan.MaDat = HoaDon.MaDat
							">
        </asp:SqlDataSource>
    </form>
</asp:Content>
