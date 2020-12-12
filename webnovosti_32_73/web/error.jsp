<%-- 
    Document   : error
    Created on : Nov 12, 2020, 6:38:22 PM
    Author     : Merisa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" flush="true" />
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <h1>ERROR!</h1>
        <p>${errormsg}</p>
    </body>
</html>
