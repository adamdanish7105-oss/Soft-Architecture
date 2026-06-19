/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Interview;
import util.DBConnection;

import java.sql.*;

public class InterviewDAO {

    public boolean scheduleInterview(
            Interview interview){

        boolean success = false;

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "INSERT INTO interviews(application_id,interview_date,interview_time) VALUES(?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(
                    1,
                    interview.getApplicationId());

            ps.setString(
                    2,
                    interview.getInterviewDate());

            ps.setString(
                    3,
                    interview.getInterviewTime());

            int rows =
                    ps.executeUpdate();

            success = rows > 0;

        }catch(Exception e){

            e.printStackTrace();
        }

        return success;
    }
}