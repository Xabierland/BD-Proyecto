Public Class FormVerPELICULAS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Mostrar_Click(sender As Object, e As EventArgs) Handles Mostrar.Click
        Dim varNombre As String
        varNombre = Me.Nombre.Text
        Me.Mensaje.Text = "Hola " & varNombre & "!"
    End Sub
End Class