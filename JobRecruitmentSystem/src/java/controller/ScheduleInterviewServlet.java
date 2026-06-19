/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.InterviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Interview;
import service.NotificationService;

/**
 *
 * @author DELL
 */
@WebServlet("/scheduleInterview")
public class ScheduleInterviewServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Interview interview =
                new Interview();

        interview.setApplicationId(
                Integer.parseInt(
                        request.getParameter(
                                "applicationId")));

        interview.setInterviewDate(
                request.getParameter(
                        "date"));

        interview.setInterviewTime(
                request.getParameter(
                        "time"));

        InterviewDAO dao =
                new InterviewDAO();

        dao.scheduleInterview(interview);

        NotificationService ns =
                new NotificationService();

        ns.sendNotification(
                "Interview Scheduled");

        response.sendRedirect(
                "success.jsp");
    }

}
