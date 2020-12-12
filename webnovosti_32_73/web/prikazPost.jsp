<%-- 
    Document   : prikazpost
    Created on : Dec 6, 2020, 10:41:17 PM
    Author     : amad i emir
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
        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from post
            WHERE postID='<%=request.getParameter("id")%>';
        </sql:query>

        <div class="container">
            <div class="col-sm-6" style="margin: 0 auto">
                <c:forEach var = "row" items = "${result.rows}">
                    <img class="postImg" src="${row.imageurl}" >
                    <h3 style="text-align: center">${row.title}</h3>
                    <p>${row.postcontent}</p>
                </c:forEach>

                <c:if test="${sessionScope.korisnik.role=='Admin' || sessionScope.korisnik.role=='Editor'}">
                    <a href="promjenapost.jsp?id=<%=request.getParameter("id")%>"><input type="button" value="Edit"> </input></a>
                    <a href="upozorenjeBrisanja.jsp?id=<%=request.getParameter("id")%>"><input type="button" value="Delete post"> </input></a>           
                    </c:if>     
            </div>
            <sql:query dataSource = "${snapshot}" var = "resultcomment">
                SELECT * from post_comment
                WHERE postID='<%=request.getParameter("id")%>';
            </sql:query>     

            <sql:query dataSource = "${snapshot}" var = "resultkorisnik">
                SELECT * from korisnikinfo
                WHERE username='${sessionScope.korisnik.username}';
            </sql:query>   

            <c:forEach var = "row" items = "${resultkorisnik.rows}">
                <form action="<%=request.getContextPath()%>/DodavanjeKomentar" method="POST">
                    <input type="hidden" name="postID" value="<%=request.getParameter("id")%>">
                    <input type="hidden" name="userID" value="${row.id}">
                    <label class="col-1">Comment: </label><input class="col-7" type="text" name="commentcontent" autocomplete="off">
                    <input type="submit" value="Comment" class="col-3">             
                </form>
            </c:forEach> 
            <div class="comments">
                <h1>Comments</h1>
                <c:forEach var = "row" items = "${resultcomment.rows}">
                    <div class="comment">

                        <sql:query dataSource = "${snapshot}" var = "resultkorisnik">
                            SELECT * from korisnikinfo
                            WHERE id='${row.userID}';

                        </sql:query>   
                        <c:forEach var = "row1" items = "${resultkorisnik.rows}">
                            <p>Username: ${row1.username}</p>
                        </c:forEach> 
                        <p>Date: ${row.datepublished}</p>
                        <p>Comment: ${row.commentcontent}</p>

                        <c:if test="${sessionScope.korisnik.role=='Admin' || sessionScope.korisnik.role=='Editor'}">
                            <a href="upozorenjeBrisanjaKomentar.jsp?id=${row.post_commentID}&postID=${row.postID}">Remove comment</a>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
