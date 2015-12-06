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
<sql:query var="clubMembers3" dataSource="jdbc/IFPWAFCAD">
    SELECT first_name, last_name, category, role
    FROM club, member, person
    WHERE member.club_id = club.club_id
    AND person.person_id = member.person_id
    AND club.club_id = <%= request.getParameter("club_id")%>
</sql:query>



<sql:query var="clubMembers" dataSource="jdbc/IFPWAFCAD">
    SELECT * 
    FROM club, member, person
    WHERE member.club_id = club.club_id
    AND person.person_id = member.person_id
    AND club.club_id = <%= request.getParameter("club_id")%>
</sql:query>

<c:set var="clubName" value="${clubMembers.rows[1]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Members</title>
    </head>
    <body>
        <table border="0">
            <thead>
                <tr>
                    <th colspan="3" class="th2">${clubName.club_name}</th>
                </tr>
            </thead>
            <tbody>
                <!-- column headers -->
                <tr>
                        <th><c:out value="Name:"/></th>
                        <th><c:out value="Category:"/></th>
                        <th><c:out value="Role:"/></th>
                </tr>
                <!-- column data -->
                <c:forEach var="row" items="${clubMembers3.rowsByIndex}">
                    <tr>
                        <td><c:out value="${row[1]}, ${row[0]}"/></td>
                        <td><c:out value="${row[2]}"/></td>
                        <td><c:out value="${row[3]}"/></td>
                    </tr>
                </c:forEach>
        </tbody>

    </table>
</body>
</html>
