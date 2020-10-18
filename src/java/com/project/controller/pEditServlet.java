/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controller;

import com.project.bean.Patient;
import com.project.dao.PatientDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MSI PL60
 */
@MultipartConfig
@WebServlet(name = "pEditServlet", urlPatterns = {"/pEditServlet"})
public class pEditServlet extends HttpServlet {

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
        
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //fetch data
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String sex = request.getParameter("sex");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String country = request.getParameter("country"); 
            int id = Integer.parseInt(request.getParameter("id"));
            
            //get user data from session
            HttpSession s = request.getSession();
            Patient patient = (Patient) s.getAttribute("currentSessionUser");
            patient.setId(id);
            patient.setUserName(username);
            patient.setPassword(password);
            patient.setEmail(email);
            patient.setSex(sex);
            patient.setName(name);
            patient.setMobile(mobile);
            patient.setAddress(address);
            patient.setCountry(country);

            
            //update databse
            PatientDao patientDao = new PatientDao();
            boolean ans = patientDao.updateUser(patient);
            List l = new LinkedList();
            if(ans){
                 l.add("Profile Updated!");  
          request.setAttribute("update",l);
          RequestDispatcher rd= request.getRequestDispatcher("pEditDetails.jsp");
          rd.forward(request,response);
            }else {
                
                RequestDispatcher rd= request.getRequestDispatcher("pEditDetails.jsp");
          rd.forward(request,response);
            }
 
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
