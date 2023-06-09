/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class Request_RoomDAO extends DBContext {

    public void createRequestRoom(String requestID, String roomID, Date checkIn, Date checkOut) {
        try {
            String sql = "INSERT INTO [dbo].[Request_Room]\n"
                    + "           ([RequestID]\n"
                    + "           ,[RoomID]\n"
                    + "           ,[CheckIn]\n"
                    + "           ,[CheckOut])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, requestID);
            stm.setString(2, roomID);
            stm.setDate(3, checkIn);
            stm.setDate(4, checkOut);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
