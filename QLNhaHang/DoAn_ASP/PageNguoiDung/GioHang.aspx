<%@ Page Title="" Language="C#" MasterPageFile="~/PageNguoiDung/PageNguoiDung.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="DoAn_ASP.PageNguoiDung.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">

    <div class="container">
        <h1>Giỏ Hàng</h1>
        <form runat="server">
            <asp:GridView DataKeyNames="mama" ID="gvgiohang" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowDeleting="gvgiohang_RowDeleting" OnRowUpdating="gvgiohang_RowUpdating">
                <Columns>
                    <asp:ImageField HeaderText="Ảnh Sản Phẩm" DataImageUrlField="hinh" DataImageUrlFormatString="~/Images/{0}" ControlStyle-Width="150px"></asp:ImageField>
                    <asp:BoundField HeaderText="Tên Sản Phẩm" DataField="tenma" />
                    <asp:BoundField HeaderText="Đơn Giá" DataField="dongia" DataFormatString="{0:#,##0 Đ}" />
                    <asp:TemplateField HeaderText="Số Lượng">
                        <ItemTemplate>
                            <asp:TextBox Width="80px" TextMode="Number" CssClass="form-control text-center" ID="txtsoluong" runat="server" Text='<%# Eval("soluong")%>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Thành Tiền" DataField="thanhtien" DataFormatString="{0:#,##0 Đ}" />
                    <asp:CommandField HeaderText="Xóa" ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/img/delete.gif" />
                    <asp:TemplateField HeaderText="Lưu">
                        <ItemTemplate>
                            <asp:ImageButton CommandName="update" ID="ImageButton1" runat="server" ImageUrl="~/img/disk.gif" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="alert alert-info">Chưa có sản phẩm trong giỏ</div>
                </EmptyDataTemplate>
            </asp:GridView>


        <div class="row">
            <div class="col-6">
                <a href="DatMonMangVe.aspx" class="btn btn-danger">Tiếp Tục Mua Hàng</a>
            </div>
            <div class="col-6 text-right">
                <asp:Label ID="lbltongthanhtien" runat="server" Text=""></asp:Label>
            </div>
        </div>

       <div class="row" style="padding-bottom: 10px">
            <div class="col-md-12 text-right">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#dathang" data-whatever="@mdo">
                    Đặt Hàng<br />
                </button>
                <asp:Label ID="lbtb" runat="server" Text=""></asp:Label>

            </div>
        </div>
         <div class="modal fade" id="dathang" tabindex="-1" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="exampleModalLabel" style="font-weight: bold">THÔNG TIN ĐẶT HÀNG</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                            <div class="form-group">
                                <label class="col-form-label">Họ Và Tên</label>
                                <asp:TextBox ID="txtTenKH" class="form-controls" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTenKH" runat="server" ErrorMessage="Vui Lòng Không Để Trống Tên Khách Hàng" ControlToValidate="txtTenKH" Text="(*)"></asp:RequiredFieldValidator>

                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Số Điện Thoại</label>
                                <asp:TextBox ID="txtSDT" runat="server" class="form-controls" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvSDT" runat="server" ErrorMessage="Vui Lòng Không Để Trống Số Điện Thoại" ControlToValidate="txtSDT" Text="(*)"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revSDT" runat="server" ErrorMessage="Sai Định Dạng SĐT" ControlToValidate="txtSDT" ValidationExpression="0\d{9}" Text="(*)"></asp:RegularExpressionValidator>

                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Giới Tính &nbsp</label>
                                <asp:RadioButton ID="rdNam" GroupName="gioiTinh" Text="Nam" Checked="true" runat="server" />
                                <asp:RadioButton ID="rdNu" GroupName="gioiTinh" Text="Nữ" runat="server" />

                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Ngày Muốn Đặt</label>
                                <asp:Calendar ID="cldNgayDat" runat="server"></asp:Calendar>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Địa Chỉ</label>
                                <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rsvDiaChi" runat="server" ErrorMessage="Vui Lòng Không Để Trống Địa Chỉ" ControlToValidate="txtDiaChi" Text="(*)"></asp:RequiredFieldValidator>

                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Ghi Chú</label>
                                <asp:TextBox ID="txtGhiChu" runat="server"></asp:TextBox>
                            </div>
                            <asp:Label ID="TongHopLoi" runat="server" Text="">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                            </asp:Label>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <asp:Button ID="btnDatBan" runat="server" Text="ĐẶT" CssClass="btn btn-primary" OnClick="btnDatBan_Click" />

                            </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>

</asp:Content>
