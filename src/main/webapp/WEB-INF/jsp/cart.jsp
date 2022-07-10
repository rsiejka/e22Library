<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Koszyk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
    <div class="container">
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/books/list">Książki</a>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/cart">Koszyk</a>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/orders">Zamówienia</a>
        <a class="text-dark font-weight-bold" href="${pageContext.request.contextPath}/logout">Wyloguj</a>
    </div>
</nav>

<h3 class="display-3"><center>Koszyk:</center></h3>

<br><br><br>


<c:if test="${not empty books}">
        <h6 class="display-6">
        <table class="table table-striped table-bordered table-hover">
            <tr class="text-light bg-primary">
                <th>Tytuł</th>
                <th>Wydawnictwo</th>
                <th>Cena</th>
                <th>Kategoria</th>
                <th>Autorzy</th>
                <th>Usuń</th>
            </tr>


            <c:set var="totalPrice" value="0"/>
            <c:forEach var="book" items="${books}">
                <c:set var="totalPrice" value="${totalPrice + book.price}"/>
                <tr>
                    <td><c:out value="${book.name}"/></td>
                    <td><c:out value="${book.publisher}"/></td>
                    <td><c:out value="${book.price}"/></td>
                    <td><c:out value="${book.category.name}"/></td>
                    <td><c:out value="${book.authorsToString()}"/></td>
                    <td>
                        <form:form action="${pageContext.request.contextPath}/cart/delete">
                            <input type="hidden" id="bookId" name="bookId" value="${book.id}"/>
                            <button type="submit" class="btn btn-primary">Usuń</h6></button>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>

        </table>
                <center>
                <p><h4 class="display-4">cena: <fmt:formatNumber value="${totalPrice}" maxFractionDigits="2"/></h4></p>
                </center>

        <br><br><br><br>

                <form:form method="post" action="${pageContext.request.contextPath}/orders">
                    <button type="submit" class="btn btn-primary" style="width: 100%; height: 100px"><h2 class="display-5">Zamów</h2></button>
                </form:form>
</c:if>

</body>
</html>
