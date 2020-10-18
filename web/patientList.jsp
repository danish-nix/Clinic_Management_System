<%-- 
    Document   : patientList
    Created on : Jun 26, 2020, 8:34:09 PM
    Author     : MSI PL60
--%>

<%@page import="com.project.bean.Doctor"%>
<%@page import="java.sql.*"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/project" user="app" password="app"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentSessionUser");
    
    
    %>
<html>
    <head>
        <title>Patient List</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <h1>Patient List</h1>

            
        <table border="0">
            <!-- column headers -->
            
        </table>
        <div class="ptable">
            <table border="1" cellspacing="0" cellpadding="9">
                <tr>
                    <th>PATIENT ID</th>
                    <th>PATIENT NAME</th>
                    <th>PATIENT MOBILE</th>
                    <th>PATIENT ADDRESS</th>
                    <th>PATIENT COUNTRY</th>
                </tr>
            <!-- column data -->
            
                  
                 <%
                    
                    try{
                                        
                            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                            Statement stm = con.createStatement();
                            ResultSet rs = stm.executeQuery("select appointment.appointment_id,patient.name,patient.mobile,patient.address,patient.country from appointment inner join patient on appointment.patient_id=patient.id where doctor_name='"+doctor.getName()+"'");
                            while(rs.next())
                            {
                               %> 
                               <tr>  
                               <td><%=rs.getInt(1)%></td>
                               <td><%=rs.getString(2)%></td>
                               <td><%=rs.getString(3)%></td>
                               <td><%=rs.getString(4)%></td>
                               <td><%=rs.getString(5)%></td>
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
