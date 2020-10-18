/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.util;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author MSI PL60
 */
public class DBConnection {
    
    public static Connection createConnection()
    {
        Connection con = null;
        String url = "jdbc:derby://localhost:1527/project";
        String username = "app";
        String password = "app";
        
        try
        {
         try
         {
             Class.forName("org.apache.derby.jdbc.ClientDriver");
         }
         catch(ClassNotFoundException e)
         {
             e.printStackTrace();
         }
         con = DriverManager.getConnection(url,username,password);
         System.out.println("Printing connection object "+con);
         
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
