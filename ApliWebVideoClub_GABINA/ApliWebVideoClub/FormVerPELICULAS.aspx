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
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="usuarioLogin" DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="usuarioLogin" HeaderText="usuarioLogin" ReadOnly="True" SortExpression="usuarioLogin" />
                                <asp:BoundField DataField="nombre_apellido" HeaderText="nombre_apellido" SortExpression="nombre_apellido" />
                                <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                                <asp:BoundField DataField="Credito" HeaderText="Credito" SortExpression="Credito" />
                                <asp:BoundField DataField="Fecha_Hora_Alta" HeaderText="Fecha_Hora_Alta" SortExpression="Fecha_Hora_Alta" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="D:\TEMP\VIDEOCLUB_ESTEBAN.mdb" SelectCommand="SELECT * FROM SOCIO"></asp:AccessDataSource>
                    </td>
                </tr>
                </table>
 </div>
</asp:Content>
