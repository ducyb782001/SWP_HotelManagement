/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    /**
     *
     * @param user
     * @param pass
     * @return
     */
    public Account login(String user, String pass) {
        try {
            String sql = "select * from Account\n"
                    + "where UserName = ?\n"
                    + "and Password = ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7),rs.getInt(8));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *
     * @param pass
     * @param accountId
     */
    public void updatePass(String pass, int accountId){
        try {
            String sql = "update Account set [Password] =? where AccountID =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setInt(2, accountId);
           

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        
    }

    /**
     *
     * @param user
     * @return
     */
    public Account checkAccountExist(String user) {
        try {
            String sql = "select * from Account\n"
                    + "where UserName = ?\n";

            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setString(1, user);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7),rs.getInt(8));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//        public Account checkAccountById(int accountId) {
//        try {
//            String sql = "select * from Account\n"
//                    + "where AccountID = ?\n";
//
//            PreparedStatement ps;
//            ps = connection.prepareStatement(sql);
//            ps.setInt(1, accountId);
//
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7),rs.getInt(8));
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }

    /**
     *
     * @param account
     */
    public void signup(Account account) {
        try {
            String sql = "    INSERT INTO Account \n"
                    + "	VALUES\n"
                    + "  (?, ?, ?, ?, ?,?, 0);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account.getUserName());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getFullName());
            ps.setString(4, account.getEmail());
            ps.setString(5, account.getTelephone());
            ps.setString(6, account.getCmnd());

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @return
     */
    public ArrayList<Account> getallAccount() {
        try {
            String sql = "select * from Account";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<Account> listA = new ArrayList<>();
            while (rs.next()) {
                listA.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7),rs.getInt(8)));

            }
            return listA;
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    /**
     *
     * @param id
     * @return
     */
    public Account getAccountById(int id) {
        try {
            String sql = "select * from Account where AccountID = ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

           
            while (rs.next()) {
               return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getInt(8));

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
        AccountDAO dao = new AccountDAO();
        
     
        Account a = dao.getAccountById(1);
        System.out.println(a);
//        ArrayList<Account> l = dao.getallAccount();
//        for (Account account : l) {
//            System.out.println(account);
//
//        }
    }

}
