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
import model.RoomType;
import model.StatusRoom;

/**
 *
 * @author dell
 */
public class StatusRoomDAO extends DBContext {
    
    public StatusRoom getStatusByID(int statusID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Status_Room] where statusID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new StatusRoom(rs.getInt("statusID"),
                        rs.getString("statusName"),
                        rs.getBoolean("deleteFlag"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
