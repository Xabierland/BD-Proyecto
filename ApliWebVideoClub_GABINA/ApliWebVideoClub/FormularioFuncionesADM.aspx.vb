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
        conexion.Close()
        conexion.Dispose()
    End Sub
End Class