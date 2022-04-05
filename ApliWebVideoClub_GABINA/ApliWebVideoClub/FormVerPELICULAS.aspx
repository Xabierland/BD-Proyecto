<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormVerPELICULAS.aspx.vb" Inherits="ApliWebVideoClub.FormVerPELICULAS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
          .style32
        {
            width: 185px;
        }
        .style37
        {
            font-size: large;
        }
                .style100
        {
            height: 525px;
            color:Black;
            font-size:medium;
        }
          .style102
          {
              text-decoration: underline;
              font-weight: bold;
              font-size: large;
        width: 477px;
    }
    .style103
    {
        font-weight: bold;
        font-size: large;
        width: 477px;
        color: red;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="header"><h1 class="style37">Catálogo PELÍCULAS</h1></div>
 <div class="style100">
 <br />
            <table >
             <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style102">
                        </td>
                </tr>
             <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style103">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="codigoPelicula" DataSourceID="AccessDataSource2">
                            <Columns>
                                <asp:BoundField DataField="codigoPelicula" HeaderText="codigoPelicula" ReadOnly="True" SortExpression="codigoPelicula" />
                                <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
                                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                                <asp:BoundField DataField="fechaPublicacion" HeaderText="fechaPublicacion" SortExpression="fechaPublicacion" />
                                <asp:BoundField DataField="fechaAdquisicion" HeaderText="fechaAdquisicion" SortExpression="fechaAdquisicion" />
                            </Columns>
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="C:\TEMP\VIDEOCLUB_GABINA.mdb" SelectCommand="select * from PELICULA where  datediff( &quot;d&quot;, now() , fechaAdquisicion ) &lt;=7"></asp:AccessDataSource>
                    </td>
                </tr>
             <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style103">
                        &nbsp;</td>
                </tr>
             <tr>
                    <td class="style32">
                        <asp:Label ID="Label1" runat="server" Text="Pon un nombre aqui:"></asp:Label>
                    </td>
                    <td class="style103">
                        <asp:TextBox ID="Nombre" runat="server"></asp:TextBox>
                        <asp:Button ID="Mostrar" runat="server" Text="Mostrar Saludo" />
                    </td>
                </tr>
             <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style103">
                        <asp:Label ID="Mensaje" runat="server"></asp:Label>
                    </td>
                </tr>
                </table>
 </div>
</asp:Content>
