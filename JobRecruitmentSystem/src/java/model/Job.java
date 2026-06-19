/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Job {

    private int id;
    private String title;
    private String salary;
    private String location;
    private String description;
    private String requirements;
    

    public int getId() {

        return id;

    }

    public void setId(int id) {

        this.id = id;

    }

    public String getTitle() {

        return title;

    }

    public void setTitle(String title) {

        this.title = title;

    }
    
    public String getSalary() {

        return salary;

    }

    public void setSalary(String salary) {

        this.salary = salary;

    }
    
    public String getLocation() {

        return location;

    }

    public void setLocation(String location) {

        this.location = location;

    }

    public String getDescription() {

        return description;

    }

    public void setDescription(String description) {

        this.description = description;

    }

    public String getRequirements() {

        return requirements;

    }

    public void setRequirements(String requirements) {

        this.requirements = requirements;

    }
}
