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
    <title>Book Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div style="display: flex; margin-top: 20px; justify-content: space-evenly;">
    <div>
        <h1 style="font-family: Tahoma (sans-serif); ">Book Club</h1>
    </div>
    <div>
        <h1 style="text-align: center; font-family: Tahoma (sans-serif);">Welcome, <c:out value="${user.firstName}"></c:out> <c:out value="${user.lastName }"/>! </h1>
    </div>
</div>
<hr>
<div style="text-align: center;">
    <a href="/books/new"><button class="btn btn-success">Add a new Book</button></a>
    <a href="/bookmarket"><button class="btn btn-info">Book Market</button></a>
    <a href="/logout"><button class="btn btn-secondary">Log Out</button></a>
</div>
<table class="table table-striped-sm w-75" style="margin: 0 auto;">
    <thead>
    <tr>
        <th scope="col">ID </th>
        <th scope="col">Title </th>
        <th scope="col">Author </th>
        <th scope="col">Posted by </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="eachBook" items="${bookList }">
        <tr>
            <td> <c:out value="${eachBook.id }" /> </td>
            <td> <a href="/books/${eachBook.id}"><c:out value="${eachBook.title }" /> </a></td>
            <td> <c:out value="${eachBook.author }" /></td>
            <td> <c:out value="${eachBook.user.firstName}" /> <c:out value="${eachBook.user.lastName }" /></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>