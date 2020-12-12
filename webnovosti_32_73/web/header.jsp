<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>

<div class="header">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">InfoPortal</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="listaPostova.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                     <c:if test="${sessionScope.korisnik.role=='Admin'}">
                        <a class="nav-link " href="listaKorisnika.jsp"><i class="fas fa-clipboard-list"></i> User list</a>
                     </c:if>
                </li>
                <li class="nav-item">
                    <c:if test="${sessionScope.korisnik.role=='Admin'}">
                    <a class="nav-link " href="dodaj.jsp"><i class="fas fa-plus-circle"></i> Add user</a>
                    </c:if>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <c:if test="${sessionScope.korisnik.role=='Admin'}">
                    <a class="nav-link " href="listaKorisnika.jsp"><i class="fas fa-crown"></i>Admin:  ${sessionScope.korisnik.username}</a>
                </c:if>

                <c:if test="${sessionScope.korisnik.role=='Editor'}">
                    <a class="nav-link " href="#"><i class="fas fa-user-edit"></i>Editor:  ${sessionScope.korisnik.username}</a>
                </c:if>
                <c:if test="${sessionScope.korisnik.role=='User'}">
                    <a class="nav-link " href="#"><i class="fas fa-user"></i>User:  ${sessionScope.korisnik.username}</a>
                </c:if>
                <c:if test="${empty sessionScope.korisnik}">
                    <a class="nav-link " href="index.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                    <a class="nav-link " href="dodaj.jsp"><i class="fas fa-pen"></i> Register</a>
                </c:if>

                <c:if test="${!empty sessionScope.korisnik}">
                    <c:if test="${sessionScope.korisnik.role=='Admin' || sessionScope.korisnik.role=='Editor'}">
                        <a class="nav-link " href="dodajPost.jsp"><i class="fas fa-plus"></i> Add post</a>
                    </c:if>
                    <a class="nav-link " href="Logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </c:if>
            </form>
        </div>
    </nav>
</div>
