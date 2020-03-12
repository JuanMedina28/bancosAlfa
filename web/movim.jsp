<%-- 
    Document   : movim
    Created on : 04-mar-2020, 23:11:09
    Author     : Juan J. Medina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>  
<%@include file='conexion.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movimientos</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
    </head>
    <body align="center">
        <section class="contenedor">
            
            <header>
                <div class="i"><h5>Pay</h5><h5 style="color: #00BFFF; padding-left: 5px;"> Alpha</h5></div><hr class="lun"><div class="lsm"><h6>Bank Andmin</h6></div>
                <div id="menu">
                            <a href="imenu.jsp"><article id="ini"><p id="tm">HOME</p></article></a>
                            <a href="movim.jsp"><article id="mov"><p id="tm">MOVIMIENTOS</p></article></a>
                            <a href="rbanco.jsp"><article id="ban"><p id="tm">BANCOS</p></article></a>
                            <a href="trans.jsp"><article id="trans"><p id="tm">TRANSFERENCIA</p></article></a>
                            <a href="consultaMes.jsp"><article id="cam"><p id="tm">C-AÑO/MES</p></article></a>
                            <a href="consbancoss.jsp"><article id="cb"><p id="tm">C-BANCO</p></article></a>
                            <a href="capital.jsp"><article id="cap"><p id="tm">CAPITAL</p></article></a>
                </div>
            </header>
            
             <section class="co2">
            <h1>Registro de Movimientos</h1>
             </section>
        
        <section class="cd3">
                <%
        String t_mov=request.getParameter("t_mov");
        String no_tarjeta=request.getParameter("no_tarjeta");
        String monto=request.getParameter("monto");
        String fecha_mov=request.getParameter("fecha_mov");
        String descripcion=request.getParameter("descripcion");
       // String capital=request.getParameter("capital");
        try{
        if(no_tarjeta!=null)
        {
            String qry="insert into movimientos(t_mov,no_tarjeta,monto,descripcion,fecha_mov) values('"+t_mov+"',"+no_tarjeta+","+monto+",'"+descripcion+"','"+fecha_mov+"');";
            sql.executeUpdate(qry);
            //out.println(t_mov+no_tarjeta+monto+descripcion+fecha_mov);
        }   
        }catch(Exception e){
        out.print("Error de movimiento, favor de verificar sus datos");
        }
  
                        
        %>
        
        
        
        <form method="post" action="movim.jsp"><br><br><center>
            <table>
                <tr>
                    <td class="tii">Tipo</h3></td>
                    <td style="padding-left: 10px;"><select name="t_mov" style="height: 20px; padding-left: 5px">
                        <option >...</option>
                        <option value="Ingreso">Ingreso</option>
                        <option value="Egreso">Egreso</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="tii">Numero de Tarjeta</td>
                    <td style="padding-left: 10px;"><input type="text" name="no_tarjeta" style="height: 20px; padding-left: 5px" ></td>
                    
                </tr>
                <tr>
                    <td class="tii">Monto</td>
                    <td style="padding-left: 10px;"><input type="text" name="monto" style="height: 20px; padding-left: 5px" ></td>
                    
                </tr>
                
             
                   <tr>
                       <td class="tii">Fecha</td>
                       <td style="padding-left: 10px;"><input type="date" name="fecha_mov" style="height: 20px; padding-left: 5px" ></td>
                </tr>
                <tr>
                    <td class="tii">Descripción</td>
                    <td style="padding-left: 10px;"><textarea name="descripcion" cols="30" rows="5" placeholder="Descripcion" required=""></textarea></td>
                </tr>
               <tr>
                    
                   <td><br><br><input type="submit" name="enviar" value="Guardar" style=" background: #455074; 
                              color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;"  align="center"></td>
                   <td></td>
                    
                </tr>
            </table></center>
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
