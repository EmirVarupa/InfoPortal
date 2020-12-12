<%-- 
    Document   : index.jsp
    Created on : Nov 12, 2020, 6:25:16 PM
    Author     : Merisa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" flush="true" />
    <body style="overflow:hidden">
        <jsp:include page="header.jsp" flush="true" />
        <h3 class="fadeIn first" style="text-align: center">${poruka}</h3>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div class="fadeIn first">
                    <i id="icon" alt="Welcome" class="fas fa-user"></i>
                </div>

                <!-- Login Form -->
                <form action="Login" method="POST">
                    <input type="text" id="login" class="fadeIn second" name="username" placeholder="Username" >
                    <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password" >
                    <input type="submit" class="fadeIn fourth" value="Log In">
                </form>

                
                <div id="formFooter">
                    <a class="underlineHover" href="dodaj.jsp">Register</a>
                </div>

            </div>
        </div>
    </body>
</html>



