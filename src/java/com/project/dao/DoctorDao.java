/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.dao;

/**
 *
 * @author MSI PL60
 */
import com.project.bean.Doctor;
import com.project.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.sql.DataSource;

   public class DoctorDao 	
   {
      
      static Connection currentCon = null;
      static ResultSet rs = null; 
      
      
        public boolean updateUser(Doctor doctor)
        {
            boolean f=false;
            Statement stmt = null; 
            
          try{
              currentCon = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
              stmt=currentCon.createStatement();
              String query = "update doctor set  username = ?, password= ?, email = ?, name = ?, mobile = ?, sex = ?, address = ?, country = ?, speciality = ? where id=?";
              PreparedStatement st =currentCon.prepareStatement(query);
                st.setString(1, doctor.getUsername());
                st.setString(2,doctor.getPassword());
                st.setString(3,doctor.getEmail());
                st.setString(4,doctor.getName());
                st.setString(5,doctor.getMobile());
                st.setString(6,doctor.getSex());
                st.setString(7,doctor.getAddress());
                st.setString(8,doctor.getCountry());
                st.setString(9,doctor.getSpeciality());
                st.setInt(10,doctor.getId());
                st.executeUpdate();
                f=true;
          }  catch(Exception e){
              e.printStackTrace();
          }
          return f;
        }
        
      public static Doctor login(Doctor bean) {
	
         //preparing some objects for connection 
         Statement stmt = null;    
	
         String username = bean.getUsername();    
         String password = bean.getPassword();   
	 
         String searchQuery =
               "select * from doctor where username='"
                        + username
                        + "' AND password='"
                        + password
                        +"'";
	    
      // "System.out.println" prints in the console; Normally used to trace the process
      System.out.println("Your user name is " + username);          
      System.out.println("Your password is " + password);
      System.out.println("Query: "+searchQuery);
	    
      try 
      {
         //connect to DB 
         currentCon = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
         stmt=currentCon.createStatement();
         rs = stmt.executeQuery(searchQuery);	        
         boolean more = rs.next();
	       
         // if user does not exist set the isValid variable to false
         if (!more) 
         {
            System.out.println("Sorry, you are not a registered user! Please sign up first");
            bean.setValid(false);
         } 
	        
         //if user exists set the isValid variable to true
         else if (more) 
         {
             int id = rs.getInt("id");
            String name = rs.getString("name");
	    String email = rs.getString("email"); 
            String mobile = rs.getString("mobile");
            String sex = rs.getString("sex");
            String address = rs.getString("address");
            String country = rs.getString("country");
            String speciality = rs.getString("speciality");
            System.out.println("Welcome " + name);
            bean.setId(id);
            bean.setEmail(email);
            bean.setName(name);
            bean.setMobile(mobile);
            bean.setSex(sex);
            bean.setAddress(address);
            bean.setCountry(country);
            bean.setSpeciality(speciality);
            bean.setValid(true);
         }
      } 

      catch (Exception ex) 
      {
         System.out.println("Log In failed: An Exception has occurred! " + ex);
      } 
	    
      //some exception handling
      finally 
      {
         if (rs != null)	{
            try {
               rs.close();
            } catch (Exception e) {}
               rs = null;
            }
	
         if (stmt != null) {
            try {
               stmt.close();
            } catch (Exception e) {}
               stmt = null;
            }
	
         if (currentCon != null) {
            try {
               currentCon.close();
            } catch (Exception e) {
            }

            currentCon = null;
         }
      }

return bean;
	
      }	
   }