<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="CTDB.aspx.cs" Inherits="DoAn_ASP.PageQTV.CTDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTinhTrang" runat="server">
    <form id="f" runat="server">
        <h1 class="text-center">Chi Tiết Bàn: 
            <asp:Label ID="lblmaban" runat="server" Text=""></asp:Label>
        </h1>
        <hr />
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rptdatban" runat="server" DataSourceID="datban">
                    <ItemTemplate>
                        <div class="col-6 row">
                            <h3 class="text-center">Thông Tin Bàn Đặt</h3>

                            <div class="col-6">Mã Đặt Bàn:</div>
                            <div class="col-6">
                                <asp:Label ID="lblmadat" runat="server" Text='<%# Eval("MaDat")%>'></asp:Label>
                            </div>
                            <div class="col-6">Mã Khách Hàng:</div>
                            <div class="col-6">
                                <asp:Label ID="lblma" runat="server" Text='<%# Eval("MaKH")%>'></asp:Label>

                            </div>
                            <div class="col-6">Ngày Đặt:</div>
                            <div class="col-6">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("NgayDat", "{0:dd/MM/yyyy}")%>'></asp:Label>
                            </div>
                            <div class="col-6">Ngày Hết Hạn:</div>
                            <div class="col-6">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("NgayHetHan", "{0:dd/MM/yyyy}")%>'></asp:Label>
                            </div>
                        </div>
                        <div class="col-6 row">
                            <h3 class="text-center">Thông Tin Khách Hàng</h3>
                            <asp:Label ID="lblmakh" runat="server" Text=""></asp:Label>

                            <div class="col-6">Tên Khách Hàng:</div>
                            <div class="col-6">
                                <asp:Label ID="Label" runat="server" Text='<%# Eval("TenKH")%>'></asp:Label>
                            </div>
                            <div class="col-6">Giới Tính:</div>
                            <div class="col-6">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("LaNam")%>'></asp:Label>
                            </div>
                            <div class="col-6">Số Điện Thoại:</div>
                            <div class="col-6">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("SDT")%>'></asp:Label>
                            </div>
                            <div class="col-6">Tiền Cọc:</div>
                            <div class="col-6">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("TraTruoc", "{0:#,##0 VNĐ}")%>'></asp:Label>
                            </div>
                            <div class="col-6">Địa Chỉ:</div>
                            <div class="col-6">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("DiaChi")%>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="row">
                <div class="col-12 mt-5">
                    <h3 class="text-center">Thực Đơn Của Bàn</h3>
                    <asp:GridView ID="gvthucdon" runat="server" CellPadding="4" DataSourceID="thucdoncuaban" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="MaMA" Width="100%" OnRowDataBound="gvthucdon_RowDataBound"
                        OnRowDeleting="gvthucdon_RowDeleting" OnRowUpdating="gvthucdon_RowUpdating">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:ImageField DataImageUrlField="HinhAnh" DataImageUrlFormatString="~/Images/{0}" HeaderText="Hình Ảnh" ControlStyle-Width="150px" ControlStyle-Height="70px" />
                            <asp:BoundField DataField="TenMA" HeaderText="Tên Món Ăn" SortExpression="TenMA" />
                            <asp:TemplateField HeaderText="Số Lượng">
                                <ItemTemplate>
                                    <asp:TextBox Width="80px" DataField="SoLuong" TextMode="Number" SortExpression="SoLuong" CssClass="form-control text-center" ID="txtsoluong" runat="server" Text='<%# Eval("SoLuong")%>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DonGiaSP" HeaderText="Đơn giá" SortExpression="DonGiaSP" />
                            <asp:TemplateField HeaderText="Thành Tiền">
                                <ItemTemplate>
                                    <asp:Label ID="lblthanhtien" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Xóa" ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/img/delete.gif" />
                            <asp:TemplateField HeaderText="Lưu">
                                <ItemTemplate>
                                    <asp:ImageButton CommandName="update" ID="ImageButton1" runat="server" ImageUrl="~/img/disk.gif" />
                                </ItemTemplate>
                            </asp:TemplateField>
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
                <div class="col-12 mt-5 row">
                    <div class="col-4 text-left">
                        <asp:Button ID="btnthemmon" runat="server" Text="Thêm Món" CssClass="btn btn-success" OnClick="btnthemmon_Click" />
                    </div>
                    <div class="col-4 text-center">
                        <asp:Button ID="btntinhtien" runat="server" Text="Tính Tiền" CssClass="btn btn-success" OnClick="btntinhtien_Click" />
                    </div>
                    <div class="col-4 text-right">
                        Tổng Hóa Đơn:
                        <asp:Label ID="lbltonghoadon" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="datban" runat="server"
            ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>"
            SelectCommand="SELECT DatBan.*, KhachHang.* 
            FROM DatBan
            INNER JOIN KhachHang ON DatBan.MaKH = KhachHang.MaKH
            WHERE DatBan.madat = @MaDat">
            <SelectParameters>
                <asp:QueryStringParameter Name="MaDat" QueryStringField="MaDat" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="thucdoncuaban" runat="server"
            ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>"
            SelectCommand="SELECT Menu.MaMa, Menu.TenMA, Menu.HinhAnh, CTHoaDon.SoLuong, Menu.DonGiaSP
                            FROM HoaDon
                            INNER JOIN CTHoaDon ON HoaDon.MaHD = CTHoaDon.MaHD
                            INNER JOIN Menu ON CTHoaDon.MaMa = Menu.MaMa where HoaDon.MaDat = @MaDat"
            DeleteCommand="DELETE FROM CTHoaDon WHERE MaHD=@MaHD AND MaMA=@MaMA"
            UpdateCommand="UPDATE CTHoaDon SET SoLuong=@SoLuong  WHERE MaHD=@MaHD AND MaMA=@MaMA">
            <SelectParameters>
                <asp:QueryStringParameter Name="MaDat" QueryStringField="MaDat" Type="String"/>
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
    </form>
</asp:Content>




