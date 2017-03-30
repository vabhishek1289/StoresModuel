/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.store.utility;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author Abhi
 */
public class SQLConnection {
    public static Connection createConnection() {
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/store?zeroDateTimeBehavior=convertToNull","root","");  
             return con;
        } catch (Exception e) {
            System.out.println(""+e);
        }
        return null;        
    }
}
