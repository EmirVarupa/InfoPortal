<%-- 
    Document   : prikaz
    Created on : Nov 12, 2020, 6:32:13 PM
    Author     : emir i amad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp" flush="true" />
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <h1>${poruka}</h1>
        <label>Username: </label><p> ${korisnik.username}</p>
        <label>First Name: </label><p> ${korisnik.ime}</p>
        <label>Last Name: </label><p> ${korisnik.prezime}</p>
        <label>Email: </label><p> ${korisnik.email}</p>
        <label>Phone number: </label><p> ${korisnik.telefon}</p>
        <label>Role: </label><p> ${korisnik.role}</p>

        <a href="promjena.jsp">Edit</a>
        <a href="Logout">Logout</a>
    </body>
</html>
