<%-- 
    Document   : promjena
    Created on : Nov 12, 2020, 6:35:07 PM
    Author     : Merisa
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
            SELECT * from korisnikinfo
            where id='<%=request.getParameter("id")%>';
        </sql:query>

        <c:forEach var = "row" items = "${result.rows}">

            <h3 class="fadeIn first" style="text-align: center">${poruka}</h3>
            <div class="wrapper fadeInDown">
                <div id="formContent">
                    <!-- Tabs Titles -->

                    <!-- Icon -->
                    <div class="fadeIn first">
                        <i id="icon" alt="Welcome" class="fas fa-user"></i>
                    </div>

                    <!-- Login Form -->
                    <form action="Izmjena" method="POST">
                        <input type="hidden" name="username" value="${row.username}">
                        <input type="password" id="password" class="fadeIn second" name="password" placeholder="Password"  autocomplete="off" value="${row.password}">
                        <input type="text" id="email" class="fadeIn third" name="email" placeholder="Email"  autocomplete="off" value="${row.email}">
                        <input type="text" id="phonenumber" class="fadeIn fourth" name="telefon" placeholder="Phone Number"  autocomplete="off" value="${row.telefon}">
                        <input type="text" id="first_name" class="fadeIn fifth" name="ime" placeholder="First Name"  autocomplete="off" value="${row.ime}">
                        <input type="text" id="last_name" class="fadeIn sixth" name="prezime" placeholder="Last Name" autocomplete="off" value="${row.prezime}">
                        <br>
                        <label>Uloga</label>
                        <br>
                        <c:if test="${row.role=='Admin'}">
                            <div class="role_radio">
                            <input type="radio" id="admin" name="role" value="Admin" checked required>            
                            <label class="role_label" for="admin">Admin</label>
                            <input type="radio" id="editor" name="role" value="Editor">
                            <label class="role_label" for="editor">Editor</label>
                            <input type="radio" id="user" name="role" value="User">
                            <label class="role_label" for="user" style="margin: 0">User</label>
                            </div>
                        </c:if>

                        <c:if test="${row.role=='Editor'}">
                            <div class="role_radio">
                            <input type="radio" id="admin" name="role" value="Admin" required>            
                            <label class="role_label" for="admin">Admin</label><br>
                            <input type="radio" id="editor" name="role" value="Editor" checked>
                            <label class="role_label" for="editor">Editor</label><br>
                            <input type="radio" id="user" name="role" value="User">
                            <label class="role_label" for="user" style="margin: 0">User</label>
                            </div>
                        </c:if>

                        <c:if test="${row.role=='User'}">
                            <div class="role_radio">
                                <input type="radio" id="admin" name="role" value="Admin" required>            
                                <label class="role_label" for="admin">Admin</label><br>
                                <input type="radio" id="editor" name="role" value="Editor">
                                <label class="role_label" for="editor">Editor</label><br>
                                <input type="radio" id="user" name="role" value="User" checked>
                                <label class="role_label" for="user" style="margin: 0">User</label>
                            </div>
                        </c:if>
                        <br>
                        <label>Status</label>
                        <br>
                        <c:if test="${row.status=='ACTIVE'}">
                            <input type="radio" id="active" name="status" value="ACTIVE" checked required>            
                            <label for="active">Active</label><br>
                            <input type="radio" id="inactive" name="status" value="INACTIVE">
                            <label for="inactive">Inactive</label><br>
                        </c:if>
                        <c:if test="${row.status=='INACTIVE'}">
                            <input type="radio" id="active" name="status" value="ACTIVE"  required>            
                            <label for="active">Active</label><br>
                            <input type="radio" id="inactive" name="status" value="INACTIVE" checked>
                            <label for="inactive">Inactive</label><br>
                        </c:if>
                        <input type="submit" class="fadeIn seventh" value="Edit">
                    </form>


                    <div id="formFooter">
                        <a class="underlineHover" href="listaKorisnika.jsp">Back</a>
                    </div>

                </div>
            </div>


        </c:forEach>   


    </body>
</html>




