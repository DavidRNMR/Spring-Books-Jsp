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
    <title>Login and Register</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="d-flex-col text-center mt-3">
            <h1 style="color: #DC143C; font-family: Arial Narrow, sans-serif;"> Book Club </h1>
            <p>A place to share thoughts on books </p>
        </div>
    </div>
    <hr>
    <div class="row">
        <form:form action="/register" method="post" modelAttribute="newUser" class="col-6 d-flex-col align-items-center mt-5">
            <fieldset>
                <div>
                    <label>First Name:</label>
                    <form:input type="text" path="firstName" class="form-control"/>
                    <form:errors path="firstName" style="color: red"/>
                </div>
                <div>
                    <label>Last Name:</label>
                    <form:input type="text" path="lastName" class="form-control"/>
                    <form:errors path="lastName" style="color: red"/>
                </div>
                <div>
                    <label>Email:</label>
                    <form:input type="text" path="email" class="form-control"/>
                    <form:errors path="email" style="color: red" />
                </div>
                <div>
                    <label>Password:</label>
                    <form:input type="password" path="password" class="form-control"/>
                    <form:errors path="password" style="color: red" />
                </div>
                <div>
                    <label>Confirm Password:</label>
                    <form:input type="password" path="confirm" class="form-control"/>
                    <form:errors path="confirm" style="color: red" />
                </div>
                <input type="submit" class="button" value="Register" style="color: white; height: 35px; border: none; background-color: #4682B4; border-radius: 5px;"/>
            </fieldset>
        </form:form>

        <form:form action="/login" method="post" modelAttribute="newLogin" class="col-6 d-flex-col align-items-center mt-5">
            <fieldset>
                <div>
                    <label>Email: </label>
                    <form:input type="text" path="email" class="form-control"/>
                    <form:errors path="email" style="color: red" />
                </div>
                <div>
                    <label>Password:</label>
                    <form:password path="password" class="form-control"/>
                    <form:errors path="password" style="color: red" />
                    <br>
                </div>

                <input type="submit" class="button" value="Login" style="color: white; height: 35px; border: none; background-color: #4682B4; border-radius: 5px;"/>
            </fieldset>
        </form:form>
    </div>
</div>
</body>
</html>