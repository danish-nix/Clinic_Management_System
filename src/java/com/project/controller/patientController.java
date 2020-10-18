/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controller;

import com.project.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI PL60
 */
@WebServlet(name = "patientController", urlPatterns = {"/patient.controller"})
public class patientController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List errorMsgs = new LinkedList();
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String sex = request.getParameter("sex");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String country = request.getParameter("country");
            
            //Verification
            if(username == null || name.trim().length()==0)
                errorMsgs.add("This form cannot be empty!");
            if(password == null || password.trim().length()==0)
                errorMsgs.add("This form cannot be empty!");
            if(!cpassword.equals(password) || cpassword.trim().length()==0)
                errorMsgs.add("Password is not same!");
            if(email == null || email.trim().length()==0)
                errorMsgs.add("This form cannot be empty!");
            if(name == null || name.trim().length()==0)
                errorMsgs.add("This form cannot be empty!");
            if(mobile == null || mobile.trim().length()==0)
                errorMsgs.add("This form cannot be empty!");
            
            if(address == null || address.trim().length()==0)
                errorMsgs.add("This form cannot be empty!");
            if(country == null || country.trim().length()==0)
                errorMsgs.add("This form cannot be empty!");
            
            if(!errorMsgs.isEmpty())
            {
                request.setAttribute("errormsgs", errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("/error.jsp");
                view.forward(request,response);
                return;
            }
            
            Connection con=null;
            Statement statement=null;
            ResultSet resultSet = null;
            
            try
            {
                con=DBConnection.createConnection();
                List r = new LinkedList();
                PreparedStatement st1 = con.prepareStatement("select max(id)+1 from patient");
                ResultSet result = st1.executeQuery();
                String id = "";
                while (result.next())
                    id = result.getString(1);             

                if(id==null)
                    id="1";
                
                String sql = "insert into patient(id,username,password,email,name,mobile,address,country,sex) values(?,?,?,?,?,?,?,?,?) ";
         
                PreparedStatement st = con.prepareStatement(sql);
                
                st.setString(1,id);
                st.setString(2,username);
                st.setString(3,password);
                st.setString(4,email);
                st.setString(5,name);
                st.setString(6,mobile);
                st.setString(7,address);
                st.setString(8,country);
                st.setString(9,sex);
                st.executeUpdate();
                st.close();
                con.close();
                
                r.add("\n Profile Created!");  
          request.setAttribute("create",r);
                RequestDispatcher view = request.getRequestDispatcher("/patientLogin.jsp");
                view.forward(request,response);
                
            }catch(SQLException e)
            {
                e.printStackTrace();
                errorMsgs.add("An unexpected error:"+ e.getMessage());
                request.setAttribute("errorMsgs",errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("/error.jsp");
                view.forward(request,response);
            }
        }catch(RuntimeException e)
        {
            errorMsgs.add("An unexpected Error: "+ e.getMessage());
            request.setAttribute("errorMsgs",errorMsgs);
            RequestDispatcher view = request.getRequestDispatcher("/error.jsp");
            view.forward(request,response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
