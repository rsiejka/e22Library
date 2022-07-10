<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Zamówienia</title>
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

<h3 class="display-3"><center>Zamówienia:</center></h3>

<br><br><br>

<c:if test="${not empty orders}">
    <div>

        <h6 class="display-6">
        <table class="table table-striped table-bordered table-hover">
            <tr class="text-light bg-primary">
                <th>Książki</th>
                <th>Cena</th>
                <th>Status</th>
                <sec:authorize access="hasRole('ADMIN')">
                    <th>Użytkownik</th>
                    <th>Zmień status</th>
                </sec:authorize>
            </tr>


            <c:forEach var="order" items="${orders}">
                <tr>
                    <td><c:out value="${order.booksToString()}"/></td>
                    <td><c:out value="${order.price}"/></td>
                    <td><c:out value="${order.status}"/></td>
                    <sec:authorize access="hasRole('ADMIN')">
                        <td><c:out value="${order.user.username}"/></td>
                        <td>
                            <form:form action="${pageContext.request.contextPath}/orders/complete">
                                <input type="hidden" id="orderId" name="orderId" value="${order.id}"/>
                                <button type="submit" class="btn btn-primary"><h6 class="display-6">Finished</h6></button>
                            </form:form>
                        </td>
                    </sec:authorize>
                </tr>
            </c:forEach>

        </table>
        </h6>
    </div>
    <br><br><br><br>
</c:if>

</body>
</html>
