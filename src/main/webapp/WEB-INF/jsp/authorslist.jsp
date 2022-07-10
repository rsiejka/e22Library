<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Autorzy</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
    <div class="container">
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/authors/list">Autorzy</a>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/categories/list">Kategorie</a>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/books/list">Książki</a>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/orders">Zamówienia</a>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/logout">Wyloguj</a>
    </div>
</nav>
<br><br>
<h3 class="display-3"><center>Autorzy:</center></h3>







<%-------------------------------------------------------------------------------------------------------------------------------------------------%>

<c:forEach var="author" items="${authors}">
    <c:url var="update" value="/authors/updateAuthorForm">
        <c:param name="authorId" value="${author.id}"/>
    </c:url>
    <c:url var="delete" value="/authors/deleteAuthorForm">
        <c:param name="authorId" value="${author.id}"/>
    </c:url>

<div class="border border-info" style="width: 800px; height: 400px; margin: 40px">

    <div class="border border-info" id="zdjecie" style="width: 299px; height: 300px; float: left">
        <center><img src="../../images/autor.jpg" alt="zdjęcie autora" style="width: 200px;height: 250px; padding: 20px; float:top">
            <br>(Przykładowe zdjęcie autora)</center>
    </div>

    <div class="border border-info" id="dane" style="width: 499px; height:300px; float: right">

        <div style="float: top; margin-top: 50px">
            <center>
            <h3 class="display-5"><c:out value="${author.firstName}"/></h3>
            </center>
        </div>

        <div style="clear: both; margin-top: 50px">
            <center>
            <h3 class="display-5"><c:out value="${author.lastName}"/></h3>
            </center>
        </div>



    </div>

    <div class="border border-info" id="edycja" style="width: 100%; height:98px;clear: both">
        <div style="float: left; margin-top: 15px; margin-left: 150px">

            <h1 class="display-6"><a href="${update}">edytuj</a></h1>
        </div>

        <div style="float: right; margin-top: 15px; margin-right: 150px">
            <h1 class="display-6"><a href="${delete}">usuń</a></h1>
        </div>

    </div>

</div>

    <br><br>

</c:forEach>
<%-------------------------------------------------------------------------------------------------------------------------------------------------%>


<a href="${pageContext.request.contextPath}/authors/formadd" class="btn btn-primary" type="button" style="width: 100%; height: 100px"><h2 class="display-5">Dodaj autora</h2></a>

</body>
</html>
