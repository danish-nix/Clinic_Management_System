<%-- 
    Document   : prescription
    Created on : Jul 9, 2020, 9:52:59 PM
    Author     : MSI PL60
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.project.bean.Doctor"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prescription</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        
    </head>
    <body>
        <%
    Doctor doctor = (Doctor) session.getAttribute("currentSessionUser");
    
    
    %>
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
        <h1>Prescription</h1>
        <%
            List r=(List)request.getAttribute("update");
            if(r!=null)
            {
                for(Iterator it =r.iterator();it.hasNext();)
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
        <form action="prescServlet" method="POST">
        <label for="category"><b>Appointment ID<b></label><b/><b/>
                  <select name="appointment" id="category" >
                      <option value="0">Select Appointment ID</option>
                      <%
                                    String category = request.getParameter("category");
                                    try{
                                        
                                        Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                                        Statement stm = con.createStatement();
                                        ResultSet rs = stm.executeQuery("select * from appointment where doctor_id="+doctor.getId()+"");
                                        while(rs.next())
                                        {
                                            %>
                                            <option value="<%=rs.getInt("patient_id")%>"                                   
                                                    
                                            ><%=rs.getString("appointment_id")%></option>
                                        <%
                                            }
                                    }catch(Exception ex){
                                        ex.printStackTrace();
                                        out.println("error"+ ex.getMessage());
                                    }
                                    
                                    
                                    %>
 
                  </select><br/><br/>
                  <label for="prescription"> <b>Prescription:</b></label>
                  <input type="text" placeholder="Enter Prescription" name="presc" required><br/><br/> 
                  
                  <button type="Submit" >Submit</button>
                  </form>
     </body>
</html>
