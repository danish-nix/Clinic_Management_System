<%-- 
    Document   : searchDoctor
    Created on : Jun 26, 2020, 8:34:47 PM
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
        <title>Search Doctor</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <h1>Doctor List</h1>
        <form action="searchDoctor.jsp" method="POST">
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
                            
                  
        <table border="0">
            <!-- column headers -->
            
        </table>
        <div class="ptable">
            <table border="1" cellspacing="0" cellpadding="9">
                <tr>
                    <th>DOCTOR ID</th>
                    <th>DOCTOR NAME</th>
                    <th>DOCTOR CATEGORY</th>
                    <th>DOCTOR GENDER</th>
                </tr>
            <!-- column data -->
            
                  
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
                               <tr>  
                               <td><%=rs.getInt("id")%></td>
                               <td><%=rs.getString("name")%></td>
                               <td><%=rs.getString("speciality")%></td>
                               <td><%=rs.getString("sex")%></td>
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
                 </form>
    </body>
</html>
