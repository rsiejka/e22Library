<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Kategorie</title>
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
<h3 class="display-3"><center>Kategorie:</center></h3>



<c:forEach var="category" items="${categories}">
    <c:url var="update" value="/categories/updateCategoryForm">
        <c:param name="categoryId" value="${category.id}"/>
    </c:url>
    <c:url var="delete" value="/categories/deleteCategoryForm">
        <c:param name="categoryId" value="${category.id}"/>
    </c:url>


<center>
<div class="border border-info" style="width: 800px; height: 400px; margin: 40px">

    <div class="border border-info" style="width: 799px; height: 249px; float: top">
        <h5 class="display-5" style="margin-top: 75px"><center><c:out value="${category.name}"/></center></h5>
    </div>

    <div class="border border-info" style="width: 399px; height: 149px; float: left">
        <h5 class="display-5" style="margin-top: 25px"><center><a href="${update}">edytuj</a></center></h5>
    </div>

    <div class="border border-info" style="width: 399px; height: 149px; float: right">
        <h5 class="display-5" style="margin-top: 25px"><center><a href="${delete}">usuń</a></center></h5>
    </div>

</div>
</center>

</c:forEach>

<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>

<a href="${pageContext.request.contextPath}/categories/formadd" class="btn btn-primary" type="button" style="width: 100%; height: 50px"><h2 class="display-6">Dodaj kategorie</h2></a>

</body>
</html>
