Imports System.Data.OleDb 'Para las conexiones tipo OleDb -- ACCESS
Public Class FormularioFuncionesSOCIO
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a minúsculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
    'Indicamos la cadena de conexion (tipo OLEDB)
    Dim cadenaConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\TEMP\VideoClub.accdb"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
      'Comprobamos que se haya iniciado sesión
        If usuario = "" Then
            MsgBox("Debes Iniciar Sesión para poder operar como Socio")
            Response.Redirect("default.aspx")
        End If
        If Page.IsPostBack = False Then 'Solamente se hace cuando vaya a esta página
            'DECLARAR LAS VARIABLES NECESARIAS para las instrucciones de BD
            Dim conexion As OleDb.OleDbConnection
            Dim strSQL As String
            Dim dbComm As OleDbCommand
            'PASO 1. CREAR UNA CONEXION Y ABRIRLA
            conexion = New OleDb.OleDbConnection(cadenaConexion)
            conexion.Open()
            '*******************************************************************************************
            ' SE RECUPERA EL ESTADO DEL SOCIO QUE HA INICIADO LA SESIÓN
            '*******************************************************************************************
            'PASOS 2 Y 3. PREPARAR LA INSTRUCCION SQL Y EJECUTARLA
            strSQL = "SELECT estado FROM SOCIO WHERE usuarioLogin=?"
            dbComm = New OleDbCommand(strSQL, conexion)
            dbComm.Parameters.Add(New OleDbParameter("usuario", OleDbType.VarChar)).Value = usuario
            Dim estado As String  'Para guardar el estado del socio en la aplicación
            estado = dbComm.ExecuteScalar()    ' Ejecuta una SELECT en la que solo se obtiene un dato

            '*******************************************************************************************
            ' SI ES UN SOCIO ACTIVO (su estado es A), SE MUESTRAN SUS DATOS PERSONALES
            '*******************************************************************************************
            If estado <> "A" Then
                'Si su estado no es activo visualizar un mensaje
                MsgBox("Has sido dado de baja por el administrador del video club. No puedes operar.")
                Response.Redirect("default.aspx")
            Else
                'Recuperar los demás datos del socio desde la BD y mostrarlos -- EJEMPLO DE SELECT
                'PASO 2. Preparar la instrucción SQL a ejecutar
                strSQL = "SELECT nombre_apellido,direccion,credito FROM SOCIO WHERE usuarioLogin='" & usuario & "'"
                dbComm = New OleDbCommand(strSQL, conexion)
                'PASO 3. Ejecutarla
                Dim datosSocioReader As OleDbDataReader
                datosSocioReader = dbComm.ExecuteReader()  'Ejecuta una SELECT que obtiene varios datos
                'Tratar el resultado, es decir, los datos obtenidos por la select
                While datosSocioReader.Read() 'Si hay varias filas las va leyendo una por una
                    'Se asignan los datos recuperados a los distintos TextBox de la página Web
                    Me.Nombre.Text = datosSocioReader(0) 'Primer dato de la fila
                    Me.Direccion.Text = datosSocioReader(1) 'Segundo dato de la fila
                End While
            End If
            'PASO 4. CERRAR LA CONEXIÓN Y LIBERAR MEMORIA
            conexion.Close()
            conexion.Dispose()
        End If
    End Sub


    Protected Sub VolverPrincipal_Click(ByVal sender As Object, ByVal e As EventArgs) Handles VolverPrincipal.Click
        Response.Redirect("default.aspx")
    End Sub


End Class