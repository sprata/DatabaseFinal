<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Dec 2, 2015, 11:50:38 AM
    Author     : Sarah
--%>

<sql:query var="clubMembers" dataSource="jdbc/IFPWAFCAD">
    SELECT c.club_name, m.role
    FROM club c, member m, person p
    WHERE m.club_id = c.club_id
    AND p.person_id = m.person_id
    AND p.first_name = "<%= request.getParameter("first_name") %>"
    AND p.last_name = "<%= request.getParameter("last_name") %>"
</sql:query>

    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Name Search</title>
    </head>
    <body>
        <div class="homeButton">
            <form action="index.jsp">
                <button type="submit" value="Home">Home</button>
            </form>
        </div>
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2" class="th2">
                        Clubs
                        <%= request.getParameter("first_name") %>
                        <%= request.getParameter("last_name") %>
                        is in:
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <!-- column headers -->
                    <tr>
                        <th>Club Name</th>
                        <th>Role</th>
                    </tr>
                    <!-- column data -->
                    <c:forEach var="row" items="${clubMembers.rowsByIndex}">
                        <tr>
                            <td><c:out value="${row[0]}"/></td>
                            <td><c:out value="${row[1]}"/></td>
                        </tr>
                    </c:forEach>
                    </table>
                </tr>
            </tbody>
        </table>
    </body>
</html>
