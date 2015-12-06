<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Dec 2, 2015, 11:50:38 AM
    Author     : Sarah
--%>

<sql:query var="events" dataSource="jdbc/IFPWAFCAD">
    SELECT club_name, oc_name, loc_name, date_time
    FROM occasion o, club c, location l, hoster h
    WHERE o.host_id = h.club_id
    AND h.club_id = c.club_id
    AND o.loc_id = l.loc_id
    AND c.club_id = <%= request.getParameter("club_id")%>
    AND date_time > curdate()
    GROUP BY o.oc_id
    ORDER BY date_time
</sql:query>  
    
<c:set var="clubName" value="${events.rows[0]}"/>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Future Events</title>
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
                        <th><c:out value="Event:"/></th>
                        <th><c:out value="Location:"/></th>
                        <th><c:out value="Date:"/></th>
                </tr>
                <!-- column data -->
                <c:forEach var="row" items="${events.rowsByIndex}">
                    <tr>
                        <td><c:out value="${row[1]}"/></td>
                        <td><c:out value="${row[2]}"/></td>
                        <td><c:out value="${row[3]}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
