]]<%-- 
    Document   : PatientForm
    Created on : Jun 25, 2020, 9:25:06 PM
    Author     : MSI PL60
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
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
        <div class="register">
            <form name="registerForm" action="patient.controller" style="border:1px solid #ccc" method="POST">
                
                  <h1>Sign Up</h1>
                  <p>Patient Registration Form</p>
                  
                  <label for="username"> <b>Username</b></label>
                  <input type="text" placeholder="Enter Username" name="username" required><br/><br/>

                  <label for="password"><b>Password</b></label>
                  <input type="password" placeholder="Enter Password" name="password" required>

                  <label for="confirm-psw"><b>Confirm Password</b></label>
                  <input type="password" placeholder="Confirm Password" name="cpassword" required><br/><br/>
                  
                  <label for="email"><b>Email</b></label>
                  <input type="text" placeholder="Enter Email" name="email" required><br/><br/>
                  
                  <b>Name</b>
                  <input type="text" placeholder="Enter Name" name="name" required>

                  <label for="mobile"><b>Mobile No.</b></label>
                  <input type="text" placeholder="0123456789" name="mobile" required><br/><br/>
                  
                  <label for="sex"><b>Sex</b></label>
                  <select id="sex" name="sex">
                      <option value="Male">Male</option>
                      <option value="Female">Female</option>
                  </select><br/><br/>
                  
                  <label for="address"><b>Address</b></label>
                  <input type="text" placeholder="address" name="address" required>
                  
                  <label for="country"><b>Country</b></label>
                  <input type="text" placeholder="country" name="country" required><br/><br/>

                  <div class="clearfix">
                      <a href="patientLogin.jsp">
                          <button type="button" class="cancelbtn">Cancel</button></a>
                    <button type="submit" class="signupbtn">Sign Up</button>
                  </div>
            </form>
            </div>
    </body>
</html>
