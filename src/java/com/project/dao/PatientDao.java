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
import com.project.bean.Patient;
import static com.project.dao.DoctorDao.rs;
import java.sql.*;

   public class PatientDao 	
   {
      static Connection currentCon = null;
      static ResultSet rs = null;  
	
	public boolean updateUser(Patient patient)
        {
            boolean f=false;
            Statement stmt = null; 
            
          try{
              currentCon = DriverManager.getConnection("jdbc:derby://localhost:1527/project","app","app");
              stmt=currentCon.createStatement();
              String query = "update patient set  username = ?, password= ?, email = ?, name = ?,sex=?, mobile = ?, address = ?, country = ? where id=?";
              PreparedStatement st =currentCon.prepareStatement(query);
                st.setString(1, patient.getUsername());
                st.setString(2,patient.getPassword());
                st.setString(3,patient.getEmail());
                st.setString(4,patient.getName());
                st.setString(5,patient.getSex());
                st.setString(5,patient.getMobile());
                st.setString(6,patient.getAddress());
                st.setString(7,patient.getCountry());
                st.setInt(8,patient.getId());
                st.executeUpdate();
                f=true;
          }  catch(Exception e){
              e.printStackTrace();
          }
          return f;
        }
	
      public static Patient login(Patient bean) {
	
         //preparing some objects for connection 
         Statement stmt = null;    
	
         String username = bean.getUsername();    
         String password = bean.getPassword();   
	    
         String searchQuery =
               "select * from patient where username='"
                        + username
                        + "' AND password='"
                        + password
                        + "'";
	    
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
            String sex = rs.getString("sex"); 
            String mobile = rs.getString("mobile");
            String address = rs.getString("address");
            String country = rs.getString("country");
            System.out.println("Welcome " + name);
            bean.setId(id);
            bean.setEmail(email);
            bean.setName(name);
            bean.setSex(sex);
            bean.setMobile(mobile);
            bean.setAddress(address);
            bean.setCountry(country);
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