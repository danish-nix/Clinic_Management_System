<%-- 
    Document   : pEditDetails
    Created on : Jul 6, 2020, 8:06:52 PM
    Author     : MSI PL60
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.project.bean.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <link rel="stylesheet" type="text/css" href="style.css">
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/project" user="app" password="app"/>
<%
    Patient patient = (Patient) session.getAttribute("currentSessionUser");
    
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Details</title>
        
    </head>
    <body>
         <header>
             
            <div class="container">
                <nav>
                    <ul>
                        <li><a href='newBooking.jsp'>New Booking</a></li>
                        <li><a href='pbookingList.jsp'>View Booking</a></li>
                        <li><a href='searchDoctor.jsp'>Doctors List</a></li>
                        <li><a href='pEditDetails.jsp'>My Profile</a></li>
                        <li><a href='logout'>Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        
        <%
            List l=(List)request.getAttribute("update");
            if(l!=null)
            {
                for(Iterator it =l.iterator();it.hasNext();)
                {
                    String error = (String) it.next();
        %>
        <font color="black">
       <%=error%>
    </font>
        <%
                }
            }
        %>
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM Patient
        </sql:query>
        <div id="profile_details" class="edit">
            <h1>My Profile</h1>
        <table border="0">
            <tbody>
                <tr>
                    <th scope="row">ID:</th>
                    <td><%= patient.getId()%></td>
                    <th scope="row">Username:</th>
                    <td><%= patient.getUsername()%></td>
                </tr>
                <tr>
                    <th scope="row">Password:</th>
                    <td><%= patient.getPassword()%></td>
                    <th scope="row">Email</th>
                    <td><%= patient.getEmail()%></td>
                </tr>
                <tr>
                    <th scope="row">Name:</th>
                    <td><%= patient.getName()%></td>
                    <th scope="row">Gender:</th>
                    <td><%= patient.getSex()%></td>
                </tr>
                <tr>
                    <th scope="row">Mobile:</th>
                    <td><%= patient.getMobile()%></td>
                </tr>
                <tr>
                    <th scope="row">Address:</th>
                    <td><%= patient.getAddress()%></td>
                    <th scope="row">Country:</th>
                    <td><%= patient.getCountry()%></td>
                </tr>
            </tbody>
        </table>
                <br><br/><button><a href="pEditForm.jsp">Edit</a></button>
        </div>
        
            
    </body>
</html>

