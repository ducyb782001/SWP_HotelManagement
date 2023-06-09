/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class Request_StaffDAO extends DBContext{

    public void createRequest(String requestID, int staffID) {
        try {
            String sql = "INSERT INTO [Request_Staff]\n"
                    + "           ([requestID]\n"
                    + "           ,[staffID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, requestID);
            stm.setInt(2, staffID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
