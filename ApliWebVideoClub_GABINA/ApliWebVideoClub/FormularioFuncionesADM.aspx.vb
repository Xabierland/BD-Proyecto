Imports System.Data.OleDb
Public Class FormularioFuncionesADM
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a minúsculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
    'Indicamos la cadena de conexion (tipo OLEDB)
    Dim cadenaConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\TEMP\VIDEOCLUB_GABINA.mdb"


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Asegurarse de que ha iniciado sesión como administrador
        If usuario = "" Then
            MsgBox("Debes Iniciar Sesión como administrador para poder operar aqui")
            Response.Redirect("default.aspx")
        Else
            If usuario <> "administrador" Then
                MsgBox("No eres el administrador. Solo puedes realizar las funciones del Socio")
                Response.Redirect("default.aspx")
            End If
        End If
    End Sub

    Protected Sub VolverPrincipal_Click(ByVal sender As Object, ByVal e As EventArgs) Handles VolverPrincipal.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub cambiarEstadoSocio_Click(sender As Object, e As EventArgs) Handles cambiarEstadoSocio.Click
        Dim conexion As OleDb.OleDbConnection
        Dim strSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        strSQL = "SELECT estado FROM SOCIO WHERE usuarioLogin='" & nombreLogin.Text & "'"
        dbComm = New OleDbCommand(strSQL, conexion)
        Dim estado As String
        estado = dbComm.ExecuteScalar()

        If estado <> "A" Then
            strSQL = "update socio set estado='A' where usuarioLogin='" & nombreLogin.Text & "'"
            dbComm = New OleDbCommand(strSQL, conexion)
            dbComm.ExecuteNonQuery()
        Else
            strSQL = "update socio set estado='B' where usuarioLogin='" & nombreLogin.Text & "'"
            dbComm = New OleDbCommand(strSQL, conexion)
            dbComm.ExecuteNonQuery()
        End If
        MsgBox("Se cambio es estado del socio correctamente")
        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub DarDeAltaPeli_Click(sender As Object, e As EventArgs) Handles DarDeAltaPeli.Click
        Dim conexion As OleDb.OleDbConnection
        Dim strSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        strSQL = "insert into PELICULA(codigoPelicula,Titulo,Precio,Estado,fechaPublicacion) values(?, ?, ?, ?, ?)"
        dbComm = New OleDbCommand(strSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.Integer)
        dbComm.Parameters.Add("param2", OleDbType.VarChar)
        dbComm.Parameters.Add("param3", OleDbType.Double)
        dbComm.Parameters.Add("param4", OleDbType.VarChar)
        dbComm.Parameters.Add("param5", OleDbType.Date)
        dbComm.Parameters("param1").Value = CInt(codPeliculaAlta.Text)
        dbComm.Parameters("param2").Value = TituloPeliculaAlta.Text
        dbComm.Parameters("param3").Value = CDbl(precioPeliculaAlta.Text)
        dbComm.Parameters("param4").Value = estadoPeliculaAlta.Text
        dbComm.Parameters("param5").Value = CDate(fechaPublicacion.Text)
        dbComm.ExecuteNonQuery()
        MsgBox("Se ha dado de alta la nueva pelicula")
        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub DarDeBajaPeli_Click(sender As Object, e As EventArgs) Handles DarDeBajaPeli.Click
        Dim conexion As OleDb.OleDbConnection
        Dim strSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        strSQL = "SELECT Estado FROM PELICULA WHERE codigoPelicula=" & codPeliculaBaja.Text
        dbComm = New OleDbCommand(strSQL, conexion)
        Dim estado As String
        estado = dbComm.ExecuteScalar()


        If estado <> "Alquilada" Then
            strSQL = "delete from pelicula where codigoPelicula=" & codPeliculaBaja.Text
            dbComm = New OleDbCommand(strSQL, conexion)
            dbComm.ExecuteNonQuery()
        Else
            strSQL = "update pelicula set estado='Descatalogada - SR' where codigoPelicula=" & codPeliculaBaja.Text
            dbComm = New OleDbCommand(strSQL, conexion)
            dbComm.ExecuteNonQuery()
        End If
        MsgBox("Se ha dado de baja la pelicula")
        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub mostrarDatosSocio_Click(sender As Object, e As EventArgs) Handles mostrarDatosSocio.Click
        DataList1.DataBind()
    End Sub

    Protected Sub mostrarDatosPeli_Click(sender As Object, e As EventArgs) Handles mostrarDatosPeli.Click
        DataList2.DataBind()
    End Sub
End Class