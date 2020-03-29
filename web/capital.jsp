<%-- 
    Document   : pru
    Created on : 12/03/2020, 01:06:20 AM
    Author     : Juan J. Medina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='conexion.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <title>Capital</title>
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
            <h1>Capital Por Banco</h1>
             </section>
            
  <%--############################################################################################################### --%>     
            
            <section class="cd3">

                <br><center>
        <table border="1" width="35%">
            <tr  bgcolor="#5482F3" >
                <td class="ti" >Nombre Banco</td>
                <td class="ti" >Monto:</td>
            </tr>
            <%
                String qi = "SELECT nom_ban,sum(monto) as monto FROM movimientos group by nom_ban;";
                    //PreparedStatement ps = conex.prepareStatement(sqlbanco);
                    ResultSet rs = sql.executeQuery(qi);
                    while (rs.next()) {%>
                    <tr> <td  class="tii" ><%out.print(rs.getString("nom_ban"));%>
                        
                        </td><td  class="te" ><% out.print(rs.getString("monto")); %></td> </tr>
                    <%}
                %>
                
                <tr>
                <th></th>
                <th></th>
            </tr>
                
                
                
                <tr> 
                
                <td  class="tii" >Total</td>
                  <%
                String qi2 = "select sum(monto) from movimientos;";
                    //PreparedStatement ps = conex.prepareStatement(sqlbanco);
                    ResultSet rs2 = sql.executeQuery(qi2);
                    while (rs2.next()) {%>
                    <td  class="te">  <%out.print(rs2.getString(1));%></td>
                   <% }
                %>
                </tr>
                
        </table></center>
        
            </section>              
<%--############################################################################################################### --%> 

    <footer>
         <center>
             <div class="c21"> &#174; Roket Company. Ser reserva los derechos de esta pagina.</div><br><br>
             <div class="c21">&#169; Desarrollo Multiplataforma - 3TSM1 - Medina, Lopez, Garcia, Espinoza & Salas</div>
         </center> 
    </footer>
                
            </section>  
                
                
    </body>
</html>
