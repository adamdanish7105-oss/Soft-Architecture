<%-- 
    Document   : workspace
    Created on : 17 Jun 2026, 3:14:14 am
    Author     : radil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, java.sql.*, util.DBConnection, model.User"%>
<%
    // Security Guard: Pastikan sesi pengguna adalah RECRUITER
    HttpSession sess = request.getSession(false);
    User user = (sess != null) ? (User) sess.getAttribute("user") : null;
    
    if (user == null || !"RECRUITER".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    int recruiterId = user.getId();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recruiter Workspace - Job Management</title>
    <style>
        body { font-family: Arial, sans-serif; background: #edf2f7; margin: 0; padding: 20px; }
        .container { max-width: 1100px; margin: 20px auto; }
        .header { display: flex; justify-content: space-between; align-items: center; background: #2c3e50; color: white; padding: 15px 20px; border-radius: 6px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .header h2 { margin: 0; font-size: 20px; }
        .btn-create { background: #27ae60; color: white; text-decoration: none; padding: 10px 15px; border-radius: 4px; font-weight: bold; font-size: 14px; transition: background 0.2s; }
        .btn-create:hover { background: #219653; }
        .logout-link { color: #bdc3c7; text-decoration: none; margin-left: 20px; font-size: 14px; }
        .logout-link:hover { color: white; }
        
        .section-title { color: #2c3e50; margin-top: 30px; margin-bottom: 15px; border-bottom: 2px solid #cbd5e0; padding-bottom: 5px; }
        
        /* Table Styling */
        .table-container { background: white; padding: 20px; border-radius: 6px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); margin-bottom: 30px; overflow-x: auto; }
        table { width: 100%; border-collapse: collapse; text-align: left; }
        th, td { padding: 12px 15px; border-bottom: 1px solid #e2e8f0; }
        th { background: #f8fafc; color: #64748b; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px; }
        tr:hover { background-color: #f8fafc; }
        
        /* Status Badges */
        .badge { padding: 4px 8px; border-radius: 12px; font-size: 12px; font-weight: bold; }
        .badge-submitted { background: #e2e8f0; color: #4a5568; }
        .badge-shortlisted { background: #c6f6d5; color: #22543d; }
        .badge-rejected { background: #fed7d7; color: #742a2a; }
        
        .btn-action { background: #2b6cb0; color: white; text-decoration: none; padding: 6px 12px; border-radius: 4px; font-size: 12px; font-weight: bold; }
        .btn-action:hover { background: #2b6cb0; }
        .no-data { text-align: center; color: #94a3b8; padding: 30px; font-style: italic; }
    </style>
</head>
<body>

    <div class="container">
        <!-- HEADER WORKSPACE -->
        <div class="header">
            <div>
                <h2>Recruiter Workspace</h2>
                <span style="font-size: 13px; color: #bdc3c7;">Welcome, <strong><%= user.getName() %></strong> (ID: <%= recruiterId %>)</span>
            </div>
            <div>
                <!-- Tambah kerja baru-->
                <a href="jobs.jsp" class="btn-create">+ Post New Job</a>
                <a href="login.jsp" class="logout-link">Logout</a>
            </div>
        </div>

        <%-- Paparan alert jika baru lepas tambah kerja --%>
        <% if("success".equals(request.getParameter("status"))) { %>
            <div style="background: #c6f6d5; color: #22543d; padding: 12px; border-radius: 4px; margin-top: 15px; font-weight: bold;">
                ✓ Job vacancy successfully posted and published!
            </div>
        <% } %>

        <!-- SEKSYEN 1: SENARAI KERJA YANG TELAH DIWUJUDKAN OLEH RECRUITER -->
       <h3 class="section-title">Your Active Job Postings</h3>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Job ID</th>
                        <th>Job Title</th>
                        <th>Salary</th>
                        <th>Location</th>
                        <th>Requirements</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Menggunakan required_skills menggantikan requirements
                        String jobSql = "SELECT id, title, description, required_skills, salary, location FROM jobs ORDER BY id DESC";
                        boolean hasJobs = false;
                        
                        try (Connection conn = DBConnection.getConnection();
                             PreparedStatement psJob = conn.prepareStatement(jobSql);
                             ResultSet rsJob = psJob.executeQuery()) {
                            
                            while (rsJob.next()) {
                                hasJobs = true;
                                int jobId = rsJob.getInt("id");
                                String title = rsJob.getString("title");
                                String desc = rsJob.getString("description");
                                String req = rsJob.getString("required_skills"); // Tukar di sini
                                String salary = rsJob.getString("salary");
                                String location = rsJob.getString("location");
                    %>
                                <tr>
                                    <td><strong>#<%= jobId %></strong></td>
                                    <td style="color: #2b6cb0; font-weight: bold;"><%= title %></td>
                                    <td style="color: #2e7d32; font-weight: bold;"><%= (salary != null) ? salary : "N/A" %></td>
                                    <td><%= (location != null) ? location : "N/A" %></td>
                                    <td><%= (req != null) ? req : "N/A" %></td>
                                    <td style="max-width: 250px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%= desc %></td>
                                </tr>
                    <%
                            }
                            if (!hasJobs) {
                    %>
                                <tr>
                                    <td colspan="6" class="no-data">You haven't posted any jobs yet. Click "+ Post New Job" to begin.</td>
                                </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>


        <!-- SEKSYEN 2: SENARAI PERMOHONAN DARIPADA CALON UNTUK KERJA TERSEBUT -->
        <h3 class="section-title">Received Applications</h3>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Applicant Name</th>
                        <th>Applied Position</th>
                        <th>Submission Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Query JOIN untuk melihat permohonan calon (applications) pada kerja yang wujud (jobs)
                        String appSql = "SELECT u.name AS candidate_name, j.title AS job_title, a.created_at, a.status, a.id AS app_id " +
                                        "FROM applications a " +
                                        "JOIN users u ON a.user_id = u.id " +
                                        "JOIN jobs j ON a.job_id = j.id " +
                                        "ORDER BY a.created_at DESC";
                        
                        boolean hasApplications = false;
                        
                        try (Connection conn = DBConnection.getConnection();
                             PreparedStatement psApp = conn.prepareStatement(appSql);
                             ResultSet rsApp = psApp.executeQuery()) {
                            
                            while (rsApp.next()) {
                                hasApplications = true;
                                String candidateName = rsApp.getString("candidate_name");
                                String jobTitle = rsApp.getString("job_title");
                                Timestamp createdAt = rsApp.getTimestamp("created_at");
                                String status = rsApp.getString("status");
                                int appId = rsApp.getInt("app_id");
                                
                                String badgeClass = "badge-submitted";
                                if ("SHORTLISTED".equals(status)) badgeClass = "badge-shortlisted";
                                if ("REJECTED".equals(status)) badgeClass = "badge-rejected";
                    %>
                                <tr>
                                    <td><strong><%= candidateName %></strong></td>
                                    <td><%= jobTitle %></td>
                                    <td><%= createdAt.toString() %></td>
                                    <td><span class="badge <%= badgeClass %>"><%= status %></span></td>
                                    <td>
                                        <a href="scheduleInterview.jsp?applicationId=<%= appId %>" class="btn-action">Schedule Interview</a>
                                    </td>
                                </tr>
                    <%
                            }
                            if (!hasApplications) {
                    %>
                                <tr>
                                    <td colspan="5" class="no-data">No candidate applications received yet.</td>
                                </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
