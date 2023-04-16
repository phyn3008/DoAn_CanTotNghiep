<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/QLNhanVien.Master" AutoEventWireup="true" CodeBehind="XemNhanVien.aspx.cs" Inherits="DoAn_ASP.PageQTV.XemNhanVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphXemNhanVien" runat="server">
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="sqldataNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>" SelectCommand="SELECT [MaNV], [TenNV], [LaNam], [SDT], [NamSinh], [IsAdmin] FROM [NhanVien]" DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV" InsertCommand="INSERT INTO [NhanVien] ([MaNV], [TenNV], [LaNam], [SDT], [NamSinh], [IsAdmin]) VALUES (@MaNV, @TenNV, @LaNam, @SDT, @NamSinh, @IsAdmin)" UpdateCommand="UPDATE [NhanVien] SET [TenNV] = @TenNV, [LaNam] = @LaNam, [SDT] = @SDT, [NamSinh] = @NamSinh, [IsAdmin] = @IsAdmin WHERE [MaNV] = @MaNV">
            <DeleteParameters>
                <asp:Parameter Name="MaNV" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MaNV" Type="String" />
                <asp:Parameter Name="TenNV" Type="String" />
                <asp:Parameter Name="LaNam" Type="Boolean" />
                <asp:Parameter Name="SDT" Type="String" />
                <asp:Parameter Name="NamSinh" Type="DateTime" />
                <asp:Parameter Name="IsAdmin" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TenNV" Type="String" />
                <asp:Parameter Name="LaNam" Type="Boolean" />
                <asp:Parameter Name="SDT" Type="String" />
                <asp:Parameter Name="NamSinh" Type="DateTime" />
                <asp:Parameter Name="IsAdmin" Type="Boolean" />
                <asp:Parameter Name="MaNV" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="gvNhanVien" runat="server" Width="100%" DataSourceID="sqldataNhanVien" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="MaNV" OnSelectedIndexChanged="gvNhanVien_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="MaNV" HeaderText="Mã NV" SortExpression="MaNV" ControlStyle-Width="25px" />
                <asp:BoundField DataField="TenNV" HeaderText="TenNV" SortExpression="TenNV" ControlStyle-Width="120px" />
                <asp:TemplateField HeaderText="Giới Tính">
                    <ItemTemplate>
                        <asp:Label ID="lblgioitinh" runat="server" Text='<%# (bool)Eval("LaNam") == true? "Nam" : "Nữ" %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlgioitinh" runat="server" SelectedValue='<%# Bind("LaNam") %>'>
                            <asp:ListItem Value="True">Nam</asp:ListItem>
                            <asp:ListItem Value="False">Nữ</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SDT" HeaderText="SĐT" SortExpression="SĐT" ControlStyle-Width="100px" />
                <asp:BoundField DataField="NamSinh" HeaderText="NamSinh" SortExpression="NamSinh" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:TemplateField HeaderText="Vai Trò">
                    <ItemTemplate>
                        <asp:Label ID="lblvaitro" runat="server" Text='<%# (bool)Eval("isAdmin") == true? "Quản Lý" : "Nhân Viên" %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlvaitro" runat="server" SelectedValue='<%# Bind("isAdmin") %>'>
                            <asp:ListItem Value="True">Quản Lý</asp:ListItem>
                            <asp:ListItem Value="False">Nhân Viên</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Chọn tác vụ">
                    <ItemTemplate>
                        <asp:Button ID="btEdit" CommandName="Edit" runat="server" Text="Sửa" CssClass="btn alert-success" BackColor="#DC3545" ForeColor="White" />
                        <asp:Button ID="btDelete" CommandName="Delete" runat="server" OnClientClick="return confirm('Bạn có chắc muốn xóa sinh viên này?')" Text="Xóa" CssClass="btn btn-danger" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btUpdate" CommandName="Update" runat="server" Text="Ghi" CssClass="btn btn-primary" />
                        <asp:Button ID="btCancel" CommandName="Cancel" runat="server" Text="Không" CssClass="btn btn-warning" />
                    </EditItemTemplate>
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
    </form>

    <div class="clearfix"></div>
</asp:Content>
