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

        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from korisnikinfo;
        </sql:query>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">username</th>
                    <th scope="col">password</th>
                    <th scope="col">email</th>
                    <th scope="col">telefon</th>
                    <th scope="col">ime</th>
                    <th scope="col">prezime</th>
                    <th scope="col">role</th>
                    <th scope="col">status</th>
                    <th scope="col">edit</th>
                </tr>
            <thead>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr scope="row">
                        <td>${row.id}</td>
                        <td>${row.username}</td>
                        <td>${row.password}</td>
                        <td>${row.email}</td>
                        <td>${row.telefon}</td>
                        <td>${row.ime}</td>
                        <td>${row.prezime}</td>
                        <td>${row.role}</td>
                        <td>${row.STATUS}</td>
                        <td><a href="promjena.jsp?id=${row.id}">EDIT</a></td>
                    </tr>

                </c:forEach>  

        </table>

        
    </body>
</html>
