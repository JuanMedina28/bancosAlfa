<%-- 
    Document   : consultaMes
    Created on : 1 mar. 2020, 14:44:17
    Author     : Ramses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='conexion.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <title>Consultas Por Mes</title>
        
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
            <h1>Consultas Por Mes</h1>
             </section>
            
  <%--############################################################################################################### --%>     
            
            <section class="cd3">
        
        <form>
        <fieldset>
            <h2>Año</h2><br>
            <input type="text" name="año" required><br>
            <h2>Seleccione el mes</h2><br>
         <select name="mes" style="height: 20px; padding-left: 5px">
                <option>Mes</option>
                <option>Enero</option>
                <option>Febrero</option>
                <option>Marzo</option>
                <option>Abril</option>
                <option>Mayo</option>
                <option>Junio</option>
                <option>Julio</option>
                <option>Agosto</option>
                <option>Septiempbre</option>
                <option>Octubre</option>
                <option>Noviembre</option>
                <option>Diciembre</option>
            </select>
        <br>
        <br>
        <input type="submit" name="Consultar" value="Ver" style=" background: #455074; 
                  color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;">
        </fieldset>
        </form>
        <br><br>
       
            <table border="1" width="100%"> 
                <tr  bgcolor="#5482F3">
                    <td class="ti">Tipo de movimiento</td>
                    <td class="ti">Nombre del banco</td>
                    <td class="ti">Monto</td>
                    <td class="ti">Descripcion</td>
                    <td class="ti">Fecha</td>
                   
                </tr>
                 <% String mes=request.getParameter("mes");
                 String año=request.getParameter("año");
             
           
        if(año!=null){
           
        String con="select t_mov,nom_ban,monto,descripcion,fecha_mov from movimientos where to_char(fecha_mov, 'TMMonth')='"+mes+"' and extract(year from fecha_mov)="+año+""; 
        ResultSet data=sql.executeQuery(con);
                     while (data.next()){%>
                <tr>
                    <td class="tii"><% out.print(data.getString(1));%></td>
                    <td class="te" ><% out.print(data.getString(2));%></td>
                    <td class="tii" ><% out.print(data.getString(3));%></td>
                    <td class="te" ><% out.print(data.getString(4));%></td>
                    <td class="tii"><% out.print(data.getString(5));%></td>
                    
                </tr>
                <% }}%>
                
                
            </table>
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