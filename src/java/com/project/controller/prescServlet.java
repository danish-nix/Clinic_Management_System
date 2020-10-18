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
import java.util.LinkedList;
import java.util.List;
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
@WebServlet(name = "prescServlet", urlPatterns = {"/prescServlet"})
public class prescServlet extends HttpServlet {

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
            String appointmentid = request.getParameter("appointment");
            String presc = request.getParameter("presc");

            
            //Verification
            if(appointmentid == null || appointmentid.trim().length()==0)
                errorMsgs.add("This form cannot be empty!");
            if(presc == null || presc.trim().length()==0)
                errorMsgs.add("This form cannot be empty!");

            Connection con=null;
            Statement statement=null;
            ResultSet resultSet = null;
            
            try
            {
                con=DBConnection.createConnection();
                
                Statement stmt = con.createStatement();
                
                stmt.executeUpdate("update patient set prescription='"+presc+"'where id="+appointmentid+"");
                
                con.close();
                
                List t = new LinkedList();
            
               t.add("Prescription updated!");  
          request.setAttribute("update",t);
                RequestDispatcher view = request.getRequestDispatcher("prescription.jsp");
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
