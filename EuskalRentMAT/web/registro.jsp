<%-- 
    Document   : registro.jsp
    Created on : 27-dic-2015, 21:20:01
    Author     : joseba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Entidades.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- METADATOS -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EuskalRent</title>
        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/datepicker.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <link href="css/css-Joseba.css"  rel="stylesheet">
    </head>
    <body>
       <!-- Navegador -->
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container-fluid">
                <div class="navbar-header">
                   <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                   </button>
                    <a id="logo" class="navbar-left" href="index.jsp"><img id="imgLogo" src="img/logo.png"></a>
                </div>
                   <!-- Navegador superior -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">               
                    <ul class="nav navbar-nav navbar-right">                
                        <li id="menuCambiable" class="dropdown">
                            <% String text;
                            // Si entra aqui quiere decir que el usuario no esta loged
                                if (request.getSession().getAttribute("usuario") == null){
                                    text = "ACCEDE";
                                    %>
                                    <ul  id="borrableLogearse" class="dropdown-menu" style="padding: 15px;min-width: 250px;">
                                        <li>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <% 
                                                     Boolean failLoged =(Boolean)request.getSession().getAttribute("failLogin");
                                                     if (failLoged != null){
                                                        if(failLoged == true){%>                                                     
                                                            <p style="color: red">Los datos introducidos son invalidos</p>
                                                     <%    
                                                        }
                                                     }
                                                     %>
                                                    <form action="logear" method="post" role="form" id="login-nav">
                                                        <div class="form-group">
                                                            <label class="sr-only" for="email" >E-mail</label>
                                                            <input name="email" id="loginEmail" class="form-control formLogin" type="email" placeholder="Correo electronico" required>
                                                            <span class="span-registro" id="avisoEmailLogin"></span>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="sr-only" for="contraseña" >Contraseña</label>
                                                            <input name="pass" id="loginPass" class="form-control formLogin" type="password" placeholder="Contraeña" required>
                                                            <span class="span-registro" id="avisoPassLogin"></span>
                                                        </div>
                                                        <div class="form-group">
                                                            <button id="accede" type="submit" class="btn btn-success btn-block">ACCEDE</button>
                                                            <span class="span-registro" id="noExiste"></span>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a class="btn btn-primary btn-block" href="registro.jsp">REGISTRO</a>
                                        </li>
                                    </ul>
                                    <a id="nombreUser" href="#" class="botones dropdown-toggle" data-toggle="dropdown"><%=text%><b class="caret"></b></a>
                                    <%
                                } else {
                                    // si entra aqui el usuario esta loged.
                                    Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");                                    
                                    text = usuario.getNombreCompleto();
                                    String fotoPerfil = usuario.getFotoPerfil();
                                    if(fotoPerfil.equalsIgnoreCase("null"))
                                    {
                                        fotoPerfil = "sinFoto.jpg";
                                    }
                                    %>
                                    
                                    <ul id="borrableUsuario" class="dropdown-menu" style="padding: 15px;min-width: 250px;">
                                        <li><a href="index.jsp">Inicio</a></li>
                                        <li><a href="perfil.jsp">Tu perfil</a></li>
                                        <li><a href="#">Tu saldo: <%=usuario.getSaldo() %>€</a></li>
                                        <li><a id="logout" href="<%=request.getContextPath()%>/logout" >Logout</a></li>
                                    </ul>
                                     <a id="nombreUser" href="#" class="botones dropdown-toggle" data-toggle="dropdown"><img class=" img-perfil img-circle" src="img/perfil/<%=fotoPerfil%>"><%=text%><b class="caret"></b></a>
                               <% }%>
                               

                        </li>
                    </ul>
               </div>
            </div>
        </nav><!-- /navbar -->        
           <div class="jumbotron">
               <div class="prueba">
               <div  id="contenedorJumbotron" class="container-fluid">  
                   <!-- formulario de registro-->
                   <br>
                    <h3 id="formRegistro" class="center-block">¡Regístrate!</h3>  
                    <div id="inputRegistro" class="center-block">
                        <form action="insertUser" method="post" role="form" name="registro">
                            <div class="form-group">
                                <label for="nombre">*Nombre completo:</label>
                                <input type="text" name="nombre-registro" pattern="[A-Za-z ,.'-]{3,}" maxlength="20" id="nombre" class="form-control formularioRegistro" required >
                                <span class="span-registro" id="span-nombre"> </span>
                            </div>
                            <div class="form-group">
                                <label for="tel">*Teléfono:</label>
                                <input type="tel" name="tel-registro" pattern="[9|6|7][0-9]{8}"  id="tel" class="form-control formularioRegistro" required>
                                <span class="span-registro" id="span-tel"> </span>
                            </div>
                            <div class="form-group">
                                <label for="email">*Email:</label>
                                <input type="email" name="email-registro" class="form-control formularioRegistro" id="email" required>
                                <span class="span-registro" id="span-email"> </span>
                            </div>
                            <div class="form-group">
                                <label for="pwd">*Contraseña:</label>
                                <input type="password" name="pwd-registro" id="pwd" class="form-control formularioRegistro"  required>
                                <span class="span-registro"> </span>
                            </div>
                             <div class="form-group">
                                <label for="pwd2">*Comprobar contraseña:</label>
                                <input type="password" id="pwd2" class="form-control formularioRegistro" required>
                                <span class="span-registro" id="span-pwd2"> </span>
                             </div>
                            <button type="submit" id="formulario-registro" class="btn btn-default">Registrar</button>
                        </form>   
                    </div>
                    <p class="requerido"> Los campos con * son obligatorios.</p>
                    <!-- /formulario de registro-->
               </div>
           </div>
            </div>  

        <footer class="footer">
            <div class="container">
                <p class="text-muted textoFooter center-block">EuskalRent - Joseba Alonso, Diego Tobarra y Asier Martinez</p>
            </div>
        </footer>
        <!-- JS -->
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/datepicker.min.js"></script>
        <script src="js/main.js" type="text/javascript"></script> 
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>