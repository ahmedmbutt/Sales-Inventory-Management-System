/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ManagementSystem.DBConnection;

import java.sql.*;

/**
 *
 * @author raiwa
 */
public class DBConnection {

    public static Connection connection() {
        Connection conn = null;

        try {

            String dbURL = "jdbc:sqlserver://DESKTOP-U3DPH2O:1433;databaseName=SalesInventoryManagementSystem;userName=cs;password=220";
            conn = DriverManager.getConnection(dbURL);
            return conn;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Oops! Having some problem in connecting with MS SQL Server");
        }
        
        return null;
    }

}
