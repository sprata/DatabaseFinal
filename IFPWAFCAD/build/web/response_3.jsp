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
        <title>Members</title>
    </head>
    <BODY>
        <H1>Registration for GSBA</H1>
        
        <form action="response_3b.jsp">
            <strong>First Name: </strong>
            <input type="text" name="first_name" />
            <strong>Last Name: </strong>
            <input type="text" name="last_name" />
            <strong>Category: </strong>
            <select name="category">
                <option value="guest">-select-</option> 
                <option value="student">student</option> 
                <option value="faculty">faculty</option> 
                <option value="guest">guest</option> 
            </select>
            <strong>Gender: </strong>
            <select name="gender"> 
                <option value="-1">-select-</option> 
                <option value="0">female</option> 
                <option value="1">male</option> 
                <option value="2">other</option> 
            </select>
            <strong>Age: </strong>
            <input type="text" name="age" />
            <input type="submit" value="submit" name="submit" />
        </form>
    </BODY>
</html>
