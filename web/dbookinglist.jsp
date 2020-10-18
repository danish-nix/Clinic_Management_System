<%-- 
    Document   : dbookinglist
    Created on : Jun 26, 2020, 8:32:53 PM
    Author     : MSI PL60
--%>


<%@page import="com.project.bean.Doctor"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentSessionUser");
    
    
    %>
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
                        <li><a href='dbookinglist.jsp'>Appointments</a></li>
                        <li><a href='patientList.jsp'>View Patients</a></li>
                        <li><a href='prescription.jsp'>Prescription</a></li>
                        <li><a href='EditDetails.jsp'>My Profile</a></li>
                        <li><a href='logout'>Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <h1>Your Appointments</h1>
        <div>
            <table class="ptable" border="2" cellspacing="0" cellpadding="4">
                <tr>
                    <th>Appointment ID </th>
                    <th>Doctor Name</th>
                    <th>Patient ID</th>
                    <th>Patient Name</th>
                    <th>Date</th>
                    <th>Time<th/>
                </tr>
                    <%
                    String category = request.getParameter("category");
                    try{
                                        
                            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                            Statement stm = con.createStatement();
                            ResultSet rs = stm.executeQuery("select * from appointment where doctor_name='"+doctor.getName()+"'");
                            while(rs.next())
                            {
                               %> 
                               <tr>  
                               <td><%=rs.getInt("appointment_id")%></td>
                               <td><%=rs.getString("doctor_name")%></td>
                               <td><%=rs.getString("patient_id")%></td>
                               <td><%=rs.getString("patient_name")%></td>
                               <td><%=rs.getString("date")%></td>
                               <td><%=rs.getString("time")%></td>
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
