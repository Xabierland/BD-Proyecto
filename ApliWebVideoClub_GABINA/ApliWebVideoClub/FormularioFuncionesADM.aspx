<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormularioFuncionesADM.aspx.vb" Inherits="ApliWebVideoClub.FormularioFuncionesADM" %>
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
            
            color:Black;
            font-size:medium;
              height: 2306px;
          }
          .style102
          {
              text-decoration: underline;
              font-weight: bold;
              font-size: large;
          }
          .style103
          {
              width: 320px;
              color: #FF0000;
          }
          .style104
          {
              width: 309px;
              color: #FF0000;
          }
           .auto-style1 {
               width: 202px;
               height: 32px;
           }
           .auto-style2 {
               width: 10px;
               height: 32px;
           }
           .auto-style4 {
               width: 158px;
               color: #FF0000;
               height: 32px;
           }
           .auto-style5 {
               width: 73px;
               height: 32px;
           }
    </style>
 </asp:Content>
   

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="header"><h1 class="style37">Funciones ADMINISTRADOR</h1></div>
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
                        Cambiar estado de un socio</td>
                </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style27" >
                    UsuarioLogin del socio a 
                    cambiar de estado</td>
                <td class="style28">
                    <asp:DropDownList ID="nombreLogin" runat="server" DataSourceID="AccessDataSource1" DataTextField="usuarioLogin" DataValueField="usuarioLogin">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\TEMP\VIDEOCLUB_GABINA.mdb" SelectCommand="SELECT usuarioLogin from SOCIO where usuarioLogin not like &quot;administrador&quot;"></asp:AccessDataSource>
                </td>
                <td>
                    <asp:Button ID="cambiarEstadoSocio" runat="server" Text="Cambiar estado" />
                </td>
            </tr>
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style103" >
                    <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="usuarioLogin" DataSourceID="AccessDataSource3" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <ItemTemplate>
                            usuarioLogin:
                            <asp:Label ID="usuarioLoginLabel" runat="server" Text='<%# Eval("usuarioLogin") %>' />
                            <br />
                            nombre_apellido:
                            <asp:Label ID="nombre_apellidoLabel" runat="server" Text='<%# Eval("nombre_apellido") %>' />
                            <br />
                            Direccion:
                            <asp:Label ID="DireccionLabel" runat="server" Text='<%# Eval("Direccion") %>' />
                            <br />
                            Credito:
                            <asp:Label ID="CreditoLabel" runat="server" Text='<%# Eval("Credito") %>' />
                            <br />
                            Fecha_Hora_Alta:
                            <asp:Label ID="Fecha_Hora_AltaLabel" runat="server" Text='<%# Eval("Fecha_Hora_Alta") %>' />
                            <br />
                            Estado:
                            <asp:Label ID="EstadoLabel" runat="server" Text='<%# Eval("Estado") %>' />
                            <br />
                            <br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
                    <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="C:\TEMP\VIDEOCLUB_GABINA.mdb" SelectCommand="select * from SOCIO where usuarioLogin=?
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="nombreLogin" Name="?" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style28">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="mostrarDatosSocio" runat="server" Text="Mostrar datos socio" />
                </td>
            </tr>
        </table>
             
               <br />
        <table >
            <tr>
                <td class="style32">
                    &nbsp;</td>
                <td class="style102">
                    Dar de alta una película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Código de la película a dar de alta</td>
                <td class="style31">
                    <asp:TextBox ID="codPeliculaAlta" runat="server"  
                        ToolTip="Introduzca el código de la película a dar de alta" SkinID="-1"></asp:TextBox>
                </td>
                <td class="style23">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    </td>
                <td class="auto-style2">
                    </td>
                <td class="style24">
                    <asp:Label ID="Label1" runat="server" Text="Estado de la pelicula"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="estadoPeliculaAlta" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="style24">
                    Titulo</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TituloPeliculaAlta" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="style24">
                    Precio</td>
                <td class="auto-style4">
                    <asp:TextBox ID="precioPeliculaAlta" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="style24">
                    fechaPublicacion</td>
                <td class="auto-style4">
                    <asp:TextBox ID="fechaPublicacion" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="DarDeAltaPeli" runat="server" Text="Dar de alta película" />
                    </td>
            </tr>
            </table>
                      <br />
        <table >
            <tr>
                <td class="style32">
                    &nbsp;</td>
                <td class="style102">
                    Dar de baja una película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Código de la película a dar de baja</td>
                <td class="style31">
                    <asp:DropDownList ID="codPeliculaBaja" runat="server" DataSourceID="AccessDataSource2" DataTextField="codigoPelicula" DataValueField="codigoPelicula">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="C:\TEMP\VIDEOCLUB_GABINA.mdb" SelectCommand="select codigoPelicula from PELICULA"></asp:AccessDataSource>
                </td>
                <td class="style23">
                    <asp:Button ID="DarDeBajaPeli" runat="server" Text="Dar de baja esta película" />
                    </td>
            </tr>
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style104">
                    <asp:DataList ID="DataList2" runat="server" CellPadding="4" DataKeyField="codigoPelicula" DataSourceID="AccessDataSource4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <ItemTemplate>
                            codigoPelicula:
                            <asp:Label ID="codigoPeliculaLabel" runat="server" Text='<%# Eval("codigoPelicula") %>' />
                            <br />
                            Titulo:
                            <asp:Label ID="TituloLabel" runat="server" Text='<%# Eval("Titulo") %>' />
                            <br />
                            Precio:
                            <asp:Label ID="PrecioLabel" runat="server" Text='<%# Eval("Precio") %>' />
                            <br />
                            Estado:
                            <asp:Label ID="EstadoLabel" runat="server" Text='<%# Eval("Estado") %>' />
                            <br />
                            fechaPublicacion:
                            <asp:Label ID="fechaPublicacionLabel" runat="server" Text='<%# Eval("fechaPublicacion") %>' />
                            <br />
                            fechaAdquisicion:
                            <asp:Label ID="fechaAdquisicionLabel" runat="server" Text='<%# Eval("fechaAdquisicion") %>' />
                            <br />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
                    <asp:AccessDataSource ID="AccessDataSource4" runat="server" DataFile="C:\TEMP\VIDEOCLUB_GABINA.mdb" SelectCommand="select * from PELICULA where codigoPelicula=?
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="codPeliculaBaja" Name="?" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style31">
                    &nbsp;</td>
                <td class="style23">
                    <asp:Button ID="mostrarDatosPeli" runat="server" 
                        Text="Mostrar datos película" />
                </td>
            </tr>
            </table>
    <table>
    <asp:Button ID="VolverPrincipal" runat="server" Text="Volver a la Página Principal" />
    </table>
    </div>
</asp:Content>
