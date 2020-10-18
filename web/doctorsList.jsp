<%-- 
    Document   : doctorsList
    Created on : Jul 12, 2020, 9:46:37 PM
    Author     : MSI PL60
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/project" user="app" password="app"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doctors List</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript">
        function show_confirm(){
            var r =confirm("Are you sure to delete the doctor?");
            
        }
        
    </script>
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
        <h1>Doctor List</h1>
          <%
            List l=(List)request.getAttribute("add");
            if(l!=null)
            {
                for(Iterator it =l.iterator();it.hasNext();)
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
        <table border="0">
            <!-- column headers -->
            
        </table>
        <div class="ptable">
            <table border="1" cellspacing="0" cellpadding="9">
                <tr>
                    <th>DOCTOR ID</th>
                    <th>DOCTOR USERNAME</th>
                    <th>DOCTOR PASSWORD</th>
                    <th>DOCTOR NAME</th>
                    <th>DOCTOR GENDER</th>
                    <th>DOCTOR EMAIL</th>
                    <th>DOCTOR MOBILE</th>
                    <th>DOCTOR CATEGORY</th>
                    <th>DOCTOR ADDRESS</th>
                    <th>DOCTOR COUNTRY</th>
                    <th>Action</th>
                    
                    
                </tr>
            <!-- column data -->
            
                  
                 <%
                    
                    try{
                                        
                            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
                            Statement stm = con.createStatement();
                            ResultSet rs = stm.executeQuery("select * from Doctor");
                            while(rs.next())
                            {
                               %> 
                               <tr>  
                               <td><%=rs.getInt("id")%></td>
                               <td><%=rs.getString("username")%></td>
                               <td><%=rs.getString("password")%></td>
                               <td><%=rs.getString("name")%></td>
                               <td><%=rs.getString("sex")%></td>
                               <td><%=rs.getString("email")%></td>
                               <td><%=rs.getString("mobile")%></td>
                               <td><%=rs.getString("speciality")%></td>
                               <td><%=rs.getString("address")%></td>
                               <td><%=rs.getString("country")%></td>
                               <form action="deleteDoctorServlet" method="POST">
                                   <input type="hidden" name="doctorid" value="<%=rs.getInt("id")%>">
                                   <td><button type="submit" onclick="show_confirm">DELETE</button></td>
                               </form>
                               </tr>
                               <%
                            }
                        }catch(Exception ex){
                            ex.printStackTrace();
                            out.println("error"+ ex.getMessage());
                        }              
                 %>       
                
            
            </table>
                 <button><a href="DoctorForm.jsp">ADD</a></button>
                 
        </div>
    </body>
</html>
