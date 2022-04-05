Public Class FormularioFuncionesADM
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a min�sculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
 

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Asegurarse de que ha iniciado sesi�n como administrador
        If usuario = "" Then
             MsgBox("Debes Iniciar Sesi�n como administrador para poder operar aqui")
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

End Class