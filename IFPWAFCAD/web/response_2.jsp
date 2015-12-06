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
    SELECT club.club_name, person.category
    FROM club, member, person
    WHERE member.club_id = club.club_id
    AND person.person_id = member.person_id
    AND person.first_name = "<%= request.getParameter("first_name") %>"
    AND person.last_name = "<%= request.getParameter("last_name") %>"
</sql:query>
    
<c:set var="clubName" value="${clubMembers.rows[1]}"/>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Name Search</title>
    </head>
    <body>
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2">
                        <%= request.getParameter("first_name") %>
                        <%= request.getParameter("last_name") %>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>Description: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">"${clubMembers.category}"</span></td>
                </tr>
                <tr>
                    <table border="1">
                    <!-- column headers -->
                    <tr>
                        <c:forEach var="columnName" items="${clubMembers.columnNames}">
                            <th>Club Name</th>
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
                </tr>
            </tbody>
        </table>
    </body>
</html>
