<%-- 
    Document   : imenu
    Created on : 05-mar-2020, 0:44:17
    Author     : Juan J. Medina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.Statement"
        import="java.sql.SQLException"
        %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PayAlpha</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
    </head>
    <body>
        <section class="contenedor">
            
            <header>
                <div class="i"><h5>Pay</h5><h5 style="color: #00BFFF; padding-left: 5px;"> Alpha</h5></div><hr class="lun"><div class="lsm"><h6>Bank Andmin</h6></div>
                <div id="menu">
                            <a href="imenu.jsp"><article id="ini"><p id="tm">HOME</p></article></a>
                            <a href="movim.jsp"><article id="mov"><p id="tm">MOVIMIENTOS</p></article></a>
                            <a href="rbanco.jsp"><article id="ban"><p id="tm">BANCOS</p></article></a>
                            <a href="trans.jsp"><article id="trans"><p id="tm">TRANSFERENCIA</p></article></a>
                            <a href="consultaMes.jsp"><article id="cam"><p id="tm">C-AÑO/MES</p></article></a>
                            <a href="consbancos.jsp"><article id="cb"><p id="tm">C-BANCO</p></article></a>
                            <a href="capital.jsp"><article id="cap"><p id="tm">CAPITAL</p></article></a>
                </div>
            </header>
            
             <section class="co2">
            <h1>Movimientos del Mes</h1>
             </section>
            
  <%--############################################################################################################### --%>     
            
            <div class="cd3">
           
                <br>
                <table border="1" width="100%">
          
            
            <tr bgcolor="#5482F3" >
                <td class="ti" >Movimiento</td>
                <td class="ti" >Numero de Tarjeta</td>
                <td class="ti"  >Cantidad</td>
                <td class="ti"  >Descripcion</td>
                <td class="ti"  >Fecha de Movimiento</td>
                <td class="ti"  >Banco</td>
            </tr>
            
   
            <%
               Connection cnx=null;
               Statement sta=null;
               ResultSet rs=null;
                try{
                Class.forName("org.postgresql.Driver");
                cnx=(Connection)DriverManager.getConnection("jdbc:postgresql://localhost:5432/banc","postgres","bd");
                sta=cnx.createStatement();
                rs=sta.executeQuery("select t_mov ,banco.no_tarjeta ,monto ,descripcion ,fecha_mov, nom_ban  from movimientos inner join banco on movimientos.no_tarjeta=banco.no_tarjeta where EXTRACT(MONTH FROM fecha_mov) = EXTRACT(MONTH FROM current_date);");
                while(rs.next()){
                %>
                    <tr>
                        <td class="tii" > <%=rs.getString(1)%> </td> <!--Imprime la primer columna-->
                        <td class="te" > <%=rs.getString(2)%> </td> <!--Imprime la segunda columna-->
                        <td class="tii" > <%=rs.getString(3)%> </td>
                        <td class="te" > <%=rs.getString(4)%> </td>
                        <td class="tii" > <%=rs.getString(5)%> </td>
                        <td class="te" > <%=rs.getString(6)%> </td>
                    </tr>
                <%

                }
                sta.close();
                rs.close();
                cnx.close();

                }catch(Exception e){ 

                    out.println("Error de conexion"+e);

                }
             %>
        </table>
        
        <br>
        <center><img src="imag/imen.jpg" width="900"></center>
        <br>
        
        <br>

            </div><br><br>
      
  <%--############################################################################################################### --%> 

  <div style="height: 100px; width: 100%; background: red;"></div>
  
    <footer>
         <center>
             <div class="c21"> &#174; Roket Company. Ser reserva los derechos de esta pagina.</div><br><br>
             <div class="c21">&#169; Desarrollo Multiplataforma - 3TSM1 - Medina, Lopez, Garcia, Espinoza & Salas</div>
         </center> 
    </footer>
  
        </section>
    </body>
</html>
