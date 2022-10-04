<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <title>Book details</title>
</head>
<body>
<div style="height: 450px; width: 500px; margin: 0 auto; border: 1px solid gray; margin-top: 50px;">
    <div style="text-align: center;">
        <h4><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/> read</h4>
        <p> ${book.title}</p>
        <p>By: ${book.author } </p>
        <br>
        <a href="/books"><button class="btn btn-secondary">Dashboard</button></a>
        <hr>
    </div>
    <div style="text-align: center;">
        <p> Here are <c:out value="${user.firstName}"/>'s thoughts: </p>
        <p>${book.myThoughts} </p>
        <c:if test = "${userId == book.user.id }" >
            <form action="/books/edit/${id }">
                <input type="submit" value="Edit Book" class="btn btn-success"/>
            </form>
        </c:if>
        <br>
    </div>
</div>
</body>
</html>