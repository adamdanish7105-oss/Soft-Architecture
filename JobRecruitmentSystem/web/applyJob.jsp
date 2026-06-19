<%-- 
    Document   : applyJob
    Created on : 6 Jun 2026, 12:29:17 pm
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Apply Job</title>
    </head>

    <body style="
          background:#f4f6f9;
          font-family:Arial;">

        <div style="
             width:500px;
             margin:50px auto;
             background:white;
             padding:30px;
             border-radius:10px;
             box-shadow:0 0 10px gray;">

            <h2 style="
                text-align:center;
                color:#34495e;">
                Apply Job
            </h2>

            <form action="applyJob"
                  method="post">

                <label>User ID</label>

                <input type="number"
                       name="userId"

                       style="
                       width:100%;
                       padding:10px;
                       margin-bottom:15px;">

                <label>Job ID</label>

                <input type="number"
                       name="jobId"

                       style="
                       width:100%;
                       padding:10px;
                       margin-bottom:20px;">

                <button type="submit"

                        style="
                        width:100%;
                        background:#2980b9;
                        color:white;
                        padding:12px;
                        border:none;
                        border-radius:5px;">

                    Apply Now

                </button>

            </form>

        </div>

    </body>
</html>
