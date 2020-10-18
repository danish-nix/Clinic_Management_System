<%-- 
    Document   : DoctorForm
    Created on : Jun 25, 2020, 9:53:14 PM
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
    </head>
    <body>
        <div class="register">
            <form name="DoctorForm" action="doctor.controller" style="border:1px solid #ccc" method="POST">
                
                  <h1>Sign Up</h1>
                  <p>Doctor Registration Form</p>
                  <hr>
                  
                  <label for="username"> <b>Username</b></label>
                  <input type="text" placeholder="Enter Username" name="username" required><br/><br/>

                  <label for="password"><b>Password</b></label>
                  <input type="password" placeholder="Enter Password" name="password" required>

                  <label for="confirm-psw"><b>Confirm Password</b></label>
                  <input type="password" placeholder="Confirm Password" name="pconfirm" required><br/><br/>
                  
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
                  <input type="text" placeholder="adress" name="address" required>
                  
                  <label for="country"><b>Country</b></label>
                  <input type="text" placeholder="country" name="country" required><br/><br/>
                  
                  <label for="Speciality"><b>Specialty</b></label>
                  <select id="speciality" name="speciality">
                      <option value="Cardiologist">Heart</option>
                      <option value="Neurologist">Neurologist</option>
                      <option value="Dentist">Dentist</option>
                      <option value="Bone">Bone</option>
                  </select><br/><br/>
                  
                  <div class="clearfix">
                    <a href="patientLogin.jsp">
                          <button type="button" class="cancelbtn">Cancel</button></a>
                    <button type="submit" class="signupbtn">Sign Up</button>
                  </div>
                
            </form>
            </div>
    </body>
</html>