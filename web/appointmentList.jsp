<%-- 
    Document   : appointmentList
    Created on : Jul 12, 2020, 10:08:54 PM
    Author     : MSI PL60
--%>


<%@page import="java.sql.*"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/project" user="app" password="app"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Appointment List</title>
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
        <h1>Appointment List</h1>
        <table border="0">
            <!-- column headers -->
            
        </table>
        <div class="ptable">
            <table border="1" cellspacing="0" cellpadding="9">
                <tr>
                    <th>APPOINTMENT ID</th>
                    <th>DATE</th>
                    <th>TIME</th>
                    <th>DOCTOR NAME</th>
                    <th>PATIENT ID</th>
                    <th>PATIENT NAME</th>
                </tr>
            <!-- column data -->
            
                  
                 <%
                    
                    try{
                                        
                            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                            Statement stm = con.createStatement();
                            ResultSet rs = stm.executeQuery("select * from appointment");
                            while(rs.next())
                            {
                               %> 
                               <tr>  
                               <td><%=rs.getInt("appointment_id")%></td>
                               <td><%=rs.getString("date")%></td>
                               <td><%=rs.getString("time")%></td>
                               <td><%=rs.getString("doctor_name")%></td>
                               <td><%=rs.getString("patient_id")%></td>
                               <td><%=rs.getString("patient_name")%></td>
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
