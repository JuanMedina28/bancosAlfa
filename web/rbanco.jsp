<%-- 
    Document   : registrar
    Created on : 24 feb. 2020, 12:07:12
    Author     : AnelLC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='conexion.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <title>Registrar Banco </title>
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
        
        <%           
        String banco=request.getParameter("txtbank");
         String tarjeta=request.getParameter("tarjeta");
         String ccv=request.getParameter("ccv");
          
        try{
      if(banco!=null){
           String qry="insert into banco(no_tarjeta,nom_ban,ccv,id_us) values("+tarjeta+",'"+banco+"',"+ccv+",1)";
                   sql.executeUpdate(qry);
                   out.print("Registro éxitoso");
                   }
        }catch(Exception e){
        out.print("Error de Registro, porfavor verifique sus datos ");
        }                     
        %>
        
        <form method="post" action="rbanco.jsp"><center>
            
             <table border="1" width="40%" style="position: relative;  margin-top: 6%; margin-left: 5%">
                <tr>
                    <td class="tii">Nombre del Banco</td>
                    <td><input type="text" name="txtbank" style="height: 20px; padding-left: 5px" required></td>
                </tr>
            
            <tr>
                <td class="tii">Numero de Tarjeta</td>
                 <td> <input type="text" maxlength="16" name="tarjeta" style="height: 20px; padding-left: 5px" required></td>
                </tr>
            <tr>
                <td class="tii">CVV</td>
            <td><input type="text" name="ccv" maxlength="3" style="height: 20px; padding-left: 5px" required></td>
                </tr>
            <tr>
                <td><br><br><input type="submit" name="guardar" value="Guardar" style=" background: #455074; 
                                color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;"></td>
                <td></td>
                </tr>
             </table> </center>       
        </form>
        
        <br>
        <center><img src="imag/57929868157d5.jpeg" width="900"></center>
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