<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/QLNhanVien.Master" AutoEventWireup="true" CodeBehind="ThemNV.aspx.cs" Inherits="DoAn_ASP.PageQTV.ThemXoaNV" %>

<asp:Content ID="Content4" ContentPlaceHolderID="cphThemXoa" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row py-3">
                <asp:Label CssClass="col-3 text-left" runat="server" Text="Mã NV:"></asp:Label>
                <asp:TextBox CssClass="col-3" ID="txtMaNV" runat="server"></asp:TextBox>
                <asp:Label CssClass="col-3 text-right" runat="server" Text="Tên NV:"></asp:Label>
                <asp:TextBox CssClass="col-3" ID="txttennv" runat="server"></asp:TextBox>
            </div>
            <div class="row py-3">
                <asp:Label CssClass="col text-left" runat="server" Text="Giới Tính:"></asp:Label>
                <asp:RadioButton CssClass="col text-right" ID="rdNam" runat="server" Text="Nam" Checked="true" GroupName="GT" />
                <asp:RadioButton CssClass="col text-left" ID="rdNu" runat="server" Text="Nữ" GroupName="GT" />
                <asp:Label CssClass="col text-right" runat="server" Text="Số Điện Thoại:"></asp:Label>
                <asp:TextBox CssClass="col" ID="txtsdt" runat="server"></asp:TextBox>
            </div>
            <div class="row py-3">
                <asp:Label CssClass="col-3 text-left" runat="server" Text="Ngày Sinh:"></asp:Label>
                <asp:TextBox CssClass="col-3" ID="txtngaysinh" runat="server" TextMode="Date"></asp:TextBox>
                <asp:Label CssClass="col-3 text-right" runat="server" Text="Địa Chỉ:"></asp:Label>
                <asp:TextBox CssClass="col-3" ID="txtDiaChi" runat="server"></asp:TextBox>
            </div>
            <div class="row py-3">
                <asp:Label CssClass="col-3 text-left" runat="server" Text="CMND:"></asp:Label>
                <asp:TextBox CssClass="col-3" ID="txtcmnd" runat="server"></asp:TextBox>
                <asp:Label CssClass="col-3 text-right" runat="server" Text="Email:"></asp:Label>
                <asp:TextBox CssClass="col-3" ID="txtemail" runat="server"></asp:TextBox>
            </div>

            <div class="text-center py-3">
                <asp:Button ID="btThem" runat="server" Text="Thêm Mới" CssClass="btn btn-success" OnClick="btThem_Click" />
                <br />
                <asp:Label ID="lblthongbao" ForeColor="Red" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
    <div class="clearfix"></div>
</asp:Content>
