<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Estadisticas.aspx.vb" Inherits="ApliWebVideoClub.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            height: 481px;
        }
        .auto-style3 {
            height: 54px;
        }
        .auto-style4 {
            height: 93px;
        }
        .auto-style5 {
            height: 81px;
        }
        .auto-style7 {
            height: 82px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <table class="auto-style2">
        <tr style="color: #FFFFFF; background-color: #6699FF">
            <td class="auto-style3"><h1 class="style37" style="font-size: xx-large; color: #FFFFFF;">ranking clientes del videoclub</h1></td>
        </tr>
        <tr>
            <td align="justify" class="auto-style4" style="font-size: medium; color: #000000">Habiendo elegido un año, muestra a los clientes que mas dinero han invertido en el videoclub junto al numero de peliculas alquiladas de cada uno ordenadas de mayor a menor</td>
        </tr>
        <tr>
            <td align="center" class="auto-style5">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Cargar Ranking" />
            </td>
        </tr>
        <tr>
            <td align="center" class="auto-style7" style="color: #000000; text-align: center;">
                <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="&quot;CLIENTE&quot;" HeaderText="&quot;CLIENTE&quot;" SortExpression="&quot;CLIENTE&quot;" />
                        <asp:BoundField DataField="&quot;DINERO GASTADO&quot;" HeaderText="&quot;DINERO GASTADO&quot;" SortExpression="&quot;DINERO GASTADO&quot;" />
                        <asp:BoundField DataField="&quot;PELICULAS ALQUILADAS&quot;" HeaderText="&quot;PELICULAS ALQUILADAS&quot;" SortExpression="&quot;PELICULAS ALQUILADAS&quot;" />
                    </Columns>
                </asp:GridView>
                </div>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\TEMP\VIDEOCLUB_GABINA.mdb" SelectCommand="SELECT userLogin AS [&quot;CLIENTE&quot;], sum(Precio) AS [&quot;DINERO GASTADO&quot;], count(userLogin) AS [&quot;PELICULAS ALQUILADAS&quot;]
FROM ALQUILER INNER JOIN PELICULA ON Pelicula.codigoPelicula=Alquiler.peliID
WHERE year(fechaAlquiler)=?
GROUP BY userLogin
HAVING count(userLogin)&gt;0
ORDER BY sum(Precio) DESC , count(userLogin) DESC;
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="?" PropertyName="Text" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</div>
</asp:Content>
