<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="OrderTaiQuan.aspx.cs" Inherits="DoAn_ASP.PageQTV.OrderTaiQuan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTinhTrang" runat="server">
    <form id="d" runat="server">
        <div class="container">
            <div class="row">
                <h1 class="text-center">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h1>

                <div class="col-12 py-3 row">
                    <h3 class="text-center my-3">Thông tin bàn sử dụng</h3>

                    <div class="col-6 text-center">Tên Khách Hàng:</div>
                    <div class="col-6">
                        <asp:TextBox ID="txttenkh" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-6 text-center">SĐT:</div>
                    <div class="col-6">
                        <asp:TextBox ID="txtsdt" runat="server"></asp:TextBox>
                    </div>

                </div>
                <div class="col-12">
                    <h3 class="text-center my-3">Thực Đơn</h3>
                    <asp:GridView ID="gvbanhienhanh" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaMA" DataSourceID="thucdoncuabanhienhanh" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="MaMA" HeaderText="MaMA" ReadOnly="True" SortExpression="MaMA" />
                            <asp:BoundField DataField="MaPL" HeaderText="MaPL" SortExpression="MaPL" />
                            <asp:BoundField DataField="TenMA" HeaderText="TenMA" SortExpression="TenMA" />
                            <asp:BoundField DataField="DonGiaSP" HeaderText="DonGiaSP" SortExpression="DonGiaSP" />
                            <asp:BoundField DataField="HinhAnh" HeaderText="HinhAnh" SortExpression="HinhAnh" />
                            <asp:BoundField DataField="MieuTa" HeaderText="MieuTa" SortExpression="MieuTa" />
                            <asp:CheckBoxField DataField="CoSan" HeaderText="CoSan" SortExpression="CoSan" />
                            <asp:BoundField DataField="soluong" HeaderText="soluong" SortExpression="soluong" />
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="alert alert-info">Bàn này hiện chưa có món ăn</div>
                        </EmptyDataTemplate>
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
                <div class="col-12 text-right">
                    <asp:Button ID="btnsudung" runat="server" Text="Sử Dụng Bàn" CssClass="btn btn-success" Width="150px" OnClick="btnsudung_Click"/>
                </div>
            </div>
        </div>

    </form>
    <asp:SqlDataSource ID="thucdoncuabanhienhanh" runat="server"
        ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>"
        SelectCommand="SELECT Menu.*, CTHoaDon.soluong
            FROM CTHoaDon INNER JOIN Menu ON CTHoaDon.MaMa = Menu.MaMA 
            WHERE CTHoaDon.MaDat = @MaDat">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaDat" QueryStringField="MaDat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
