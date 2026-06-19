/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import util.DBConnection;
import model.Job;
import java.sql.*;

public class JobDAO {

    public void addJob(Job job) {
        // Query SQL dikemaskini dengan kolum salary dan location
        String sql = "INSERT INTO jobs(recruiter_id, title, description, required_skills, salary, location) VALUES(?,?,?,?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, 1); // Sementara letak id recruiter = 1, atau ambil dinamik jika sesi ada
            ps.setString(2, job.getTitle());
            ps.setString(3, job.getDescription());
            ps.setString(4, job.getRequirements()); // Diambil dari model, disimpan ke required_skills
            ps.setString(5, job.getSalary());
            ps.setString(6, job.getLocation());
            ps.setString(7, "ACTIVE"); // Status default pekerjaan

           int rowsInserted = ps.executeUpdate();
            System.out.println("====== DEBUG JOBDAO: Rows inserted = " + rowsInserted + " ======");

        } catch (Exception e) {
            System.out.println("====== DEBUG JOBDAO ERROR ======");
            e.printStackTrace(); // Ini akan memaparkan ralat sebenar di konsol NetBeans jika gagal
        }
    }
}
