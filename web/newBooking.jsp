<%-- 
    Document   : newBooking
    Created on : Jun 26, 2020, 8:33:35 PM
    Author     : MSI PL60
--%>


<%@page import="com.project.bean.Patient"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Patient patient = (Patient) session.getAttribute("currentSessionUser");
    
    
    %>
        
<html>
    <head>
        <title>NewBooking</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
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
            
        <div class="booking">
            <h1>New Booking </h1>
            <form name="registerForm"  style="border:1px solid #ccc" action="newBooking.jsp" method="POST" >
                
                <label for="category"><b>Category<b></label><b/><b/>
                  <select name="category" id="category" onchange="this.form.submit()">
                      <option value="0">Select Category</option>
                      <%
                                    String category = request.getParameter("category");
                                    try{
                                        
                                        Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                                        Statement stm = con.createStatement();
                                        ResultSet rs = stm.executeQuery("select * from Doctor");
                                        while(rs.next())
                                        {
                                            %>
                                            <option  value="<%=rs.getInt("id")%>"
                                                
                                                    <% 
                                                        if(request.getParameter("category")!=null){
                                                            if(rs.getInt("id")==Integer.parseInt(request.getParameter("category"))){
                                                                out.print("selected");
                                                            }
                                                        }
                                                    
                                                    %>
                                                    
                                            ><%=rs.getString("speciality")%></option>
                                        <%
                                            }
                                    }catch(Exception ex){
                                        ex.printStackTrace();
                                        out.println("error"+ ex.getMessage());
                                    }
                                    
                                    
                                    %>
                     
                      
                  </select><br/><br/>
                            
                <label for="choiced" ><b>Doctor<b></label>
                            <select name="doctor">
                                <option >Select Doctor</option>
                                <%
                                    
                                    try{
                                        
                                        Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                                        String query = "select * from doctor where id=?";
                                        PreparedStatement stm = con.prepareStatement(query);
                                        stm.setString(1,request.getParameter("category"));
                                        ResultSet rs = stm.executeQuery();
                                        while(rs.next())
                                        {
                                            %>
                                            <option  value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
                                        <%
                                            }
                                    }catch(Exception ex){
                                        ex.printStackTrace();
                                        out.println("error"+ ex.getMessage());
                                    }
                                    
                                    
                                    %>
                            </select><br/><br/>
                            
                <label for="date"><b>Choose date:<b></label>
                <input type="text" id="datepicker" name="date"><br/><br/>         
                
                <label for="time">Time(Between 9am-5pm):</label>
                <input type="text" name="time" />
                
                    
                <input type="hidden" name="patient_id" value="<%=patient.getId()%>" />
                <input type="hidden" name="patient_name" value="<%=patient.getName()%>" />
                <div class="clearfix">
                    <button type="button" class="cancelbtn">Cancel</button>
                    <button type="submit" onclick="javascript:form.action='bookingServlet';"  class="bookbtn">Book</button>
                </div>                
            </form>                
        </div>
    </body>
</html>

