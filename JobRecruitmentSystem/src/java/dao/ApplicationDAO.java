/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Application;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ApplicationDAO {

    public boolean submitApplication(Application application) {

        boolean success = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "INSERT INTO applications(user_id, job_id, status) VALUES(?,?,?)";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, application.getUserId());
            ps.setInt(2, application.getJobId());
            ps.setString(3, application.getStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                success = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
}
