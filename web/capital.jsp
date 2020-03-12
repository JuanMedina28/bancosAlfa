<%-- 
    Document   : capital
    Created on : 05-mar-2020, 10:25:06
    Author     : Juan J. Medina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='conexion.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Capital</title>
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
            <h1>Capital Por Tarjeta</h1>
             </section>
            
  <%--############################################################################################################### --%>     

         <section class="cd3">
      
        
        <br>
        <form>
        <fieldset>
        <label>Numero de Tarjeta</label>
        <br>
        <input type="text" name="tarjeta" placeholder="000000000000" required="" >
        <br>
        <input type="submit" name="enviar" value="Consultar" style=" background: #455074; 
                                color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;">
        <br><br>
        </fieldset>
        </form>
        <div>
            <table width="980" border="0" class="table table-hover"> 
                <tr bgcolor="#5482F3">
                   <td class="tii">Capital existente</td>
                    
                </tr>
                 <% 
                     String tarjeta=request.getParameter("tarjeta");
             
           
        if(tarjeta!=null){
        String con="select sum(monto) from movimientos inner join banco on movimientos.no_tarjeta=banco.no_tarjeta where movimientos.no_tarjeta='"+tarjeta+"'";
        ResultSet data=sql.executeQuery(con);
        while (data.next()){%>
                <tr bgcolor="#5482F3">
                    <td class="tii"><% out.print(data.getString(1));%></td>
                 </tr>
                
                <% }}%>
                
                
            </table>
        </div> 
                 <br>
        <center><img src="imag/imen.jpg" width="900"></center>
        <br><br>

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
