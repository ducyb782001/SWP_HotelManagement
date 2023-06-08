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

/**
 *
 * @author dell
 */
public class RoomTypeDAO extends DBContext {

    public RoomType getTypeByID(int typeID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Type_Room] where typeId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, typeID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new RoomType(rs.getInt("typeID"),
                        rs.getString("typeName"),
                        rs.getDouble("price"),
                        rs.getBoolean("status"),
                        rs.getString("description"),
                        rs.getInt("Max_people"),
                        rs.getInt("Bed"),
                        rs.getInt("Number_Of_Room"),
                        rs.getInt("Bathroom"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
