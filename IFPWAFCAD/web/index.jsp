<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Dec 2, 2015, 11:47:48 AM
    Author     : Sarah
--%>


<sql:query var="clubName" dataSource="jdbc/IFPWAFCAD">
    SELECT club_id, club_name FROM campusClubs_DB.club
</sql:query>

<sql:query var="person" dataSource="jdbc/IFPWAFCAD">
    SELECT first_name FROM campusClubs_DB.person;
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Welcome to <strong>GSBA Club Registration</strong>, the easiest way to keep track of your club!
        </h2>

        <table border="0">
            <thead>
                <tr>
                    <td>
                        <form action="response_3.jsp">
                            <strong>In order to be added to a club, you must register with GSBA</strong>
                            <input type="submit" value="register" name="register" />
                        </form>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Select the club to see its members</td>
                </tr>
                <tr>
                    <td>
                        <form action="response.jsp">
                            <strong>Select a club: </strong>
                            <select name="club_id">
                                <c:forEach var="row" items="${clubName.rowsByIndex}">
                                    <option value="${row[0]}">${row[1]}</option>
                                </c:forEach>
                                <option></option>
                            </select>
                            <input type="submit" value="submit" name="submit" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Select a club to see all of its upcoming events</td>
                </tr>
                <tr>
                    <td>
                        <form action="response_1.jsp">
                            <strong>Select a club</strong>
                            <select name="club_id">
                                <c:forEach var="row" items="${clubName.rowsByIndex}">
                                            <option value="${row[0]}">${row[1]}</option>
                                </c:forEach>
                                <option></option>
                            </select>
                            <input type="submit" value="submit" name="submit" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Enter the name of a person to view their memberships</td>
                </tr>
                <tr>
                    <td>
                        <form action="response_2.jsp">
                            <strong>First Name: </strong>
                            <input type="text" name="first_name" />
                            <strong>Last Name: </strong>
                            <input type="text" name="last_name" />
                            <input type="submit" value="submit" name="submit" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Select a club to register for</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
