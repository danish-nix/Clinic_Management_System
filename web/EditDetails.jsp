<%-- 
    Document   : EditDetails
    Created on : Jun 25, 2020, 9:23:27 PM
    Author     : MSI PL60
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.project.bean.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <link rel="stylesheet" type="text/css" href="style.css">
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/project" user="app" password="app"/>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentSessionUser");
    
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <header>
            <div class="container">
                <nav>
                    <ul>
                        <li><a href='dbookinglist.jsp'>Appointments</a></li>
                        <li><a href='patientList.jsp'>View Patients</a></li>
                        <li><a href='prescription.jsp'>Prescription</a></li>
                        <li><a href='EditDetails.jsp'>My Profile</a></li>
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
            SELECT * FROM Doctor
        </sql:query>
        <div class="edit" id="profile_details">
            <h1>My Profile</h1>
        <table border="0">
            <tbody>
                <tr>
                    <th scope="row">ID:</th>
                    <td><%= doctor.getId()%></td>
                    <th scope="row">Username:</th>
                    <td><%= doctor.getUsername()%></td>
                </tr>
                <tr>
                    <th scope="row">Password:</th>
                    <td><%= doctor.getPassword()%></td>
                    <th scope="row">Email</th>
                    <td><%= doctor.getEmail()%></td>
                </tr>
                <tr>
                    <th scope="row">Name:</th>
                    <td><%= doctor.getName()%></td>
                    <th scope="row">Mobile:</th>
                    <td><%= doctor.getMobile()%></td>
                </tr>
                <tr>
                    <th scope="row">Sex:</th>
                    <td><%= doctor.getSex()%></td>
                    <th scope="row">Address</th>
                    <td><%= doctor.getAddress()%></td>
                </tr>
                <tr>
                    <th scope="row">Country</th>
                    <td><%= doctor.getCountry()%></td>
                    <th scope="row">Speciality</th>
                    <td><%= doctor.getSpeciality()%></td>
                </tr>
            </tbody>
        </table>
                <button><a href="editForm.jsp">Edit</a></button>
        </div>
        
            
    </body>
</html>

