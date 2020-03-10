<%-- 
    Document   : consultaxaño
    Created on : 1 mar. 2020, 13:25:03
    Author     : Ramses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='conexion.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <title>Consultas Año</title>
        
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
                            <a href="consultaxaño.jsp"><article id="cb"><p id="tm">C-BANCO</p></article></a>
                            <a href="capital.jsp"><article id="cap"><p id="tm">CAPITAL</p></article></a>
                </div>
            </header>
            
             <section class="co2">
            <h1>Consultas Por Año</h1>
             </section>
            
  <%--############################################################################################################### --%>     
            
            <section class="cd3">
        <form>
        <fieldset>
        <h1>Ingrese el Año</h1> <input type="text" name="ano" placeholder="2020" maxlength="4" required="" style="height: 20px; padding-left: 5px" >
        <br>
        <br>
        <input type="submit" name="enviar" value="Ver" style=" background: #455074; 
               color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;"><br><br>
        </fieldset>
        </form>
        <div>
            <table border="1" width="100%"> 
                <tr  bgcolor="#5482F3">
                    <td class="ti">Tipo de movimiento</td>
                    <td class="ti">Nombre del banco</td>
                    <td class="ti">Monto</td>
                    <td class="ti">Descripcion</td>
                    <td class="ti">Fecha</td>
                    <td class="ti">No. Tarjeta</td>
                </tr>
                 <% String año=request.getParameter("ano");
             
           try{
        if(año!=null){
        String con="select t_mov,nom_ban,monto,descripcion,fecha_mov,movimientos.no_tarjeta, sum(monto) from movimientos inner join banco on movimientos.no_tarjeta=banco.no_tarjeta where extract (year from fecha_mov)='"+año+"'"; 
        ResultSet data=sql.executeQuery(con);
                     while (data.next()){%>
                <tr>
                    <td class="tii"><% out.print(data.getString(1));%></td>
                    <td class="te"><% out.print(data.getString(2));%></td>
                    <td class="tii"><% out.print(data.getString(3));%></td>
                    <td class="te"><% out.print(data.getString(4));%></td>
                    <td class="tii"><% out.print(data.getString(5));%></td>
                    <td class="te"><% out.print(data.getString(6));%></td>
                </tr>
                  <tr>
                    <td class="tii"><% out.print("la Sumta total es: "+data.getString(7));%></td>
                    
                </tr>
                <% }}}catch(Exception e){out.print("inserte un año valido");}%>
                
                
            </table>
        </div> 
                
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