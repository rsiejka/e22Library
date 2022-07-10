<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Książki</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
    <div class="container">
        <sec:authorize access="hasRole('ADMIN')">
            <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/authors/list">Autorzy</a>
            <a class="text-dark font-weight-bold"
               href="${pageContext.request.contextPath}/categories/list">Kategorie</a>
        </sec:authorize>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/books/list">Książki</a>
        <sec:authorize access="hasRole('USER')">
            <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/cart">Koszyk</a>
        </sec:authorize>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/orders">Zamówienia</a>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/logout">Wyloguj</a>
    </div>
</nav>

<h3 class="display-3"><center>Książki:</center></h3>

<br><br><br>


<c:forEach var="book" items="${books}">
    <c:url var="update" value="/books/updateBookForm">
        <c:param name="bookId" value="${book.id}"/>
    </c:url>
    <c:url var="delete" value="/books/deleteBookForm">
        <c:param name="bookId" value="${book.id}"/>
    </c:url>
<div class="border border-info" style="width: 800px; height: 400px; margin: 40px">

    <div class="border border-info" id="zdjecie" style="width: 299px; height: 300px; float: left">
        <center><img src="../../images/ksiazka.jpg" alt="zdjęcie ksiazki" style="width: 200px;height: 250px; padding: 20px; float:top">
            <br>(Przykładowe zdjęcie książki)</center>
    </div>

    <div class="border border-info" id="dane" style="width: 499px; height:300px; float: right">

        <div>
            <h3 class="display-6"><b>Tytuł: </b><i><c:out value="${book.name}"/></i></h3>
        </div>
        <div>
            <h3 class="display-6"><b>Autor: </b><i><c:out value="${book.authorsToString()}"/></i></h3>
        </div>
        <div>
            <h3 class="display-6"><b>Wydawnictwo: </b><i><c:out value="${book.publisher}"/></i></h3>
        </div>
        <div>
            <h3 class="display-6"><b>Kategoria: </b><i><c:out value="${book.category.name}"/></i></h3>
        </div>
        <div>
            <h3 class="display-6"><b>Cena: </b> <i><c:out value="${book.price}"/></i></h3>
        </div>
    </div>

    <div class="border border-info" id="edycja" style="width: 100%; height:98px;clear: both">

        <sec:authorize access="hasRole('ADMIN')">
            <div style="float: left; margin-top: 15px; margin-left: 150px">
                <h1 class="display-6"><a href="${update}">edytuj</a></h1>
            </div>
            <div style="float: right; margin-top: 15px; margin-right: 150px">
                <h1 class="display-6"><a href="${delete}">usuń</a></h1>
            </div>
        </sec:authorize>

        <sec:authorize access="hasRole('USER')">
            <center>
            <div>
                <form:form action="${pageContext.request.contextPath}/cart/add">
                    <input type="hidden" id="bookId" name="bookId" value="${book.id}"/>
                    <button type="submit" class="btn btn-primary" style="margin-top: 15px; width:80%"><h5 class="display-6">Do koszyka</h5></button>
                </form:form>
            </div>
            </center>
        </sec:authorize>


    </div>


</div>
<br><br>
</c:forEach>



<br><br><br>



<sec:authorize access="hasRole('ROLE_ADMIN')">

    <a href="${pageContext.request.contextPath}/books/formadd" class="btn btn-primary" type="button" style="width: 100%; height: 100px"><h2 class="display-5">Dodaj książkę</h2></a>

</sec:authorize>

</body>
</html>
