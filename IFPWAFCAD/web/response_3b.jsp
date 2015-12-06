<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Dec 2, 2015, 11:50:38 AM
    Author     : Sarah
--%>



<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member added!</title>
    </head>
    <BODY>
        <sql:update var="insertName" dataSource="jdbc/IFPWAFCAD">
            INSERT INTO person (last_name, first_name, category, gender, age)
            VALUES (? <sql:param value="${param.last_name}"/>, ? <sql:param value="${param.first_name}"/>, ? <sql:param value="${param.category}"/>, ? <sql:param value="${param.gender}"/>, ? <sql:param value="${param.age}"/>)
        </sql:update> 
        <H1>You have been registered</H1>
    </BODY>
</html>
