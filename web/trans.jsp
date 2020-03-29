<%-- 
    Document   : pru2
    Created on : 12/03/2020, 01:25:15 AM
    Author     : Juan J. Medina
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='conexion.jsp' %>
<!DOCTYPE html>
<%
 String banco=request.getParameter("banco");
 String monto=request.getParameter("monto");
 String otro=request.getParameter("bancorecep");
 String otrobanco=request.getParameter("otrobanco");
 try{
 if(monto != null){
     if("otro".equals(otro)){
                 String si="insert into movimientos(t_mov,monto,nom_ban) values('Egreso',"+monto+",'"+banco+"')";
                   sql.executeUpdate(si);  
                   out.print("Transferencia realizada con éxito");
     }else{
         String qry="insert into movimientos(t_mov,monto,nom_ban) values('Transferencia',"+monto+",'"+otro+"')";
                   sql.executeUpdate(qry);
          String hey="insert into movimientos(t_mov,monto,nom_ban) values('Egreso',"+monto+",'"+banco+"')";
                   sql.executeUpdate(hey);   
                    out.print("Transferencia realizada con éxito");
     }
                   
 }
 }catch(Exception e){ out.print("Error al realizar la transferencia, favo de verificar sus datos");}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transferencias</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <script type="text/javascript">
            function NombreBanco() {
                var elem = document.getElementById('bancorecep').value;
                if (elem === 'Otro') {
                    document.getElementById('labelbanco').style.display = 'block';
                    document.getElementById('nombrebanco').style.display = 'block';
                } else {
                    document.getElementById('labelbanco').style.display = 'none';
                    document.getElementById('nombrebanco').style.display = 'none';
                }
            }
        </script>
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
            </header>
            <section class="co2">
                <h1>Transferencias</h1>
            </section>


            <section class="cd3">
                <form method="POST" action="trans.jsp">
                    <br><br><center>
                        <table>
                            <tr>
                                <td class="tii">Tu Banco:</td>
                                <td style="padding-left: 10px;">
                                    <select name="banco" required="">
                                        <option >...</option>
                                        <%   String sqlbanco = "SELECT distinct nom_ban FROM banco;";
                   
                                            ResultSet rs = sql.executeQuery(sqlbanco);
                                            while (rs.next()) {
                                                out.print("<option value='" + rs.getString("nom_ban") + "'>" + rs.getString("nom_ban") + "</option>");
                                            }
                                        %>
                                    </select></td>
                            </tr>>

                            <tr>
                                <td class="tii">Monto a transferir:</td>
                                <td style="padding-left: 10px;"><input type="number" minlength="" name="monto" required=""/></td>
                            </tr>

                            <tr>
                                <td class="tii">Banco Receptor:</td>
                                <td style="padding-left: 10px;"><select id="bancorecep" name="bancorecep" required="" onchange="NombreBanco()">
                                        <%                String sqlbanco2 = "SELECT distinct nom_ban FROM banco;";
                   
                                            ResultSet rs2 = sql.executeQuery(sqlbanco2);
                                            while (rs2.next()) {
                                                out.print("<option value='" + rs2.getString("nom_ban") + "' selected='true'>" + rs2.getString("nom_ban") + "</option>");
                                            }
                                            out.println("<option value='Otro'>Otro</option>");
                                        %></td>
                            </tr>

                            <tr>
                                <td class="tii"><label id="labelbanco" style="display: none">Nombre del banco</td>
                                <td style="padding-left: 10px;"><input id="nombrebanco" type="text" name="otrobanco" style="display: none; width:100px "/><br>
                                </td></tr>

                            <tr>
                                <td class="tii">Descripcion:</td>
                                <td style="padding-left: 10px;"><textarea name="descrip" required=""></textarea></td>
                            </tr>
                            <tr>
                                <td class="tii"> </td>
                           <td style="padding-left: 10px;"> <input type="submit" value="Transferir" name="trans" style=" background: #455074; 
                                   color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;"></td>
                            </tr></table></center>
                            </form>
                            </section>
                            
                            
                            
                            <footer>
                                <center>
                                    <div class="c21"> &#174; Roket Company. Ser reserva los derechos de esta pagina.</div><br><br>
                                    <div class="c21">&#169; Desarrollo Multiplataforma - 3TSM1 - Medina, Lopez, Garcia, Espinoza & Salas</div>
                                </center> 
                            </footer>
                            </section> 
                            </body>
                            </html>