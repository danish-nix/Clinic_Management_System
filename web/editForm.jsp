<%-- 
    Document   : editForm
    Created on : Jul 5, 2020, 9:23:08 PM
    Author     : MSI PL60
--%>

<%@page import="com.project.bean.Doctor"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/project" user="app" password="app"/>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentSessionUser");
    
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Employee</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <script type="text/javascript">
        function show_confirm(){
            var r =confirm("Are you sure to edit your data?");
            
        }
        
    </script>
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
        <h1>Edit Employee</h1>

        <div>
                    <form action="editServlet" method="POST" enctype="multipart/form-data">
                        <table class="table">
                            <tr>
                                <td>ID:</td>
                                <td><%= doctor.getId()%></td>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td><input type="text" name="username" value="<%= doctor.getUsername()%>"></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="text" name="password" value="<%= doctor.getPassword()%>"></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><input type="text" name="email" value="<%= doctor.getEmail()%>"></td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td><input type="text" name="name" value="<%= doctor.getName()%>"></td>
                            </tr>
                            <tr>
                                <td>Mobile:</td>
                                <td><input type="text" name="mobile" value="<%= doctor.getMobile()%>"></td>
                            </tr>
                            <tr>
                                <td>Sex</td>
                                <td><input type="text" name="sex" value="<%= doctor.getSex()%>"></td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td><input type="text" name="address" value="<%= doctor.getAddress()%>"></td>
                            </tr>
                            <tr>
                                <td>Country</td>
                                <td><input type="text" name="country" value="<%= doctor.getCountry()%>"></td>
                            </tr>
                            <tr>
                                <td>Speciality</td>
                                <td><input type="text" name="speciality" value="<%= doctor.getSpeciality()%>"></td>
                            </tr>
                        </table>
                            <input type="hidden" name="id" value="<%= doctor.getId()%>">
                            <div class="container">
                                <button type="submit" onclick="show_confirm">Save</button>
                            </div>
                                    
                    </form>
                </div>

    </body>
</html>
