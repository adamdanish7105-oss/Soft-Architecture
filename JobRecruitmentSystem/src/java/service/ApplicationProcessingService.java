/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

public class ApplicationProcessingService {

    public String evaluateApplication(
            String resume){

        if(resume.contains("Java")){

            return "SHORTLISTED";
        }

        return "REJECTED";
    }

    public boolean submitApplication(long jobId, long candidateId, String resumePath) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
