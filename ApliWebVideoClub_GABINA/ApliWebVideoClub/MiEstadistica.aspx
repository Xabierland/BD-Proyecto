<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MiEstadistica.aspx.vb" Inherits="ApliWebVideoClub.MiEstadistica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <table style="width:100%;">
        <tr>
            <td>Cuantas veces ha sido una pelicula alquilada por el mismo usuario? (si es &gt;1)</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>dada una película (título), develve los usuarios que la han alquilado este año y cuantas veces, siempre que lo haya alquilado más de 1 vez. Ordenado por nombre alfabéticamente</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TITULO" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Button" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:BoundField DataField="usuarioLogin" HeaderText="usuarioLogin" SortExpression="usuarioLogin" />
                        <asp:BoundField DataField="Expr1001" HeaderText="cantidad" SortExpression="Expr1001" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="D:\TEMP\VIDEOCLUB_ESTEBAN.mdb" SelectCommand="SELECT usuarioLogin,count(ALQUILER.codigo)
FROM ALQUILER INNER JOIN PELICULA ON PELICULA.codigo=ALQUILER.codigo
WHERE year(fechaAlquiler)=year(NOW()) AND titulo LIKE ?
GROUP BY usuarioLogin
HAVING count(ALQUILER.codigo)&gt;1
ORDER BY usuarioLogin">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TITULO" Name="?" PropertyName="Text" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>
</asp:Content>
