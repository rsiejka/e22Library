<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Księgarnia</title>
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
        <sec:authorize access="isAuthenticated()">
            <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/books/list">Książki</a>
            <sec:authorize access="hasRole('USER')">
                <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/cart">Koszyk</a>
            </sec:authorize>
            <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/orders">Zamówienia</a>
            <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/logout">Wyloguj</a>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
            <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/login">Zaloguj</a>
            <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/register">Zarejestruj</a>
        </sec:authorize>
    </div>
</nav>


<h1 class="display-2"><center>Księgarnia internetowa</center></h1>


<div class="container-fluid">
<sec:authorize access="isAuthenticated()">
    <p class="display-5">Twoje konto to: <c:out value="${pageContext.request.remoteUser}"/></p>
</sec:authorize>
    <p class="display-5"><center>Witaj!</center></p>
</div>


<sec:authorize access="isAuthenticated()">

<div>
    <a href="/books/list"><img src="../../images/promo.jpg" alt="lista książek" style="width: 100%"></a>
</div>

</sec:authorize>

<sec:authorize access="isAnonymous()">
    <a href="/login"><img src="../../images/promo.jpg" alt="lista książek" style="width: 100%"></a>
</sec:authorize>

</body>
</html>
