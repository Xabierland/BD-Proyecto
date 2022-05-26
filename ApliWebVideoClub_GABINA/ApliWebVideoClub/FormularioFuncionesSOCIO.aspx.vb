Imports System.Data.OleDb 'Para las conexiones tipo OleDb -- ACCESS
Public Class FormularioFuncionesSOCIO
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a min�sculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
    'Indicamos la cadena de conexion (tipo OLEDB)
    Dim cadenaConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\TEMP\VIDEOCLUB_ESTEBAN.mdb"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
      'Comprobamos que se haya iniciado sesi�n
        If usuario = "" Then
            MsgBox("Debes Iniciar Sesi�n para poder operar como Socio")
            Response.Redirect("default.aspx")
        End If
        If Page.IsPostBack = False Then 'Solamente se hace cuando vaya a esta p�gina
            'DECLARAR LAS VARIABLES NECESARIAS para las instrucciones de BD
            Dim conexion As OleDb.OleDbConnection
            Dim strSQL As String
            Dim dbComm As OleDbCommand
            'PASO 1. CREAR UNA CONEXION Y ABRIRLA
            conexion = New OleDb.OleDbConnection(cadenaConexion)
            conexion.Open()
            '*******************************************************************************************
            ' SE RECUPERA EL ESTADO DEL SOCIO QUE HA INICIADO LA SESI�N
            '*******************************************************************************************
            'PASOS 2 Y 3. PREPARAR LA INSTRUCCION SQL Y EJECUTARLA
            strSQL = "SELECT estado FROM SOCIO WHERE usuarioLogin=?"
            dbComm = New OleDbCommand(strSQL, conexion)
            dbComm.Parameters.Add(New OleDbParameter("usuario", OleDbType.VarChar)).Value = usuario
            Dim estado As String  'Para guardar el estado del socio en la aplicaci�n
            estado = dbComm.ExecuteScalar()    ' Ejecuta una SELECT en la que solo se obtiene un dato

            '*******************************************************************************************
            ' SI ES UN SOCIO ACTIVO (su estado es A), SE MUESTRAN SUS DATOS PERSONALES
            '*******************************************************************************************
            If estado <> "A" Then
                'Si su estado no es activo visualizar un mensaje
                MsgBox("Has sido dado de baja por el administrador del video club. No puedes operar.")
                Response.Redirect("default.aspx")
            Else
                'Recuperar los dem�s datos del socio desde la BD y mostrarlos -- EJEMPLO DE SELECT
                'PASO 2. Preparar la instrucci�n SQL a ejecutar
                strSQL = "SELECT nombre_apellido,direccion,credito FROM SOCIO WHERE usuarioLogin='" & usuario & "'"
                dbComm = New OleDbCommand(strSQL, conexion)
                'PASO 3. Ejecutarla
                Dim datosSocioReader As OleDbDataReader
                datosSocioReader = dbComm.ExecuteReader()  'Ejecuta una SELECT que obtiene varios datos
                'Tratar el resultado, es decir, los datos obtenidos por la select
                While datosSocioReader.Read() 'Si hay varias filas las va leyendo una por una
                    'Se asignan los datos recuperados a los distintos TextBox de la p�gina Web
                    Me.Nombre.Text = datosSocioReader(0) 'Primer dato de la fila
                    Me.Direccion.Text = datosSocioReader(1) 'Segundo dato de la fila
                End While
            End If
            'PASO 4. CERRAR LA CONEXI�N Y LIBERAR MEMORIA
            conexion.Close()
            conexion.Dispose()
        End If
    End Sub


    Protected Sub VolverPrincipal_Click(ByVal sender As Object, ByVal e As EventArgs) Handles VolverPrincipal.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub AccessDataSource2_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles AccessDataSource2.Selecting

    End Sub

    Protected Sub Aumentar_Click(sender As Object, e As EventArgs) Handles Aumentar.Click
        Try
            Dim conexion As OleDb.OleDbConnection
            conexion = New OleDb.OleDbConnection(cadenaConexion)
            conexion.Open()

            Dim strSQL As String
            Dim dbComm As OleDbCommand
            strSQL = "update socio set credito=credito+? where usuarioLogin=?"
            dbComm = New OleDbCommand(strSQL, conexion)

            dbComm.Parameters.Add("param1", OleDbType.Double)
            dbComm.Parameters.Add("param2", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = CDbl(cantidadEuros.Text)
            dbComm.Parameters("param2").Value = usuario

            'PASO 3. EJECUTAR LA INSTRUCCION SQL (hay 3 casos distintos, se elige el adecuado)
            dbComm.ExecuteNonQuery() 'Ejecuta cualquier instrucci�n que no sea SELECT
            'Sacamos un mensaje por pantalla (opcional)
            MsgBox("Se ha aumentado el cr�dito del socio")
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        'PASO 4. CERRAR LA CONEXI�N CON LA BASE DE DATOS Y LIBERAR MEMORIA
        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub Modificar_Click(sender As Object, e As EventArgs) Handles Modificar.Click
        Try
            Dim conexion As OleDb.OleDbConnection
            conexion = New OleDb.OleDbConnection(cadenaConexion)
            conexion.Open()

            Dim strSQL As String
            Dim dbComm As OleDbCommand
            strSQL = "update socio set nombre_apellido=?,direccion=? where usuarioLogin=?"
            dbComm = New OleDbCommand(strSQL, conexion)

            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters.Add("param2", OleDbType.VarChar)
            dbComm.Parameters.Add("param3", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = Nombre.Text
            dbComm.Parameters("param2").Value = Direccion.Text
            dbComm.Parameters("param3").Value = usuario
            dbComm.ExecuteNonQuery()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Alquilar_Click(sender As Object, e As EventArgs) Handles Alquilar.Click
        Dim conexion As OleDb.OleDbConnection
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        Dim transaccion As OleDbTransaction
        Dim strSQL As String
        Dim dbComm As OleDbCommand
        transaccion = conexion.BeginTransaction()
        Try
            strSQL = "select precio from pelicula where titulo=?"
            dbComm = New OleDbCommand(strSQL, conexion, transaccion)

            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = peliDevolver.Text

            Dim precio As Double
            precio = dbComm.ExecuteScalar()

            strSQL = "select credito from socio where usuarioLogin=?"
            dbComm = New OleDbCommand(strSQL, conexion, transaccion)

            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = usuario

            Dim credito As Double
            credito = dbComm.ExecuteScalar()

            strSQL = "select codigo from pelicula where titulo=?"
            dbComm = New OleDbCommand(strSQL, conexion, transaccion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = peliAlquilar.Text

            Dim codigo As Integer
            codigo = dbComm.ExecuteScalar()

            If precio <= credito Then
                strSQL = "insert into alquiler(fechaAlquiler,usuarioLogin,codigo) values (NOW(),?,?)"
                dbComm = New OleDbCommand(strSQL, conexion, transaccion)

                dbComm.Parameters.Add("param1", OleDbType.VarChar)
                dbComm.Parameters.Add("param2", OleDbType.Integer)
                dbComm.Parameters("param1").Value = usuario
                dbComm.Parameters("param2").Value = codigo
                dbComm.ExecuteNonQuery()

                strSQL = "update pelicula set estado='alquilada' where titulo=?"
                dbComm = New OleDbCommand(strSQL, conexion, transaccion)

                dbComm.Parameters.Add("param1", OleDbType.VarChar)
                dbComm.Parameters("param1").Value = peliAlquilar.Text
                dbComm.ExecuteNonQuery()


                strSQL = "update socio set credito=credito-? where usuarioLogin=?"
                dbComm = New OleDbCommand(strSQL, conexion, transaccion)

                dbComm.Parameters.Add("param1", OleDbType.Double)
                dbComm.Parameters.Add("param2", OleDbType.VarChar)
                dbComm.Parameters("param1").Value = precio
                dbComm.Parameters("param2").Value = usuario
                dbComm.ExecuteNonQuery()
            End If
            transaccion.Commit()
        Catch ex As Exception
            MsgBox(ex.Message)
            transaccion.Rollback()
        End Try
    End Sub

    Protected Sub Devolver_Click(sender As Object, e As EventArgs) Handles Devolver.Click
        Dim conexion As OleDb.OleDbConnection
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        Dim transaccion As OleDbTransaction
        Dim strSQL As String
        Dim dbComm As OleDbCommand
        transaccion = conexion.BeginTransaction()
        Try
            strSQL = "update pelicula set estado='disponible' where titulo=?"
            dbComm = New OleDbCommand(strSQL, conexion, transaccion)

            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = peliDevolver.Text
            dbComm.ExecuteNonQuery()

            strSQL = "select codigo from pelicula where titulo=?"
            dbComm = New OleDbCommand(strSQL, conexion, transaccion)

            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = peliDevolver.Text
            Dim codigo As Integer
            codigo = dbComm.ExecuteScalar()

            strSQL = "update alquiler set fechadevolucion=now() where usuariologin=? and codigo=?"
            dbComm = New OleDbCommand(strSQL, conexion, transaccion)

            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters.Add("param2", OleDbType.Integer)
            dbComm.Parameters("param1").Value = usuario
            dbComm.Parameters("param2").Value = codigo
            dbComm.ExecuteNonQuery()
            transaccion.Commit()
        Catch ex As Exception
            MsgBox(ex.Message)
            transaccion.Rollback()
        End Try
    End Sub
End Class