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
public class RoleDAO extends DBContext {

    public Role getRoleByID(int roleID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Role] where roleID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roleID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Role(rs.getInt("roleID"),
                        rs.getString("Role_name"),
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
