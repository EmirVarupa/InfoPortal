<%-- 
    Document   : prikazpost
    Created on : Dec 6, 2020, 10:41:17 PM
    Author     : amad i emir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" flush="true" />
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <h1>${poruka}</h1>
        <label>Title: </label><p> ${postbean.getTitle()}</p>
        <label>Summary: </label><p> ${postbean.getSummary()}</p>
        <label>Content: </label><p> ${postbean.getPostContent()}</p>

        <a href="prikazPost.jsp?id=${id}"><input type="button" value="Back"></input></a>
        
    </body>
</html>
