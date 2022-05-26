<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormularioFuncionesSOCIO.aspx.vb" Inherits="ApliWebVideoClub.FormularioFuncionesSOCIO" %>
   <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
       <style type="text/css">
        .style2
        {
            width: 66px;
        }
        .style3
        {
            text-align: justify;
            
        }
        .style12
        {
            width: 10px;
        }
        .style20
        {
            width: 202px;
        }
        .style23
        {
            width: 73px;
        }
        .style24
        {
            width: 309px;
           
        }
        .style27
        {
            width: 320px;
        }
        .style28
        {
            width: 174px;
        }
        .style30
        {
            width: 160px;
        }
        .style31
        {
            width: 158px;
              color: #FF0000;
          }
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
          }
           .auto-style1 {
               width: 202px;
               height: 32px;
           }
           .auto-style2 {
               width: 320px;
               height: 32px;
           }
           .auto-style3 {
               width: 174px;
               height: 32px;
           }
           .auto-style4 {
               height: 32px;
           }
    </style>
 </asp:Content>
   

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="header"><h1 class="style37">Funciones SOCIO</h1></div>
    <div class="style100">
    
        <br />

        <table >
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    Realice todas las funciones que quiera . Rellene los datos oportunos y pulse el 
                    botón.<br />
                    </td>
            </tr>
        </table>
            <br />
            <table >
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style102">
                        Modificar mis datos personales</td>
                </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style27" >
                    Nombre 
                    y apellidos</td>
                <td class="style28">
                    <asp:TextBox ID="Nombre" runat="server"  
                        ToolTip="Introduzca su nombre y apellidos" SkinID="-1"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Modificar" runat="server" Text="Modificar datos" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    </td>
                <td class="auto-style2" >
                    Dirección</td>
                <td class="auto-style3">
                    <asp:TextBox ID="Direccion" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    </td>
            </tr>
        </table>
             
            <table >
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style102">
                        Aumentar mi crédito</td>
                </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Introduzca aquí la cantidad en euros</td>
                <td class="style30">
                    <asp:TextBox ID="cantidadEuros" runat="server" Width="60px" ToolTip="Introduzca la cantidad en euros a aumentar el crédito" 
                        SkinID="-1"></asp:TextBox>
                </td>
                <td class="style23">
                    <asp:Button ID="Aumentar" runat="server" Text="Aumentar crédito" />
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
             <br />
        <table >
            <tr>
                <td class="style32">
                    &nbsp;</td>
                <td class="style102">
                    Alquilar película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Seleccione de la lista la película a alquilar</td>
                <td class="style31">
                    <asp:DropDownList ID="peliculaAAlquilar" runat="server" DataSourceID="AccessDataSource1" DataTextField="Titulo" DataValueField="Titulo">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\TEMP\VIDEOCLUB_GABINA.mdb" SelectCommand="select Titulo from PELICULA where Estado=&quot;Disponible&quot;"></asp:AccessDataSource>
                </td>
                <td class="style23">
                    <asp:Button ID="Alquilar" runat="server" Text="Alquilar" />
                    </td>
            </tr>
            </table>
                      <br />
        <table >
            <tr>
                <td class="style32">
                    &nbsp;</td>
                <td class="style102">
                    Devolver película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Seleccione de la lista la película a devolver</td>
                <td class="style31">
                    <asp:DropDownList ID="peliculaADevolver" runat="server" DataSourceID="AccessDataSource2" DataTextField="Titulo" DataValueField="Titulo">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="C:\TEMP\VIDEOCLUB_GABINA.mdb" SelectCommand="SELECT Pelicula.Titulo FROM ALQUILER INNER JOIN PELICULA ON ALQUILER.peliID=PELICULA.codigoPelicula where ALQUILER.userLogin=? and PELICULA.estado=&quot;Alquilada&quot; and ALQUILER.fechaDevolucion IS NULL;">
                        <SelectParameters>
                            <asp:SessionParameter Name="?" SessionField="usuarioLogin" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style23">
                    <asp:Button ID="Devolver" runat="server" Text="Devolver" />
                    </td>
            </tr>
            </table>
    <table>
    <asp:Button ID="VolverPrincipal" runat="server" Text="Volver a la Página Principal" />
    </table>
    </div>
</asp:Content>
