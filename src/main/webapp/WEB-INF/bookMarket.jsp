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
    <title>Insert title here</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<h3 style="text-align: center;">Hello <c:out value="${user.firstName}"></c:out>!</h3>
<a href="/books"><button class="btn btn-secondary">Dashboard</button></a>
<table class="table table-dark-sm caption-top">
    <caption style="text-align:center;"> Available books to borrow </caption>
    <thead>
    <tr>
        <th scope="col"> ID </th>
        <th scope="col"> Title </th>
        <th scope="col"> Author </th>
        <th scope="col"> Owner </th>
        <th scope="col"> Actions </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="book" items="${books }">
        <tr>
            <td> <c:out value="${book.id }" /> </td>
            <td> <a href="/books/${book.id }"><c:out value="${book.title }" /> </a></td>
            <td> <c:out value="${book.author}" /> </td>
            <td> <c:out value="${book.user.firstName}" /><c:out value="${book.user.lastName }"/> </td>
            <c:if test="${book.user.id == user.id }">
                <td> <a href="/books/edit/${book.id }"><button class="btn btn-success">Edit</button></a>
                    <form action="/books/delete/${book.id }" method="post" >
                        <input type="hidden" name="_method" value="delete">
                        <button type="submit" style="margin-top: 5px;"class="btn btn-danger">Delete</button>
                    </form>
                </td>
            </c:if>
            <c:if test="${book.user.id!=user.id }">
                <td> <a href="/bookmarket/${book.id }"><button class="btn btn-warning">Borrow</button></a></td>
            </c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>
<table class="table table-striped-sm caption-top">
    <caption style="text-align:center;"> Books I've borrowed </caption>
    <thead>
    <tr>
        <th scope="col"> ID </th>
        <th scope="col"> Title </th>
        <th scope="col"> Author </th>
        <th scope="col"> Owner</th>
        <th scope="col"> Actions </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="book" items="${myBooks }">
        <tr>
            <td> <c:out value="${book.id }" /> </td>
            <td> <a href="/books/${book.id }"><c:out value="${book.title }" /></a></td>
            <td> <c:out value="${book.author }" /></td>
            <td> <c:out value="${book.user.firstName }"/></td>
            <td> <a href="/bookmarket/return/${book.id }"><button class="btn btn-dark">Return</button></a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>