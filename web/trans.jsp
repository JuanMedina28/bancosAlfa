<%-- 
    Document   : trans
    Created on : 05-mar-2020, 10:24:20
    Author     : Juan J. Medina
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.Statement"
        import="java.sql.SQLException"
        %>
<!DOCTYPE html>
<%
    Connection conex = null;
    Statement sql = null;
    try {
        Class.forName("org.postgresql.Driver");
        conex = (Connection) DriverManager.getConnection("jdbc:postgresql://localhost:5432/banc", "postgres", "bd");
        sql = conex.createStatement();
    } catch (Exception e) {
        out.print("Error de conexion ");
    }
    String guardar = request.getParameter("trans");
    if ("Transferir".equals(guardar)) {
        try {
            String sqlinsert = "INSERT INTO movimientos(id_mov, t_mov, no_tarjeta, monto, descripcion, fecha_mov) "
                    + "VALUES (DEFAULT,'Ingreso','" + request.getParameter("notarjetaenvio") + "',"
                    + " " + request.getParameter("monto") + ", '" + request.getParameter("descrip") + "', date(now()));";

            sqlinsert += "UPDATE banco SET capital=(select sum(capital+" + request.getParameter("monto") + ") from banco where no_tarjeta='" + request.getParameter("notarjetaenvio") + "') "
                    + "WHERE no_tarjeta='" + request.getParameter("notarjetaenvio") + "';";

            sqlinsert += "INSERT INTO movimientos(id_mov, t_mov, no_tarjeta, monto, descripcion, fecha_mov) "
                    + "VALUES (DEFAULT,'Transferencia','" + request.getParameter("notarjetaduena") + "',"
                    + " " + request.getParameter("monto") + ", '" + request.getParameter("descrip") + "', date(now()));";

            sqlinsert += "UPDATE banco "
                    + "SET capital=(select capital-" + request.getParameter("monto") + "  from banco where no_tarjeta='" + request.getParameter("notarjetaduena") + "')"
                    + "WHERE no_tarjeta='" + request.getParameter("notarjetaduena") + "';";

            PreparedStatement ps = conex.prepareStatement(sqlinsert);

        } catch (Exception e) {
            System.out.println("eror: " + e.toString());
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">

        <title>Transferencias</title>
    </head>
    <body>
        <section class="contenedor">

            <header>
                <div class="i"><h5>Pay</h5><h5 style="color: #00BFFF; padding-left: 5px;"> Alpha</h5></div><hr class="lun">
                <div class="lsm"><h6>Bank Andmin</h6></div>
                <div id="menu">
                    <a href="imenu.jsp"><article id="ini"><p id="tm">HOME</p></article></a>
                    <a href="movim.jsp"><article id="mov"><p id="tm">MOVIMIENTOS</p></article></a>
                    <a href="rbanco.jsp"><article id="ban"><p id="tm">BANCOS</p></article></a>
                    <a href="trans.jsp"><article id="trans"><p id="tm">TRANSFERENCIA</p></article></a>
                    <a href="consultaMes.jsp"><article id="cam"><p id="tm">C-AÑO/MES</p></article></a>
                    <a href="consultaxaño.jsp"><article id="cb"><p id="tm">C-BANCO</p></article></a>
                    <a href="capital.jsp"><article id="cap"><p id="tm">CAPITAL</p></article></a>

                </div>
            </header>

            <section class="co2">
                <h1>Registrar Banco</h1>
            </section>

            <%--############################################################################################################### --%>     

            <section class="cd3"><br>

                <form method="POST" action="trans.jsp">
                    <label>Ingresa tu No. de Tarjeta:</label>
                    <br>
                    <br>
                    <input type="number" minlength="5" name="notarjetaduena" required=""/>
                    <br>
                    <br>

                    <label>Ingresa el No. de Tarjeta a la que quieres transferir:</label>
                    <br>
                    <br>
                    <input type="number" minlength="5" name="notarjetaenvio" required=""/>
                    <br>
                    <br>
                    <label>Banco</label>
                    <br>
                    <br>
                    <select name="banco" required="">
                        <%                String sqlbanco = "SELECT distinct nom_ban FROM banco;";
                            PreparedStatement ps = conex.prepareStatement(sqlbanco);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                out.print("<option value='" + rs.getString("nom_ban") + "'>" + rs.getString("nom_ban") + "</option>");
                            }
                        %>
                    </select><br><br>

                    <label>Descripcion:</label>
                    <br>
                    <br>
                    <input type="text" minlength="" name="descrip" required=""/>
                    <br>
                    <br>

                    <label>Monto a transferir:</label>
                    <br>
                    <br>
                    <input type="number" minlength="" name="monto" required=""/>
                    <br>
                    <br>

                    <input type="submit" value="Transferir" name="trans"/>
                </form>

            </section>

            <%--############################################################################################################### --%> 



            <footer>
                <center>
                    <div class="c21"> &#174; Roket Company. Ser reserva los derechos de esta pagina.</div><br><br>
                    <div class="c21">&#169; Desarrollo Multiplataforma - 3TSM1 - Medina, Lopez, Garcia, Espinoza & Salas</div><br><br>
                </center> 

            </footer>

        </section>                



    </body>
</html>