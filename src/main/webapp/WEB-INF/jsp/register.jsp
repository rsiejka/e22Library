<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Rejestracja</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
    <div class="container">
        <a class="text-dark font-weight-bold" href="/">Strona główna</a>
    </div>
</nav>

<h3 class="display-3"><center>Rejestracja:</center></h3>

<br><br><br>


<center>
<c:if test="${not empty info}"><p class="text-danger"><c:out value="${info}"/></p></c:if>
<form:form method="post" modelAttribute="user">
    <table>

        <tr>
            <td><label for="username"><h6 class="display-6">Nazwa:</label></td>
            <td><form:input path="username" id="username" class="form-control"/></td>
        </tr>
        <tr>
            <td><label for="password"><h6 class="display-6">Hasło:</label></td>
            <td><form:password path="password" id="password" class="form-control"/></td>
        </tr>




    </table>
    <br><br>
    <button type="submit" class="btn btn-primary" style="width:60%"><h6 class="display-6">Zarejestruj</h6></button>
</form:form>
</center>
</body>
</html>
