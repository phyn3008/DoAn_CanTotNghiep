<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/QLNhanVien.Master" AutoEventWireup="true" CodeBehind="QuanLyLuong.aspx.cs" Inherits="DoAn_ASP.PageQTV.QuanLyLuong" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphQuanLyLuong" runat="server">
    <form id="form1" runat="server">


        <asp:SqlDataSource ID="qlluong" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV" InsertCommand="INSERT INTO [NhanVien] ([MaNV], [TenNV], [IsAdmin], [Socong]) VALUES (@MaNV, @TenNV, @IsAdmin, @Socong)" SelectCommand="SELECT [MaNV], [TenNV], [IsAdmin], [Socong] FROM [NhanVien]" UpdateCommand="UPDATE [NhanVien] SET [TenNV] = @TenNV, [IsAdmin] = @IsAdmin, [Socong] = @Socong WHERE [MaNV] = @MaNV">
            <DeleteParameters>
                <asp:Parameter Name="MaNV" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MaNV" Type="String" />
                <asp:Parameter Name="TenNV" Type="String" />
                <asp:Parameter Name="IsAdmin" Type="Boolean" />
                <asp:Parameter Name="Socong" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TenNV" Type="String" />
                <asp:Parameter Name="IsAdmin" Type="Boolean" />
                <asp:Parameter Name="Socong" Type="Int32" />
                <asp:Parameter Name="MaNV" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="container-fluid">
            <asp:GridView ID="gvchamcong" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaNV" DataSourceID="qlluong" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaNV" HeaderText="MaNV" ReadOnly="True" SortExpression="MaNV" />
                    <asp:BoundField DataField="TenNV" HeaderText="TenNV" SortExpression="TenNV" />
                    <asp:CheckBoxField DataField="IsAdmin" HeaderText="IsAdmin" SortExpression="IsAdmin" />
                    <asp:TemplateField HeaderText="Số Ngày Công">
                        <ItemTemplate>
                            <asp:TextBox Width="80px" TextMode="Number" CssClass="form-control text-center" ID="txtsocong" runat="server" Text='<%# Eval("socong")%>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <%-- <asp:TemplateField HeaderText="Tác Vụ">
                        <ItemTemplate>
                            <asp:Button ID="btntinhluong" runat="server" Width="100px" CssClass="btn btn-success" Text="Tính Lương" OnClick="btntinhluong_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Lương">
                        <ItemTemplate>
                            <asp:Label ID="lblLuong" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

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
        <div class="container text-right">
           
        <asp:Button ID="btntang" runat="server" Text="Tăng" Width="100px" CssClass="btn btn-success mt-3 mr-3" OnClick="btntang_Click"/>
        <asp:Button ID="btnluu" runat="server" Text="Lưu" Width="100px" CssClass="btn btn-success mt-3" OnClick="btnluu_Click"/>
    </div>
    </form>

    
    <div class="clearfix"></div>
</asp:Content>
