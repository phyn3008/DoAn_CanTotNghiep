<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CTDatBan.aspx.cs" Inherits="DoAn_ASP.PageNguoiDung.CTDatBan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="dsCTDatBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [Ban] WHERE ([MaBan] = @MaBan)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="MaBan" QueryStringField="MaBan" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="datban container-fluid" style="display: flex; margin-top: 50px">
            <div id="b-left" style="width: 35%;">
                <div style="">
                    <div class="panel panel-info" style="text-align: center; border: 2px solid black">
                        <h2 style="font-weight: bold">THÔNG TIN ĐẶT BÀN</h2>
                    </div>
                    <div class="panel-body" style="border: 2px solid black">
                        <div class="form-horizontal">
                             <div class="form-group">
                            <label class="control-label col-sm-4"">
                                Bàn Số:</label>
                                   <asp:Label ID="lblSoBan" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">
                                    Tên Khách Hàng:</label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblTenkh" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">
                                    Giới Tính</label>
                                <div class="col-sm-8" font-bold="True">
                                    <asp:Label ID="lblGioiTinh" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">
                                    Số Điện Thoại:</label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblSDT" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">
                                    Ngày Đặt:</label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblNgayDat" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">
                                    Ghi Chú:</label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblGhiChu" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </div>
            <div id="b-right" style="width: 60%; margin-left: 5%;">
                <div>
                    <div class="panel panel-info" style="text-align: center; border: 2px solid black">
                        <h2 style="font-weight: bold">DANH SÁCH MÓN ĂN ĐẶT</h2>
                    </div>
                </div>
                <div style="height:30px; line-height:30px;">
                    <asp:Label ID="lbThongBao" BackColor="aquamarine" ForeColor="Black" Width="70%"  runat="server"></asp:Label>
                    <a class="btn btn-info" style="float:right;" href="DatMonChoBan.aspx">Thêm Món</a>
                </div>
                <div style="margin-top:10px">
                    <asp:GridView DataKeyNames="mama" ID="gvmonan" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowDeleting="gvmonan_RowDeleting" OnRowUpdating="gvmonan_RowUpdating">
                        <Columns>
                            <asp:BoundField HeaderText="Tên Món ĂN" DataField="tenma" />
                            <%--                <asp:ImageField HeaderText="Ảnh Sản Phẩm" DataImageUrlField="hinh" DataImageUrlFormatString="Images/{0}" ControlStyle-Width="150px"></asp:ImageField>--%>
                            <asp:BoundField HeaderText="Đơn Gía" DataField="dongia" />
                            <asp:TemplateField HeaderText="Số Lượng">
                                <ItemTemplate>
                                    <asp:TextBox Width="80px" TextMode="Number" CssClass="form-control text-center" ID="txtsoluong" runat="server" Text='<%# Eval("soluong")%>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Thành Tiền" DataField="thanhtien" DataFormatString="{0:#,##0 Đ}" />
                            <asp:TemplateField HeaderText="Lưu">
                                <ItemTemplate>
                                    <asp:ImageButton CommandName="update" ID="ImageButton1" runat="server" ImageUrl="~/Images/disk.gif" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Xóa" ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/Images/delete.gif" />
                        </Columns>
                    </asp:GridView>
                    <div class="row">
                        <div class="container-fluid text-right">
                            Tổng Thành Tiền:
                            <asp:Label ID="lbltongthanhtien" Font-Size="20px" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <div class="container-fluid text-right" style="width:100px">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btDatBan" runat="server" Text="Đặt Bàn" CssClass="btn btn-success" OnClick="btDatBan_Click" />
            </div>
            <asp:Label ID="lbtb" runat="server" Text=""></asp:Label>

        </div>
    </form>
</body>
</html>
