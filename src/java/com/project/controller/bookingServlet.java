/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controller;

import com.project.bean.Patient;
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
@WebServlet(name = "bookingServlet", urlPatterns = {"/bookingServlet"})
public class bookingServlet extends HttpServlet {

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
            
            
            String doctor = request.getParameter("doctor");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String patientname = request.getParameter("patient_name");
            int patientid = Integer.parseInt(request.getParameter("patient_id"));

            
            Connection con=null;
            Statement statement=null;
            ResultSet resultSet = null;
            try
            {
                con=DBConnection.createConnection();
                
                PreparedStatement st11 = con.prepareStatement("select name from doctor where id="+doctor+"");
                ResultSet result1 = st11.executeQuery();
                String doctorname = "";
                while (result1.next())
                    doctorname = result1.getString(1); 
                
                PreparedStatement st1 = con.prepareStatement("select max(appointment_id)+1 from appointment");
                ResultSet result = st1.executeQuery();
                String id = "";
                while (result.next())
                    id = result.getString(1);   
                
                if(id==null)
                    id="1";

                String sql = "insert into appointment(appointment_id,doctor_id,date,time,patient_name,patient_id,doctor_name) values(?,?,?,?,?,?,?) ";
         
                PreparedStatement st = con.prepareStatement(sql);
                
                st.setString(1,id);
                st.setString(2,doctor);
                st.setString(3,date);
                st.setString(4,time);
                st.setString(5,patientname);
                st.setInt(6,patientid);
                st.setString(7,doctorname);
                st.executeUpdate();
                st.close();
                con.close();
                
                
                RequestDispatcher view = request.getRequestDispatcher("/pbookingList.jsp");
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
