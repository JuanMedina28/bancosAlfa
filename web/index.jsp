<%-- 
    Document   : ind
    Created on : 27-feb-2020, 13:36:41
    Author     : Juan J. Medina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='conexion.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <title>Login PayAlpha</title>
    </head>
    <body>

        <section class="contenedor">
            
            <header>
                <div class="i"><h5>Pay</h5><h5 style="color: #00BFFF; padding-left: 5px;"> Alpha</h5></div><hr class="lun"><div class="lsm"><h6>Bank Andmin</h6></div>
                <div id="menu">
                     
                </div>
            </header>
            
             <section class="co2">
            <h1>Inicio de Sesion PayAlpha</h1>
             </section>
        
            
            <section class="cd3"> 
        <%
            
        String correo = request.getParameter("correo");
        String cont = request.getParameter("cont");
        
       if(correo!=null && cont!=null){
        String qry="select correo,contra from usuario where correo='"+correo+"' "+" and contra='"+cont+"'"; 
        ResultSet datas = sql.executeQuery(qry);
         if (datas.next())
         {
             
            String nevel = datas.getString(1);//convierte a entero 
            HttpSession sesion_act = request.getSession();
            sesion_act.setAttribute("Correo", correo);
            sesion_act.setAttribute("Nombre",datas.getString(1));
            response.sendRedirect("imenu.jsp");
             
            }else{
            out.print("Correo o contraseña incorrecta");
            out.print(datas.getString(1));
            out.print(datas.getString(2));
            }
         
          //}
           }

        %>
        <br>
        <form action="index.jsp" method="post">
            <fieldset>
                <center>
               <table border="1" width="40%" >
                   <tr>
                <td class="tii">Correo</td>
                <td><input type="text" name="correo" required="Ingrese Correo" placeholder="usuario@alfaweb.com" style="height: 20px; padding-left: 5px"></td>
            </tr>
            
            <tr>    
                <td class="tii">Contraseña</td>
                <td><input type="password" name="cont" required="Ingrese Contraseña" placeholder="************" style="height: 20px; padding-left: 5px"></td>
            </tr>
                
                <tr>
                    <td><br><input type="submit" name="enviar" value="Iniciar Sesion" style=" background: #455074; 
                               color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;"></td>
                    
                <td><br><input type="button" name="ingre" onclick="window.location='regisu.jsp'" value="Registrarse" style=" background: #455074; 
                               color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;"></td>
                </tr>
               </table>
                </center>
            </fieldset>
        </form>
        
        <br><br>
        <center><img src="imag/banki.jpg" width="900"></center>
        <br><br>
        
        
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
