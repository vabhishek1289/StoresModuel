/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.store.data;

/**
 *
 * @author Abhi
 */
public class staff {
    
    private String staff_username;
    private String staff_password;

    public staff() {
    }

    public staff(String staff_username, String staff_password) {
        this.staff_username = staff_username;
        this.staff_password = staff_password;
    }

    public String getStaff_username() {
        return staff_username;
    }

    public String getStaff_password() {
        return staff_password;
    }

    public void setStaff_username(String staff_username) {
        this.staff_username = staff_username;
    }

    public void setStaff_password(String staff_password) {
        this.staff_password = staff_password;
    }

       
}

