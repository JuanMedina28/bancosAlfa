<%-- 
    Document   : registrar
    Created on : 24 feb. 2020, 12:07:12
    Author     : Tecamac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <title>Registrar PayAlpha</title>
    </head>
    <body>
             
      
        <section class="contenedor">
            
            <header>
                <div class="i"><h5>Pay</h5><h5 style="color: #00BFFF; padding-left: 5px;"> Alpha</h5></div><hr class="lun"><div class="lsm"><h6>Bank Andmin</h6></div>
                <div id="menu">
                     
                </div>
            </header>
            
             <section class="co2">
            <h1>Registro PayAlpha</h1>
             </section>
        
            
            <section class="ind3"> 
                
               
        <%
            String correo=request.getParameter("mail");
            String clave=request.getParameter("txtclv");
            String nombre=request.getParameter("txtnom");
            if(nombre!=null && clave!=null && correo!=null){
            String qry = "INSERT INTO usuario(nom_us,correo,contra) values('"+nombre+"','"+correo+"','"+clave+"')";
            sql.executeUpdate(qry);
            }
            %>
            <script type="text/javascript">
            function validateMail(idMail)
            {
                object=document.getElementById(idMail);
                valueForm=object.value;
                
                var patron=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
                if(valueForm.search(patron)==0){
                    object.style.color="#000";
                    return;
                }
                    object.style.color="#f00";
            }

            </script>
            
            <div style="width: 45%; display: inline-block;align-content: center; margin-top: 1%">
                <center><img src="imag/registro.jpeg" width="400px"></center>
            </div>
            
            <div style="width: 50%; height: 300px;display: inline-block; ">
            <form method="post" action="regisu.jsp">
               <table border="1" width="40%" style="position: relative;  margin-top: 6%; margin-left: 18%">
                <tr>
                       <td class="tii">Nombre</td>
                   
                       <td><input type="text" id="nom" name="txtnom" class="" placeholder="Anel Medina" onKeyUp="javascript:validateMail('id_mail')" style="height: 20px; padding-left: 5px" required="Campo Obligatorio"><br><br></td>
                </tr>
                
                
                <tr>    
                    <td class="tii">Correo</label></td>
                    <td><input type="text" id="id_mail" name="mail" class="" placeholder="ramses@alfaweb.com" onKeyUp="javascript:validateMail('id_mail')" style="height: 20px; padding-left: 5px" required="Campo Obligatorio"><br><br></td>
                </tr>
                <tr>    
                    <td class="tii">Clave</label></td>
                    <td><input type="password" name="txtclv" placeholder="********" style="height: 20px; padding-left: 5px" required="Campo Obligatorio"><br><br></td>
                </tr>
                
                <tr>
                    <td><input type="submit" name="guardar" value="Registrar" style=" background: #455074; 
                                color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;"></td>
                    
                    <td> <input type="button" value="Iniciar Sesion" onclick="window.location='index.jsp'" style=" background: #455074; 
                                color: white; font-size: 14px; font-weight: 600; height: 20px; width: 100px;"></td>
                </tr>
               </table>
            </form>
            </div>      
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