<%-- 
    Document   : coneccion
    Created on : 13 feb. 2020, 16:53:34
    Author     : Tecamac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.Statement"
        import="java.sql.SQLException"
        %>
<%
Connection conex=null;
Statement sql=null;
try{
    Class.forName("org.postgresql.Driver");
    conex=(Connection)DriverManager.getConnection("jdbc:postgresql://localhost:5432/banc","postgres","bd");
    sql=conex.createStatement();
    //out.print("Base de datos encendida");
    }catch(Exception e){
     out.print("Error de conexion ");
    }

%>
