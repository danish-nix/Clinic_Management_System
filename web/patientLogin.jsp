<%-- 
    Document   : patientLogin
    Created on : Jul 2, 2020, 6:55:29 PM
    Author     : MSI PL60
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Login</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    
    <body>
        
    
        <h1>Doctor Appointment System</h1><br/>
        
        <form  action="pLoginServlet" method="post" >
            <div class="login">
                <%
            List l=(List)request.getAttribute("errlist");
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
        
    <%
            List r=(List)request.getAttribute("create");
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
              <h1>Patient Login</h1>
              <br><br/>
              
              <div class="logintext">
              <label for="uname"><b>Username</b></label>
              <input type="text" placeholder="Enter Username" name="username" required>
              </div>
              <div class="logintext">
              <label for="psw"><b>Password</b></label>
              <input type="password" placeholder="Enter Password" name="password" required>
              </div>
              
              <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
              </label>
              <br/>New user? Click the link for <br/>
                <a href="PatientForm.jsp" class="pregister" >Sign Up</a>
              <div class="btn">
                  
                  <button id="submit">Login</button>
                  
              </div>
            </div>

            
    </form>
    </body>
</html>

