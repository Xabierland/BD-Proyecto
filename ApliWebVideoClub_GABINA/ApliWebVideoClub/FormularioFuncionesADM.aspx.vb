Imports System.Data.OleDb 'Para las conexiones tipo OleDb -- ACCESS
Public Class FormularioFuncionesADM
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a minúsculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
    'Indicamos la cadena de conexion (tipo OLEDB)
    Dim cadenaConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\TEMP\VIDEOCLUB_ESTEBAN.mdb"

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
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        Dim strSQL As String
        Dim dbComm As OleDbCommand
        Dim Estado As String
        strSQL = "select estado from socio where usuarioLogin=?"
        dbComm = New OleDbCommand(strSQL, conexion)

        dbComm.Parameters.Add("param1", OleDbType.VarChar)
        dbComm.Parameters("param1").Value = NombreLogin.Text
        Estado = dbComm.ExecuteScalar()
        If Estado = "A" Then
            Estado = "B"
        Else
            Estado = "A"
        End If

        strSQL = "update socio set estado=? where usuarioLogin=?"
        dbComm = New OleDbCommand(strSQL, conexion)

        dbComm.Parameters.Add("param1", OleDbType.VarChar)
        dbComm.Parameters.Add("param2", OleDbType.VarChar)
        dbComm.Parameters("param1").Value = Estado
        dbComm.Parameters("param2").Value = NombreLogin.Text
        Estado = dbComm.ExecuteScalar()
    End Sub

    Protected Sub mostrarDatosSocio_Click(sender As Object, e As EventArgs) Handles mostrarDatosSocio.Click
        Dim conexion As OleDb.OleDbConnection
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        Dim strSQL As String
        Dim dbComm As OleDbCommand
        strSQL = "select * from socio where usuarioLogin=?"
        dbComm = New OleDbCommand(strSQL, conexion)

        dbComm.Parameters.Add("param1", OleDbType.VarChar)
        dbComm.Parameters("param1").Value = NombreLogin.Text
    End Sub

    Protected Sub DarDeAltaPeli_Click(sender As Object, e As EventArgs) Handles DarDeAltaPeli.Click
        Dim conexion As OleDb.OleDbConnection
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        Dim strSQL As String
        Dim dbComm As OleDbCommand
        strSQL = "INSERT INTO PELICULA(codigo,titulo,precio,FechaAdquisicion) VALUES (?,?,?,NOW())"
        dbComm = New OleDbCommand(strSQL, conexion)

        dbComm.Parameters.Add("param1", OleDbType.BigInt)
        dbComm.Parameters.Add("param2", OleDbType.VarChar)
        dbComm.Parameters.Add("param3", OleDbType.Double)
        dbComm.Parameters("param1").Value = codPeliculaAlta.Text
        dbComm.Parameters("param2").Value = tituloPeliculaAlta.Text
        dbComm.Parameters("param3").Value = CDbl(precioPeliculaAlta.Text)
        dbComm.ExecuteNonQuery()
    End Sub

    Protected Sub DarDeBajaPeli_Click(sender As Object, e As EventArgs) Handles DarDeBajaPeli.Click
        Dim conexion As OleDb.OleDbConnection
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        Dim strSQL As String
        Dim dbComm As OleDbCommand
        Dim Estado As String
        strSQL = "select estado from pelicula where codigo=?"
        dbComm = New OleDbCommand(strSQL, conexion)

        dbComm.Parameters.Add("param1", OleDbType.BigInt)
        dbComm.Parameters("param1").Value = codPeliculaAlta.Text
        Estado = dbComm.ExecuteScalar()
        If Estado <> "ALQUILADA" Then
            strSQL = "delete from pelicula where codigo=?"
            dbComm = New OleDbCommand(strSQL, conexion)

            dbComm.Parameters.Add("param1", OleDbType.BigInt)
            dbComm.Parameters("param1").Value = codPeliculaAlta.Text
            dbComm.ExecuteNonQuery()
        Else
            strSQL = "update pelicula set estado='descatalogada' where codigo=?"
            dbComm = New OleDbCommand(strSQL, conexion)

            dbComm.Parameters.Add("param1", OleDbType.BigInt)
            dbComm.Parameters("param1").Value = codPeliculaAlta.Text
            dbComm.ExecuteNonQuery()
        End If
    End Sub
End Class