/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Reservation;
import model.ReservationDetail;
import model.RoomTypes;

/**
 *
 * @author Admin
 */
public class ReservationDAO extends DBContext {

//    public ArrayList<ReservationDetail> getAllResvervation() {
//        try {
//            String sql = "  select Reservations.*, ReservationDetails.RoomNo,ReservationDetails.TotalAmount,ReservationDetails.SpecialRequests\n"
//                    + "                    from ReservationDetails left join Reservations\n"
//                    + "                    on ReservationDetails.ReservationID = Reservations.ReservationID";
//            PreparedStatement ps;
//            ps = connection.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//
//            ArrayList<ReservationDetail> listReservationdt = new ArrayList<>();
//            while (rs.next()) {
//                listReservationdt.add(new ReservationDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getDouble(9), rs.getString(10)));
//            }
//            return listReservationdt;
//        } catch (SQLException ex) {
//            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }

    /**
     *
     * @return
     */

    public Reservation getLastResvervation() {
        try {
            String sql = " select top 1 * from Reservations\n"
                    + "  order by ReservationID desc";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Reservation(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),rs.getInt(5),rs.getString(6), rs.getString(7),rs.getString(8), rs.getString(9));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @param resId
     * @param roomNo
     * @param totalAmount
     * @param specialRequests
     */
    public void insertReservationDetails(int resId, int roomNo, double totalAmount, String specialRequests) {
        try {
            String sql = "insert into ReservationDetails values (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, resId);
            ps.setInt(2, roomNo);

            ps.setDouble(3, totalAmount);
            ps.setString(4, specialRequests);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public Reservation getAllResvervationByID(int id) {
//        try {
//            String sql = "select * from Reservations where ReservationID = ? ";
//            PreparedStatement ps;
//            ps = connection.prepareStatement(sql);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                return new Reservation(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }

//    public ArrayList<ReservationDetail> getAllResvervationByAcountID(int id) {
//        try {
//            String sql = " select Reservations.*, ReservationDetails.RoomNo,ReservationDetails.TotalAmount,ReservationDetails.SpecialRequests\n"
//                    + "  from ReservationDetails left join Reservations\n"
//                    + "  on ReservationDetails.ReservationID = Reservations.ReservationID\n"
//                    + "  where Reservations.AccountID = ?";
//            PreparedStatement ps;
//            ps = connection.prepareStatement(sql);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            ArrayList<ReservationDetail> listdt = new ArrayList<>();
//
//            while (rs.next()) {
//                listdt.add(new ReservationDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getDouble(9), rs.getString(10)));
//            }
//            return listdt;
//        } catch (SQLException ex) {
//            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }

    /**
     *
     * @param id
     * @param guest
     * @param bookingdate
     * @param checkin
     * @param checkout
     * @param totalday
     * @param roomNumber
     */

    public void insertReservation(int id, int guest, String bookingdate, String checkin, String checkout, int totalday, int roomNumber) {
        try {
            String sql = "insert into Reservations values (?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, guest);
            ps.setString(3,bookingdate);
            ps.setString(4, checkin);
            ps.setString(5, checkout);
            ps.setInt(6, totalday);
            ps.setInt(7, roomNumber);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
}

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        ReservationDAO dao = new ReservationDAO();
        Reservation a = dao.getLastResvervation();
        System.out.println(a);

    }
}
