<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="ThayDoi.aspx.cs" Inherits="DoAn_ASP.PageQTV.ThayDoi" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphThucDon" runat="server">
    <form id="form1" runat="server">


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" DeleteCommand="DELETE FROM [Menu] WHERE [MaMA] = @MaMA" InsertCommand="INSERT INTO [Menu] ([MaMA], [MaPL], [TenMA], [DonGiaSP], [HinhAnh], [MieuTa], [CoSan]) VALUES (@MaMA, @MaPL, @TenMA, @DonGiaSP, @HinhAnh, @MieuTa, @CoSan)" SelectCommand="SELECT * FROM [Menu] WHERE ([MaMA] = @MaMA)" UpdateCommand="UPDATE [Menu] SET [MaPL] = @MaPL, [TenMA] = @TenMA, [DonGiaSP] = @DonGiaSP, [HinhAnh] = @HinhAnh, [MieuTa] = @MieuTa, [CoSan] = @CoSan WHERE [MaMA] = @MaMA">
            <DeleteParameters>
                <asp:Parameter Name="MaMA" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MaMA" Type="String" />
                <asp:Parameter Name="MaPL" Type="String" />
                <asp:Parameter Name="TenMA" Type="String" />
                <asp:Parameter Name="DonGiaSP" Type="Int32" />
                <asp:Parameter Name="HinhAnh" Type="String" />
                <asp:Parameter Name="MieuTa" Type="String" />
                <asp:Parameter Name="CoSan" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="A10" Name="MaMA" QueryStringField="mama" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MaPL" Type="String" />
                <asp:Parameter Name="TenMA" Type="String" />
                <asp:Parameter Name="DonGiaSP" Type="Int32" />
                <asp:Parameter Name="HinhAnh" Type="String" />
                <asp:Parameter Name="MieuTa" Type="String" />
                <asp:Parameter Name="CoSan" Type="Boolean" />
                <asp:Parameter Name="MaMA" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <hr />
        <div class="container">
            <h2>Thay Đổi Thông Tin Món Ăn</h2>
            <div class="row">
                <div class="col-6">
                    <asp:Image ID="hinh" runat="server" Width="70%" />
                </div>
                <div class="col-6">
                    <div class="row py-3">
                        <asp:Label ID="Label1" runat="server" Text="Tên Món Ăn:" CssClass="col-6 text-center"></asp:Label>
                        <asp:TextBox ID="txttenma" runat="server" CssClass="col-6 "></asp:TextBox>
                    </div>
                    <div class="row py-3">
                        <asp:Label ID="Label2" runat="server" Text="Đơn Giá:" CssClass="col-6 text-center"></asp:Label>
                        <asp:TextBox ID="txtdongia" runat="server" CssClass="col-6" ></asp:TextBox>
                    </div>
                    <div class="row py-3">
                        <asp:Label ID="Label3" runat="server" Text="Comment: " CssClass="col-6 text-center"></asp:Label>
                        <asp:TextBox Height="100px" ID="txtmieuta" runat="server" CssClass="col-6"></asp:TextBox>
                    </div>
                    <div class="row py-3">
                        <div class="col-6 text-right">
                        <asp:Button CssClass="btn btn-success" ID="btnthaydoi" runat="server" Text="Thay Đổi" OnClick="btnthaydoi_Click" OnClientClick="return confirm('Hãy xác nhận thay đỗi!')" Width="100px" />
                        </div>
                        <div class="col-6 text-right">
                        <asp:Button CssClass="btn btn-danger" ID="btnXoa" runat="server" Text="Xóa" OnClick="btnXoa_Click" OnClientClick="return confirm('Bạn có chắc muốn xóa món ăn này?')" Width="100px" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="clearfix"></div>
</asp:Content>


