<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Książka</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style> span { padding-right: 10px; } </style>
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


<h3 class="display-3"><center>Dodaj / edytuj książkę:</center></h3>

<br><br><br>

<center>

<form:form action="saveBook" modelAttribute="book" method="POST">
    <table>
        <tr>
            <td><label for="name"><h5 class="display-5">nazwa:</h5></label></td>
            <td><form:input path="name" class="form-control" id="name"/></td>
        </tr>
        <tr>
            <td><label for="publisher"><h5 class="display-5">wydawnictwo:</h5></label></td>
            <td><form:input path="publisher" class="form-control" id="publisher"/></td>
        </tr>
        <tr>
            <td><label for="price"><h5 class="display-5">cena:</h5></label></td>
            <td><form:input path="price" class="form-control" id="price"/></td>
        </tr>
        <tr>
            <td><label for="categories"><h5 class="display-5">kategoria:</h5></label></td>
            <td>
                <form:select path="category" class="form-control" id="categories">
                    <form:options items="${categories}" itemValue="id" itemLabel="name"/>
                </form:select>
            </td>
        </tr>
        <tr>
            <td><label for="authors"><h5 class="display-5">autorzy:</h5></label></td>
            <td><form:checkboxes path="authors" items="${authors}" itemValue="id" id="authors"/></td>
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
