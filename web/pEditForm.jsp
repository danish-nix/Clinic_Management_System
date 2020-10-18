<%-- 
    Document   : pEditForm
    Created on : Jul 6, 2020, 8:07:05 PM
    Author     : MSI PL60
--%>

<%@page import="com.project.bean.Patient"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/project" user="app" password="app"/>
<%
    Patient patient = (Patient) session.getAttribute("currentSessionUser");
    
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Employee</title>
        <script type="text/javascript">
        function show_confirm(){
            var r =confirm("Are you sure to edit your data?");
            
        }
        
    </script>
    <link rel="stylesheet" type="text/css" href="style.css">
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
        <h1>Edit Employee</h1>

        <div>
                    <form action="pEditServlet" method="POST" enctype="multipart/form-data">
                        <table class="table">
                            <tr>
                                <td>ID:</td>
                                <td><%= patient.getId()%></td>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td><input type="text" name="username" value="<%= patient.getUsername()%>"></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="text" name="password" value="<%= patient.getPassword()%>"></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><input type="text" name="email" value="<%= patient.getEmail()%>"></td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td><input type="text" name="name" value="<%= patient.getName()%>"></td>
                            </tr>
                            <tr>
                                <td>Sex</td>
                                <td>
                                <select id="sex" name="sex">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select><br/><br/>
                                </td>
                            </tr>
                            <tr>
                                <td>Mobile:</td>
                                <td><input type="text" name="mobile" value="<%= patient.getMobile()%>"></td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td><input type="text" name="address" value="<%= patient.getAddress()%>"></td>
                            </tr>
                            <tr>
                                <td>Country</td>
                                <td><input type="text" name="country" value="<%= patient.getCountry()%>"></td>
                            </tr>
                            
                        </table>
                            <input type="hidden" name="id" value="<%= patient.getId()%>">
                            <div class="container">
                                <button type="submit" onclick="show_confirm()">Save</button>
                            </div>
                                    
                    </form>
                </div>

    </body>
</html>
