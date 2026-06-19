/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.NotificationService;
import service.ApplicationProcessingService;
/**
 *
 * @author DELL
 */

@WebServlet("/ApplyJobServlet")
public class ApplyJobServlet extends HttpServlet {

    // 3. FIXED: Declared and initialized the service variable
    private final ApplicationProcessingService applicationProcessingService = new ApplicationProcessingService();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ApplyJobServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyJobServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Grab form fields submitted from candidate UI layer
        long jobId = Long.parseLong(request.getParameter("jobId"));
        long candidateId = Long.parseLong(request.getParameter("candidateId"));
        String resumePath = request.getParameter("resumePath");

        // Fast execution pipeline handoff
        boolean success = applicationProcessingService.submitApplication(jobId, candidateId, resumePath);

        if (success) {
            response.sendRedirect("dashboard.jsp?status=success");
        } else {
            response.sendRedirect("dashboard.jsp?status=duplicate_or_failed");
        } // 4. FIXED: Properly closed the else block
    } // 4. FIXED: Properly closed the doPost method

    /**
     * Returns a short description of the servlet.
     */
    @Override
    public String getServletInfo() {
        return "Handles job application processing updates asynchronously.";
    }
}

