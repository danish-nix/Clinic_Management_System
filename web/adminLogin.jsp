<%-- 
    Document   : adminLogin
    Created on : Jul 12, 2020, 9:35:13 PM
    Author     : MSI PL60
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    
    <body>
        <script>
function myFunction() {
  alert(You have successfully logout");
}
</script>
        <h1>Doctor Appointment System</h1>
        <form  action="aLoginServlet" method="post" >
            
            <div class="login">
              <h1>Admin Login</h1>
              <br/>
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
              
              <div class="btn">
                  
                  <button id="submit" >Login</button>
                  
              </div>
            </div>

            
    </form>
    </body>
</html>
