/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Job;
import dao.JobDAO;

/**
 * @author DELL
 */
@WebServlet("/createJob")
public class CreateJobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("===== CREATE JOB =====");

        System.out.println("Title: " + request.getParameter("title"));
        System.out.println("Salary: " + request.getParameter("salary"));
        System.out.println("Location: " + request.getParameter("location"));
        System.out.println("Description: " + request.getParameter("description"));
        System.out.println("Requirements: " + request.getParameter("requirements"));

        Job job = new Job();

        job.setTitle(request.getParameter("title"));
        job.setDescription(request.getParameter("description"));
        job.setRequirements(request.getParameter("requirements"));
        job.setSalary(request.getParameter("salary"));
        job.setLocation(request.getParameter("location"));

        JobDAO dao = new JobDAO();

        dao.addJob(job);

        response.sendRedirect("workspace.jsp?status=success");
    }
}
System.out.println("Title = " + request.getParameter("title"));
System.out.println("Salary = " + request.getParameter("salary"));
System.out.println("Location = " + request.getParameter("location"));