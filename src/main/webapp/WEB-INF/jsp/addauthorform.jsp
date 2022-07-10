<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Autor</title>
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


<h3 class="display-3"><center>Dodaj / edytuj autora:</center></h3>

<br><br><br>


<center>

<form:form action="saveAuthor" modelAttribute="author" method="POST">
    <table>
        <tr>
            <td><label for="firstName"><h5 class="display-5">imię:</h5></label></td>
            <td><form:input path="firstName" class="form-control" id="firstName"/></td>
        </tr>

        <tr>
            <td><label for="lastName"><h5 class="display-5">nazwisko:</h5></label></td>
            <td><form:input path="lastName" class="form-control" id="lastName"/></td>
        </tr>

        <tr>
            <td><form:hidden path="id"/></td>
        </tr>

    </table>
    <br><br>
    <button type="submit" class="btn btn-primary" style="width: 300px"><h6 class="display-8">Zapisz</h6></button>
</form:form>

</center>

</body>
</html>
