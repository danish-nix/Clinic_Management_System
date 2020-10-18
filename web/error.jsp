<%-- 
    Document   : error
    Created on : Jun 26, 2020, 12:15:12 AM
    Author     : MSI PL60
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Error</h1>
        <%-- Report any errors (if any)--%>
        <c:if test="${not empty errorMsgs}">
            <p>
                <font color='red'> Please correct the following errors:
                    <ul>
                        <c:forEach var="message" items="${errorMsgs}">
                            <li>${message}</li>
                        </c:forEach>
                    </ul>
                </font>
            </p>
        </c:if>
            <p><a href="viewemp">View Employees</a></p>
            <p><a href="index.html">index</a></p>
    </body>
</html>