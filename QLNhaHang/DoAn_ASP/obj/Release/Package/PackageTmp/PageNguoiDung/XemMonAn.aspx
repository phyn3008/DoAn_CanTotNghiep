<%@ Page Title="" Language="C#" MasterPageFile="~/PageNguoiDung/PageNguoiDung.Master" AutoEventWireup="true" CodeBehind="XemMonAn.aspx.cs" Inherits="DoAn_ASP.PageNguoiDung.XemMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="list-group col-3">
                    <a href="#" class="list-group-item list-group-item-action list-group-item-success">Danh Mục Thực Phẩm</a>
                    <asp:Repeater ID="rptLoai" runat="server" DataSourceID="dsPhanLoai">
                        <ItemTemplate>
                            <a href='<%# Eval("MaPL","XemMonAn.aspx?MaPL={0}") %>' class="list-group-item list-group-item-action">
                                <%# Eval("TenPL") %>
                            </a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsPhanLoai" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [PhanLoai]"></asp:SqlDataSource>
                </div>

                <div class="col-9">
                    <div class="data-items">
                        <asp:Repeater ID="rptMenu" runat="server" DataSourceID="dsThucPham">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="i">
                                        <a href="#">
                                            <img src='<%# Eval("HinhAnh","../Images/{0}") %>' />
                                        </a>
                                    </div>
                                    <div class="t">
                                        <div class="tenma">
                                            <asp:Label ID="lbTen" runat="server" Text='<%# Eval("TenMA")%>'></asp:Label>
                                        </div>
                                        <div class="giama">
                                            Giá bán:
                                <asp:Label ID="lbGia" runat="server" Text='<%# Eval("DonGiaSP","{0:#,##0} đồng")%>'></asp:Label>
                                        </div>
                                        <div id="ct">
                                            <a href='<%# Eval("MaMA","XemChiTiet.aspx?MaMA={0}") %>'>Xem Chi Tiet</a>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <asp:SqlDataSource ID="dsThucPham" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [Menu] WHERE ([MaPL] = @MaPL)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="1" Name="MaPL" QueryStringField="MaPL" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </form>

</asp:Content>
