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
        <div class="wrapper fadeInDown">
                <div id="formContent">
                    <!-- Tabs Titles -->

                    <!-- Icon -->
                    <div class="fadeIn first">
                       <i class="fas fa-newspaper"></i>
                    </div>

                    <!-- Login Form -->
                    <form action="DodavanjePost" method="POST">
                        <input type="text" id="title" class="fadeIn second" name="title" placeholder="Title" autocomplete="off">
                        <input type="text" id="summary" class="fadeIn third" name="summary" placeholder="Summary" autocomplete="off">
                        <textarea name="postcontent" cols="50" rows="10" class="fadeIn fourth"placeholder="Content" autocomplete="off"></textarea>
                        <input type="url" id="imageurl" class="fadeIn fifth" name="imageurl" placeholder="Image URL"autocomplete="off">
                        <input type="submit" class="fadeIn sixth" value="Add">
                    </form>
                       

                    <div id="formFooter">
                        <a class="underlineHover" href="listaPostova.jsp">Back</a>
                    </div>

                </div>
            </div>
    </body>
</html>




