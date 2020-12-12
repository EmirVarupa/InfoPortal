<%-- 
    Document   : upozorenjeBrisanja
    Created on : Dec 9, 2020, 9:51:46 PM
    Author     : storm
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" flush="true" />
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <%@ include file="sqlDS.jsp" %>

        <sql:update dataSource = "${snapshot}" var = "result">

            DELETE FROM post_comment
            WHERE postID=<%=request.getParameter("id")%>; 
            
        </sql:update>

        <sql:update dataSource = "${snapshot}" var = "result">


            DELETE FROM post
            WHERE postID=<%=request.getParameter("id")%>;


        </sql:update>
        <h1>Post has been succesfully deleted.</h1>
        <a href="listaPostova.jsp">Home</a>
    </body>
</html>
