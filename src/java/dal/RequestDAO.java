/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

/**
 *
 * @author dell
 */
public class RequestDAO extends DBContext {

    public void createRequest(String requestID, int customerID) {
        try {
            String sql = "INSERT INTO [Request]\n"
                    + "           ([requestID]\n"
                    + "           ,[CustomerID]\n"
                    + "           ,[Status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,1)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, requestID);
            stm.setInt(2, customerID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int countTotal() {
        try {
            String sql = "SELECT COUNT(*) as 'total'\n"
                    + "  FROM [Request]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
