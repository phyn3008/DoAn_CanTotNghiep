<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="ThemMonChoBan.aspx.cs" Inherits="DoAn_ASP.PageQTV.ThemMonChoBan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTinhTrang" runat="server">
    <form id="form1" runat="server">
        
        <div class="container">
                <br>
                <asp:SqlDataSource ID="dsloai" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT * FROM [PhanLoai]"></asp:SqlDataSource>
                <div class="xemthucdon">
                    <hr />
                    <div class="form-horizontal">
                        <div class="form-inline">
                            <label class="control-label col-sm-2">Danh Mục Món Ăn:</label>
                            <div class="col-md-2">
                                <asp:DropDownList Width="200px" ID="ddlloaimonan" CssClass="form-control" runat="server" DataTextField="TenPL" DataValueField="MaPL" AutoPostBack="True" DataSourceID="dsloai"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <asp:SqlDataSource ID="dsthucdontheoloai" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" DeleteCommand="DELETE FROM [Menu] WHERE [MaMA] = @MaMA" InsertCommand="INSERT INTO [Menu] ([MaMA], [MaPL], [TenMA], [DonGiaSP], [HinhAnh], [MieuTa], [CoSan]) VALUES (@MaMA, @MaPL, @TenMA, @DonGiaSP, @HinhAnh, @MieuTa, @CoSan)" SelectCommand="SELECT * FROM [Menu] WHERE ([MaPL] = @MaPL)" UpdateCommand="UPDATE [Menu] SET [MaPL] = @MaPL, [TenMA] = @TenMA, [DonGiaSP] = @DonGiaSP, [HinhAnh] = @HinhAnh, [MieuTa] = @MieuTa, [CoSan] = @CoSan WHERE [MaMA] = @MaMA">
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
                            <asp:ControlParameter ControlID="ddlloaimonan" DefaultValue="MaPL" Name="MaPL" PropertyName="SelectedValue" Type="String" />
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
                    <div class="data_items">
                        <asp:Repeater ID="rptxemthucdon" runat="server" DataSourceID="dsthucdontheoloai">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="i">
                                        <a href="#">
                                            <img src='<%# Eval("HinhAnh","../Images/{0}") %>' />
                                        </a>
                                    </div>
                                    <div class="t">
                                        <asp:Label ID="lbltenma" runat="server" Text='<%# Eval("TenMA") %>'></asp:Label>
                                        <br />
                                        Giá:
                                        <asp:Label ID="lblgiaban" CssClass="vn" runat="server" Text='<%# Eval("DonGiaSP") %>'></asp:Label>
                                        <br />
                                        <asp:Button ID="btnthem" runat="server" Text="Thêm" CssClass="btn btn-success" OnClick="btnthem_Click" CommandArgument='<%# Eval("MaMA") %>'/>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>
            </div>
        
    </form>
    <div class="clearfix"></div>

</asp:Content>

