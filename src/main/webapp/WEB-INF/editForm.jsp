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
    <title>Edit book form</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<h3 style="text-align: center;">Edit Book </h3>
<a href="/books"><button class="btn btn-secondary"> Dashboard</button></a>
<hr>
<div style="margin-left: 20px;">
    <form:form action="/books/edit/${id }" method="post" modelAttribute="book">
        <input type="hidden" name="_method" value="put" />
        <form:input type="hidden" name="user" path="user" />
        <form:input type="hidden" name="borrower" path="borrower" />
        <div class="row">
            <form:label path="title"> Title: </form:label>
            <form:input type="text" path="title" class="form-control-sm w-25"  />
            <form:errors path="title" />
        </div>
        <div class="row">
            <form:label path="author"> Author: </form:label>
            <form:input type="text" path="author" class="form-control-sm w-25"  />
            <form:errors path="author" />
        </div>
        <div class="row">
            <form:label path="myThoughts" > My Thoughts: </form:label>
            <form:textarea path="myThoughts" class="form-control-sm w-50" style="height: 100px;" />
            <form:errors path="myThoughts" />
        </div>
        <form:hidden path="user" value="${books.user.id }"/>
        <br>
        <button type="submit" class="btn btn-primary"> Edit </button>
    </form:form>
</div>
</body>
</html>