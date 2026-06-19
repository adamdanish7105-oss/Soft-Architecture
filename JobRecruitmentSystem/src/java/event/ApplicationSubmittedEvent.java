/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package event;

public class ApplicationSubmittedEvent {

    private int applicationId;

    public ApplicationSubmittedEvent(
        int applicationId){

        this.applicationId=
            applicationId;
    }

    public int getApplicationId() {
        return applicationId;
    }
}
