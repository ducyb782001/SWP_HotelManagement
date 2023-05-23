/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Room;
import model.RoomTypes;

/**
 *
 * @author Admin
 */
public class RoomDAO extends DBContext {

    /**
     *
     * @return
     */
    public ArrayList<Room> getAllRoom() {

        try {
            String sql = "select * from Roo";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<Room> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getString(12)));;

            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @param checkin
     * @param checkout
     * @return
     */
    public int getDay(String checkin, String checkout) {
        try {
            String sql = "SELECT DATEDIFF(day, ?, ?) AS DateDiff;";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setString(1, checkin);
            ps.setString(2, checkout);
            ps.executeQuery();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    /**
     *
     * @param price
     * @return
     */
    public ArrayList<RoomTypes> searchByPrice(double price) {

        try {
            String sql ="select * from RoomTypes where RoomTypes.price < ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setDouble(1, price);
            ResultSet rs = ps.executeQuery();

            ArrayList<RoomTypes> listbyprice = new ArrayList<>();
            while (rs.next()) {
                listbyprice.add(new RoomTypes(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));
                       

            }
            return listbyprice;
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @param index
     * @return
     */
    public ArrayList<RoomTypes> searchRoom(String index) {

        try {
            String sql = "select RoomTypes.*,Rooms.RoomNo,Rooms.[Type],Rooms.[Availability]\n"
                    + "                    from RoomTypes left join Rooms\n"
                    + "                    on RoomTypes.TypeID = Rooms.TypeID\n"
                    + "                    where RoomTypes.price like ? or RoomTypes.Beds like ? or RoomTypes.[service] like ? or RoomTypes.MaxOccupancy like ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + index + "%");
            ps.setString(2, "%" + index + "%");
            ps.setString(3, "%" + index + "%");
            ps.setString(4, "%" + index + "%");

            ResultSet rs = ps.executeQuery();

            ArrayList<RoomTypes> listsearch = new ArrayList<>();
            while (rs.next()) {
                listsearch.add(new RoomTypes(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));

            }
            return listsearch;
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @return
     */
    public ArrayList<Room> CheckRoomAvail() {

        try {
            String sql = "select RoomTypes.*,Rooms.RoomNo,Rooms.[Type],Rooms.[Availability]\n"
                    + "  from RoomTypes left join Rooms\n"
                    + "  on RoomTypes.TypeID = Rooms.TypeID\n"
                    + "	where [Availability] = 'Valid'";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<Room> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getString(12)));;

            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @param roomno
     * @return
     */
    public Room getRoomByRoomNo(int roomno) {

        try {
            String sql = " select RoomTypes.*,Rooms.RoomNo,Rooms.[Type],Rooms.[Availability]\n"
                    + "                    from RoomTypes left join Rooms\n"
                    + "                    on RoomTypes.TypeID = Rooms.TypeID\n"
                    + "					where RoomNo = ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, roomno);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getString(12));

            }

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @param roomno
     */
    public void delete(int roomno) {
        try {
            String sql = "delete from Rooms where RoomNo =?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, roomno);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     *
     * @param typeId
     * @param roomNo
     * @param type
     */
    public void updateRoom(int typeId, int roomNo, String type) {
        try {
            String sql = "update Rooms\n"
                    + "  set TypeID = ?,[Type] = ?\n"
                    + "  where RoomNo = ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, typeId);
            ps.setString(2, type);

            ps.setInt(3, roomNo);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     *
     * @param roomNo
     */
    public void setAvaiRoom(int roomNo) {
        try {
            String sql = " update Rooms\n"
                    + "  set [Availability] = 'InValid'\n"
                    + "  where RoomNo = ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, roomNo);   
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     *
     * @param roomNo
     */
    public void setAvaiRoomInValid(int roomNo) {
        try {
            String sql = " update Rooms\n"
                    + "  set [Availability] = 'Valid'\n"
                    + "  where RoomNo = ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, roomNo);   
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     *
     * @param typeId
     * @param name
     * @param bed
     * @param maxOccupa
     * @param price
     * @param service
     * @param image
     * @param details
     */
    public void updateRoomType(int typeId, String name, String bed, int maxOccupa, double price, String service, String image, String details) {
        try {
            String sql = "update RoomTypes set [Name] = ?, Beds = ?, MaxOccupancy=?, price = ?,[service]=?,[image] = ?,details=? where TypeID = ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, bed);

            ps.setInt(3, maxOccupa);
            ps.setDouble(4, price);
            ps.setString(5, service);
            ps.setString(6, image);
            ps.setString(7, details);
            ps.setInt(8, typeId);

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     *
     * @param typeid
     * @param type
     */
    public void addRoom(int typeid, String type) {
        try {
            String sql = "insert into Rooms values(?,?,'Valid')";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, typeid);
            ps.setString(2, type);

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public void addRoomTypes(RoomTypes rt) {
//        try {
//            String sql = "insert into RoomTypes values(?,?,?,?,?,?,?,?)";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, rt.getName());
//            ps.setString(2, rt.getBed());
//            ps.setInt(3, rt.getNumberRoom());
//            ps.setInt(4, rt.getMaxOccupancy());
//            ps.setDouble(5, rt.getPrice());
//            ps.setString(6, rt.getService());
//            ps.setString(7, rt.getImage());
//            ps.setString(8, rt.getDetails());
//            ps.executeUpdate();
//
//        } catch (SQLException ex) {
//            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }

    /**
     *
     * @return
     */

    public ArrayList<RoomTypes> getRoomType() {

        try {
            String sql = "select TypeID,[Name] from RoomTypes";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<RoomTypes> listRT = new ArrayList<>();
            while (rs.next()) {
                listRT.add(new RoomTypes(rs.getInt(1),
                        rs.getString(2)));

            }
            return listRT;
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @return
     */
    public ArrayList<RoomTypes> getAllRoomType() {

        try {
            String sql = "select * from RoomTypes";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<RoomTypes> listRoomType = new ArrayList<>();
            while (rs.next()) {
                listRoomType.add(new RoomTypes(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));

            }
            return listRoomType;
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @param typeId
     * @return
     */
    public RoomTypes getRoomTypeById(int typeId) {

        try {
            String sql = "select * from RoomTypes where TypeID = ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, typeId);
            ResultSet rs = ps.executeQuery();

            
            while (rs.next()) {
                return new RoomTypes(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));

            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        RoomDAO a = new RoomDAO();
//        ArrayList<Room> room = a.getAllRoom();
        ArrayList<RoomTypes> rt = a.searchByPrice(100);
        System.out.println(rt);
//        ArrayList<RoomTypes> at = a.getRoomTypeById(1);
//        ArrayList<Room> r = a.CheckRoomAvail();
////        for (Room room1 : r) {
////            System.out.println(room1);
////            
////        }
////        for (Room room1 : room) {
////            System.out.println(room1);
////        }
////        for (RoomTypes roomTypes : rt) {
////            System.out.println(roomTypes);
////
////        }
////        for (RoomTypes elem : at) {
////            System.out.println(elem);
////
////        }
//        System.out.println(a.getDay("2023/08/01", "2023/08/03"));
//
//    }

}
    }
