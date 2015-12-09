<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Dec 2, 2015, 11:50:38 AM
    Author     : Sarah
--%>
<sql:query var="result" dataSource="jdbc/IFPWAFCAD">
    SELECT club_name FROM club WHERE club.club_id = ? <sql:param value="${param.club_id}"/>
</sql:query>

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
        <div class="homeButton">
            <form action="index.jsp">
                <button type="submit" value="Home">Home</button>
            </form>
        </div>
        <h1>Registration for ${result.rows[0].club_name}</h1>
        
        <form action="response_4b.jsp">
            <strong>First Name: </strong>
            <input style="display:none" name="club_id" value="${param.club_id}"></input>
            <input type="text" name="first_name" />
            <strong>Last Name: </strong>
            <input type="text" name="last_name" />
            </br>
            </br>
            <strong>Role: </strong>
            <select name="role">
                <option value="voting">-voting-</option> 
                <option value="non-voting">non-voting</option> 
                <option value="president">president</option> 
                <option value="vice president">vice president</option> 
                <option value="secretary">secretary</option>
                <option value="social-secretary">social-secretary</option>
            </select>
            </br>
            </br>
            <strong>Age: </strong>
            <input type="text" name="age" />
            <input type="submit" value="Submit" name="submit" />
        </form>
    </BODY>
</html>
