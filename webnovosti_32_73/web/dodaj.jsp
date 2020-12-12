<%-- 
    Document   : dodaj
    Created on : Nov 12, 2020, 6:29:56 PM
    Author     : emir i amad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" flush="true" />
    <body>
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
                    <form action="Dodavanje" method="POST">
                        <input type="text" id="login" class="fadeIn second" name="username" placeholder="Username"  autocomplete="off">
                        <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password"  autocomplete="off">
                        <input type="text" id="email" class="fadeIn fourth" name="email" placeholder="Email"  autocomplete="off">
                        <input type="text" id="phonenumber" class="fadeIn fifth" name="telefon" placeholder="Phone Number"  autocomplete="off">
                        <input type="text" id="first_name" class="fadeIn sixth" name="ime" placeholder="First Name"  autocomplete="off">
                        <input type="text" id="last_name" class="fadeIn seventh" name="prezime" placeholder="Last Name" autocomplete="off">
                        <input type="submit" class="fadeIn eight" value="Register">
                    </form>


                    <div id="formFooter">
                        <a class="underlineHover" href="index.jsp">Login</a>
                    </div>

                </div>
            </div>

    </body>
</html>


