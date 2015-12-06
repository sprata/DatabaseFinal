<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Dec 2, 2015, 11:50:38 AM
    Author     : Sarah
--%>

<sql:query var="clubMembers1" dataSource="jdbc/IFPWAFCAD">
    SELECT * 
    FROM club, member, person
    WHERE member.person_id = person.person_id
    AND club.club_name = ? <sql:param value="${param.club_name}"/>
</sql:query>
    

<c:set var="clubDetails" value="${clubMembers1.rows[0]}"/>

<sql:query var="clubMembers" dataSource="jdbc/IFPWAFCAD">
    SELECT * 
    FROM club, member, person
    WHERE member.club_id = club.club_id
    AND person.person_id = member.person_id
    AND club.club_id = <%= request.getParameter("club_id") %>
</sql:query>
    
<c:set var="clubName" value="${clubMembers.rows[1]}"/>

<table border="1">
    <!-- column headers -->
    <tr>
        <c:forEach var="columnName" items="${clubMembers.columnNames}">
            <th><c:out value="${columnName}"/></th>
            </c:forEach>
    </tr>
    <!-- column data -->
    <c:forEach var="row" items="${clubMembers.rowsByIndex}">
        <tr>
            <c:forEach var="column" items="${row}">
                <td><c:out value="${column}"/></td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Events</title>
    </head>
    <body>
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2">${clubName.club_name}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>Description: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">{placeholder}</span></td>
                </tr>
                <tr>
                    <td><strong>Counselor: </strong></td>
                    <td>{placeholder}
                        <br>
                        <span style="font-size:smaller; font-style:italic;">
                            member since: {placeholder}</span>
                    </td>
                </tr>
                <tr>
                    <td><strong>Contact Details: </strong></td>
                    <td><strong>email: </strong>
                        <a href="mailto:{placeholder}">{placeholder}</a>
                        <br><strong>phone: </strong>{placeholder}
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
