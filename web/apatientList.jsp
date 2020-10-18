<%-- 
    Document   : apatientList
    Created on : Jul 12, 2020, 10:01:52 PM
    Author     : MSI PL60
--%>

<%@page import="com.project.bean.Admin"%>
<%@page import="java.sql.*"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/project" user="app" password="app"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Patient list</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    </head>
    <body>
        <header>
            <div class="container">
                <nav>
                    <ul>
                        <li><a href='doctorsList.jsp'>Doctors List</a></li>
                        <li><a href='apatientList.jsp'>Customers List</a></li>
                        <li><a href='appointmentList.jsp'>Appointment List</a></li>
                        <li><a href='logout'>Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <h1>Patient List</h1>
        <table border="0">
            <!-- column headers -->
            
        </table>
        <div class="ptable">
            <table border="1" cellspacing="0" cellpadding="9">
                <tr>
                    <th>PATIENT ID</th>
                    <th>PATIENT USERNAME</th>
                    <th>PATIENT PASSWORD</th>
                    <th>PATIENT EMAIL</th>
                    <th>PATIENT MOBILE</th>
                    <th>PATIENT NAME</th>
                    <th>PATIENT ADDRESS</th>
                    <th>PATIENT COUNTRY</th>
                    <th>PATIENT GENDER</th>
                    <th>PATIENT PRESCRIPTION</th>
                </tr>
            <!-- column data -->
            
                  
                 <%
                    
                    try{
                                        
                            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                            Statement stm = con.createStatement();
                            ResultSet rs = stm.executeQuery("select * from PATIENT");
                            while(rs.next())
                            {
                               %> 
                               <tr>  
                               <td><%=rs.getInt("id")%></td>
                               <td><%=rs.getString("username")%></td>
                               <td><%=rs.getString("password")%></td>
                               <td><%=rs.getString("email")%></td>
                               <td><%=rs.getString("mobile")%></td>
                               <td><%=rs.getString("name")%></td>
                               <td><%=rs.getString("address")%></td>
                               <td><%=rs.getString("country")%></td>
                               <td><%=rs.getString("sex")%></td>
                               <td><%=rs.getString("prescription")%></td>
                               </tr>
                               <%
                            }
                        }catch(Exception ex){
                            ex.printStackTrace();
                            out.println("error"+ ex.getMessage());
                        }              
                 %>       
                
            
            </table>
        </div>
    </body>
</html>
