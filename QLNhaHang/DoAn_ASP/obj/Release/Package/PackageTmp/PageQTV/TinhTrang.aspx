<%@ Page Title="" Language="C#" MasterPageFile="~/PageQTV/PageQTV.Master" AutoEventWireup="true" CodeBehind="TinhTrang.aspx.cs" Inherits="DoAn_ASP.PageQTV.TinhTrang" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphTinhTrang" runat="server">

    <asp:SqlDataSource ID="dsban" runat="server"
        ConnectionString="<%$ ConnectionStrings:QLNH_ASPConnectionString %>"
        SelectCommand="SELECT * FROM [Ban]">
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
                            <asp:Label ID="lbltenban" runat="server" Text='<%# Eval("Maban") %>'></asp:Label>
                        <br />
                        Tình Trạng:
                            <asp:Label ID="lblgiaban" CssClass="vn" runat="server" Text='<%# (Boolean)Eval("TinhTrang") ? "Đang Hoạt Động" : "Trống bàn"%>'></asp:Label>
                        <br />
                        <a href='<%# (bool)Eval("TinhTrang")==false? Eval("MaBan","OrderTaiQuan.aspx?MaBan={0}") : string.Format("CTDB.aspx?MaDat={0}&Maban={1}", Eval("MaDat"), Eval("MaBan"))  %>' class="btn btn-success">Chi Tiết</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
