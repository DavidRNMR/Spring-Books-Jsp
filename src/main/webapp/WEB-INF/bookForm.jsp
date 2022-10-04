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
    <title>Book Form</title>
</head>
<body>
<h1 style="text-align: center; font-family: Arial Narrow, sans-serif; margin-top: 25px;">Add new book </h1>
<hr>
<div style="margin-left: 20px;">
    <form:form action="/books/new" method="post" modelAttribute="newBook" class="form-inline">
        <div class="row">
            <form:label path="title"> Title: </form:label>
            <form:input type="text" path="title" class="form-control-sm w-25"  />
            <form:errors path="title" style="color:red" />
        </div>
        <div class="row">
            <form:label path="author"> Author: </form:label>
            <form:input type="text" path="author" class="form-control-sm w-25"   />
            <form:errors path="author" style="color:red"/>
        </div>
        <div class="row">
            <form:label path="myThoughts" > My Thoughts: </form:label>
            <form:textarea path="myThoughts" class="form-control-sm w-50" style="height: 100px;" />
            <form:errors path="myThoughts" style="color:red"/>
        </div>
        <form:hidden path="user" value="${userId }"/>
        <br>
        <button type="submit" class="btn btn-primary"> Add Book </button>
    </form:form>
    <br>
    <form action="/books">
        <input type="submit" value="Dashboard" class="btn btn-secondary"/>
    </form>
</div>
</body>
</html>