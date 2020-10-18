<%-- 
    Document   : pbookingList
    Created on : Jun 26, 2020, 8:34:24 PM
    Author     : MSI PL60
--%>
<%@page import="com.project.bean.Patient"%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Patient patient = (Patient) session.getAttribute("currentSessionUser");
    
    
    %>
<html>
    <head>
        <title>Booking List</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript">
        function show_confirm(){
            var r =confirm("Are you sure to cancel the booking?");
            
        }
        
    </script>
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
        <h1>Your Bookings</h1>
        <div>
            <table class="ptable" border="2" cellspacing="0" cellpadding="4">
                <tr>
                    <th>Appointment ID </th>
                    <th>Doctor ID</th>
                    <th>Doctor Name</th>
                    <th>Date</th>
                    <th>Time<th/>
                   
                </tr>
                    <%
                    String category = request.getParameter("category");
                    try{
                                        
                            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                            Statement stm = con.createStatement();
                            ResultSet rs = stm.executeQuery("select appointment_id,doctor_id,doctor_name,date,time from appointment where patient_name='"+patient.getName()+"'");
                            while(rs.next())
                            {
                               %> 
                               <tr>  
                               <td><%=rs.getInt(1)%></td>
                               <td><%=rs.getString(2)%></td>
                               <td><%=rs.getString(3)%></td>
                               <td><%=rs.getString(4)%></td>
                               <td><%=rs.getString(5)%></td>
                               <form action="deleteServlet" method="POST">
                               <td><button type="Submit" onclick="show_confirm()" name="cancel" value="<%=rs.getInt(1)%>">Cancel</button></td>
                               </form>
                               </tr>
                               <%
                                  
                            }
                        }catch(Exception ex){
                            ex.printStackTrace();
                            
                        }              
                 %>    
            </table>
        </div>
    </body>
</html>
