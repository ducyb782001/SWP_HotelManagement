/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.User;

/**
 *
 * @author dell
 */
public class UserDAO extends DBContext {

    public User getUserByUidAndPws(String username, String password) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [User] where \n"
                    + "  Email = ? and Password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            Role role = null;
            RoleDAO rDao = new RoleDAO();
            User manager = null;
            if (rs.next()) {
                role = rDao.getRoleByID(rs.getInt("Role"));
                manager = getUserByID(rs.getInt("ManagerID"));
                return new User(rs.getInt("userID"),
                        rs.getString("Full_Name"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        role,
                        manager,
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByID(int userID) {
        try {
            String sql = "SSELECT *\n"
                    + "  FROM [User] where userID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            Role role = null;
            RoleDAO rDao = new RoleDAO();
            User manager = null;
            if (rs.next()) {
                role = rDao.getRoleByID(rs.getInt("Role"));
                manager = getUserByID(rs.getInt("ManagerID"));
                return new User(rs.getInt("userID"),
                        rs.getString("Full_Name"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        role,
                        manager,
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<User> getUserByRole(int roleID) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [User] where Role = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roleID);
            ResultSet rs = stm.executeQuery();
            Role role = null;
            RoleDAO rDao = new RoleDAO();
            User manager = null;
            if (rs.next()) {
                try {
                    role = rDao.getRoleByID(rs.getInt("Role"));
                } catch (Exception e) {
                    role = null;
                }
                manager = getUserByID(rs.getInt("ManagerID"));
                list.add(new User(rs.getInt("userID"),
                        rs.getString("Full_Name"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        role,
                        manager,
                        rs.getBoolean("Status"),
                        rs.getString("Description")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
