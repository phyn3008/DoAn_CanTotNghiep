<%@ Page Title="" Language="C#" MasterPageFile="~/PageNguoiDung/PageNguoiDung.Master" AutoEventWireup="true" CodeBehind="DatBan.aspx.cs" Inherits="DoAn_ASP.PageNguoiDung.DatBan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">



    <asp:SqlDataSource ID="dsban" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" DeleteCommand="DELETE FROM [Ban] WHERE [MaBan] = @MaBan" InsertCommand="INSERT INTO [Ban] ([MaBan], [TinhTrang], [MaDat]) VALUES (@MaBan, @TinhTrang, @MaDat)" SelectCommand="SELECT [MaBan], [TinhTrang], [MaDat] FROM [Ban]" UpdateCommand="UPDATE [Ban] SET [TinhTrang] = @TinhTrang, [MaDat] = @MaDat WHERE [MaBan] = @MaBan">
        <DeleteParameters>
            <asp:Parameter Name="MaBan" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaBan" Type="String" />
            <asp:Parameter Name="TinhTrang" Type="Boolean" />
            <asp:Parameter Name="MaDat" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TinhTrang" Type="Boolean" />
            <asp:Parameter Name="MaDat" Type="String" />
            <asp:Parameter Name="MaBan" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="data_items" style="width: 80%">
        <asp:Repeater ID="rptBan" runat="server" DataSourceID="dsban">
            <ItemTemplate>
                <div class="item">
                    <div class="i">
                        <a href="#">
                            <img src="../img/caiban.jpg" />
                        </a>
                    </div>
                    <div class="t">
                        Bàn:
                            <asp:Label ID="lbltenhoa" runat="server" Text='<%# Eval("Maban") %>'></asp:Label>
                        <br />
                        Tình Trạng:
                            <asp:Label ID="lblgiaban" CssClass="vn" runat="server" Text='<%# (Boolean)Eval("TinhTrang") ? "Hết bàn" : "Trống bàn"%>'></asp:Label>
                        <br />


                        <%--<a class="btn btn-info" href='<%# Eval("MaBan","CTDatBan.aspx?MaBan={0}")%>'>ĐẶT BÀN</a>--%>
                        <button id="order-table-btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="<%# (Boolean)Eval("TinhTrang")==true ? "#modal-banhet" : "#exampleModal"%>" 
                            data-whatever="<%# Eval("MaBan","{0}")%>">
                            Đặt Bàn<br />
                        </button>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div class="modal" id="modal-banhet" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">THÔNG TIN</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>BÀN NÀY KHÔNG CÒN VUI LÒNG CHỌN BÀN KHÁC</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalLabel" style="font-weight: bold">THÔNG TIN ĐẶT BÀN</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <label class="col-form-label">Số Bàn</label>
                            <asp:TextBox ID="txtSoBan" class="form-controls" runat="server" CssClass="form-control" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui Lòng Không Để Trống Tên Khách Hàng" ControlToValidate="txtTenKH" Text="(*)"></asp:RequiredFieldValidator>

                        </div>
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
                            <label for="message-text" class="col-form-label">Ghi Chú</label>
                            <asp:TextBox ID="txtGhiChu" runat="server"></asp:TextBox>
                        </div>
                        <asp:Label ID="TongHopLoi" runat="server" Text="">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        </asp:Label>
                        <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnDatBan" runat="server" Text="Đặt Bàn" CssClass="btn btn-primary" OnClick="btnDatBan_Click" />
                </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix">
    </div>


</asp:Content>
