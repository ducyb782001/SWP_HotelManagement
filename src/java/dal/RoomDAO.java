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
import model.Room;
import model.RoomType;
import model.StatusRoom;

/**
 *
 * @author Admin
 */
public class RoomDAO extends DBContext {

    public ArrayList<Room> getAllRoomAvailable() {
        ArrayList<Room> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Room] Where status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            RoomType rType = null;
            RoomTypeDAO rTypeDao = new RoomTypeDAO();
            
            StatusRoom rStatus = null;
            StatusRoomDAO sRoomDao = new StatusRoomDAO();
            while (rs.next()) {
                rType = rTypeDao.getTypeByID(rs.getInt("type"));
                rStatus = sRoomDao.getStatusByID(rs.getInt("status"));
                list.add(new Room(rs.getString("roomID"), 
                        rs.getString("roomNumber"),
                        rs.getInt("floor"), 
                        rType,
                        rStatus,
                        rs.getString("description")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
