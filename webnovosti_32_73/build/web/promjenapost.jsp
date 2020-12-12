<%-- 
    Document   : promjenapost
    Created on : Dec 8, 2020, 12:42:05 PM
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
        
        
 
      <sql:query dataSource = "${snapshot}" var = "result">
        
        SELECT * FROM post
        WHERE postID=<%=request.getParameter("id")%>
        LIMIT 1;
        
         
      </sql:query>
 
        <c:forEach var = "row" items = "${result.rows}">
             
             <div class="wrapper fadeInDown">
                <div id="formContent">
                    <!-- Tabs Titles -->

                    <!-- Icon -->
                    <div class="fadeIn first">
                       <i class="fas fa-newspaper"></i>
                    </div>

                    <!-- Login Form -->
                    <form action="IzmjenaPost" method="POST">
                        <input type="hidden" value="${row.postid}" name="id">
                        <input type="text" id="title" class="fadeIn second"  name="title" placeholder="Title" value="${row.title}" autocomplete="off">
                        <input type="text" id="summary" class="fadeIn third" name="summary" placeholder="Summary" value="${row.summary}" autocomplete="off">
                        <textarea  cols="50" rows="10" class="fadeIn fourth" name="postcontent"placeholder="Content" autocomplete=off>${row.postcontent}</textarea>
                        <input type="url" id="imageurl" class="fadeIn fifth" name="imageurl" placeholder="Image URL" value="${row.imageurl}" autocomplete="off">
                        <input type="submit" class="fadeIn sixth" value="Add">
                    </form>
                       

                    <div id="formFooter">
                        <a class="underlineHover" href="listaPostova.jsp">Back</a>
                    </div>

                </div>
            </div>
            
        
        </c:forEach>
            
    </body>
</html>
