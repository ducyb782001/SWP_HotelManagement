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

    public ArrayList<Room> getAllRoomAvailable(int offset, int recordsPerPage, int minBed, int minPeople, int minRoom, int minBathRoom, double minPrice, double maxPrice) {
        ArrayList<Room> list = new ArrayList<>();
        try {
            String sql = "Select r.* from Room r\n"
                    + "left join Type_Room tr\n"
                    + "on tr.typeId = r.type\n"
                    + "Where (r.status = 1 and tr.Bed >= ? and tr.Max_people >= ?  \n"
                    + "and tr.Bathroom >= ? and tr.Number_Of_Room >= ?\n"
                    + "and price >= ? and price <= ?)\n"
                    + "order by roomID ASC\n"
                    + "offset ? ROW\n"
                    + "FETCH Next ? Rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, minBed);
            stm.setInt(2, minPeople);
            stm.setInt(3, minBathRoom);
            stm.setInt(4, minRoom);
            stm.setDouble(5, minPrice);
            stm.setDouble(6, maxPrice);
            stm.setInt(7, offset);
            stm.setInt(8, recordsPerPage);
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

    public int getTotalRecords(int status, int minBed, int minPeople, int minRoom, int minBathRoom, double minPrice, double maxPrice) {
        try {
            String sql = "Select COUNT(*) as 'total' from Room r\n"
                    + "left join Type_Room tr\n"
                    + "on tr.typeId = r.type\n"
                    + "Where (r.status = ? and tr.Bed >= ? and tr.Max_people >= ?  \n"
                    + "and tr.Bathroom >= ? and tr.Number_Of_Room >= ?\n"
                    + "and price >= ? and price <= ?)\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, minBed);
            stm.setInt(3, minPeople);
            stm.setInt(4, minBathRoom);
            stm.setInt(5, minRoom);
            stm.setDouble(6, minPrice);
            stm.setDouble(7, maxPrice);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public Room getRoomByID(String roomID) {
        try {
            String sql = "Select r.* from Room r\n"
                    + "left join Type_Room tr\n"
                    + "on tr.typeId = r.type\n"
                    + "Where r.roomID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, roomID);
            ResultSet rs = stm.executeQuery();

            RoomType rType = null;
            RoomTypeDAO rTypeDao = new RoomTypeDAO();

            StatusRoom rStatus = null;
            StatusRoomDAO sRoomDao = new StatusRoomDAO();

            while (rs.next()) {
                rType = rTypeDao.getTypeByID(rs.getInt("type"));
                rStatus = sRoomDao.getStatusByID(rs.getInt("status"));
                return new Room(rs.getString("roomID"),
                        rs.getString("roomNumber"),
                        rs.getInt("floor"),
                        rType,
                        rStatus,
                        rs.getString("description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void bookRoom(String roomID) {
        try {
            String sql = "UPDATE [Room]\n"
                    + "   SET [status] = 5\n"
                    + " WHERE roomID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, roomID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
