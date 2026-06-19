<%-- 
    Document   : jobs
    Created on : 6 Jun 2026, 12:28:10 pm
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Create Job Vacancy</title>

        
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
                font-family:'Segoe UI',sans-serif;
            }

            body{
                background:#f4f6f9;
                display:flex;
                justify-content:center;
                align-items:center;
                min-height:100vh;
            }

            .container{
                width:700px;
                background:#fff;
                padding:35px;
                border-radius:12px;
                box-shadow:0 8px 20px rgba(0,0,0,0.1);
            }

            h2{
                text-align:center;
                margin-bottom:25px;
                color:#2c3e50;
            }

            .form-group{
                margin-bottom:18px;
            }

            label{
                display:block;
                font-weight:600;
                margin-bottom:8px;
                color:#34495e;
            }

            input,
            textarea{
                width:100%;
                padding:12px;
                border:1px solid #dcdde1;
                border-radius:6px;
                font-size:14px;
            }

            textarea{
                resize:vertical;
            }

            .btn{
                width:100%;
                background:#27ae60;
                color:white;
                padding:14px;
                border:none;
                border-radius:6px;
                font-size:16px;
                font-weight:bold;
                cursor:pointer;
            }

            .btn:hover{
                background:#219150;
            }
        </style>
        

    </head>

    <body>

        <div class="container">

            
            <h2>Create Job Vacancy</h2>

            <form action="createJob" method="post">

                <div class="form-group">
                    <label>Job Title</label>
                    <input type="text" name="title" required>
                </div>

                <div class="form-group">
                    <label>Salary</label>
                    <input type="text" name="salary" required>
                </div>

                <div class="form-group">
                    <label>Location</label>
                    <input type="text" name="location" required>
                </div>

                <div class="form-group">
                    <label>Job Description</label>
                    <textarea name="description" rows="5" required></textarea>
                </div>

                <div class="form-group">
                    <label>Requirements</label>
                    <textarea name="requirements" rows="4" required></textarea>
                </div>

                <button type="submit" class="btn">
                    Create Job
                </button>

            </form>
            

        </div>

    </body>
</html>


