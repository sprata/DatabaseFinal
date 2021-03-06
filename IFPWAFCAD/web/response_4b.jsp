<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Dec 2, 2015, 11:50:38 AM
    Author     : Sarah
--%>


<sql:query var="personToInsert" dataSource="jdbc/IFPWAFCAD">
    SELECT person_id FROM person WHERE person.first_name = ? <sql:param value="${param.first_name}"/> AND person.last_name = ? <sql:param value="${param.last_name}"/>
</sql:query>
    
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
        <sql:update var="memberAddition" dataSource="jdbc/IFPWAFCAD">
            INSERT INTO member (person_id, club_id,role, waiver)
            VALUES ("${personToInsert.rows[0].person_id}", ? <sql:param value="${param.club_id}"/>, ? <sql:param value="${param.role}"/>,0)
        </sql:update>
        <H1>You have been registered</H1>
        <form action="index.jsp">
            <strong>Return to home</strong>
            <input type="submit" value="submit" name="submit" />
        </form>
    </BODY>
</html>
