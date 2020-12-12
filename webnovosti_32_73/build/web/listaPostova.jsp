<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
    <jsp:include page="head.jsp" flush="true" />

    <body>
        <jsp:include page="header.jsp" flush="true" />
        <%@ include file="sqlDS.jsp" %>

        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from post;
        </sql:query>

        <div class="container">

            <h1 style="text-align: center">Posts</h1>
            <div class="posts" >
                <c:forEach var = "row" items = "${result.rows}">
                    <a href="prikazPost.jsp?id=${row.postid}">
                        <div class="post">                        
                            <img src="${row.imageurl}" >
                            <h3 class="post_title">${row.title}</h3>
                        </div>
                    </a>

                </c:forEach>
            </div>
    </body>
</html>