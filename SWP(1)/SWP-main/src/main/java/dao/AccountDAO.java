/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author caoqu
 */
public class AccountDAO {
    
    public List<Account> listAll() {
        List<Account> list = new ArrayList<>();
        try {
            
            String strSelect = "select * from account";
            Connection cnn = (new DBContext()).connection;
            PreparedStatement pstm = cnn.prepareStatement(strSelect);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getDouble(7), rs.getDate(8),
                        rs.getDate(9), rs.getBoolean(10)));
            }
        } catch (Exception e) {
            System.out.println("listAll: " + e.getMessage());
        }
        
        return list;
    }
    
    public boolean checkAccount(String account, String password) {
        try {
            String strSelect = "select * from accounts where Account=? and Password=? ";
            Connection cnn = (new DBContext()).connection;
            PreparedStatement pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, account);
            pstm.setString(2, password);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("listAll: " + e.getMessage());
        }
        return false;
    }
    
    public void updateProfile(String username, String name, String phoneNumber) {
        try {
            String strSelect = "UPDATE account "
                    + "SET Name = ?, PhoneNumber=? "
                    + "WHERE account=?;";
            Connection cnn = (new DBContext()).connection;
            PreparedStatement pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, name);
            pstm.setString(2, phoneNumber);
            pstm.setString(3, username);
            pstm.execute();
            
        } catch (Exception e) {
            System.out.println("updateProfile: " + e.getMessage());
        }
    }
    
    public void updateNewPass(String acc, String password) {
        try {
            String strSelect = "UPDATE account\n"
                    + "SET Password=? \n"
                    + "WHERE Account=? ;";
            Connection cnn = (new DBContext()).connection;
            PreparedStatement pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, password);
            pstm.setString(2, acc);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("updateNewPass: " + e.getMessage());
        }
    }
    
    public Account findAccount(String acc) {
        List<Account> list = listAll();
        for (Account a : list) {
            if (a.getUserName().equals(acc)) {
                return a;
            }
        }
        return null;

//        try {
//            String strSelect = "select * from accounts where username=?";
//            Connection cnn = (new DBContext()).connection;
//            PreparedStatement pstm = cnn.prepareStatement(strSelect);
//            pstm.setString(1, acc);
//            ResultSet rs = pstm.executeQuery();
//            if(rs.next()){
//                return new Account(rs.getString(1), rs.getString(2),
//                        rs.getString(3), rs.getDouble(4), rs.getInt(5),rs.getBoolean(6));
//            }
//        } catch (Exception e) {
//            System.out.println("findAccount: " + e.getMessage());
//        }
    }
    
    public void updateStatusAccount(String username) {
        try {
            String strSelect = "UPDATE account\n"
                    + "SET isActive = 1\n"
                    + "WHERE account=?;";
            Connection cnn = (new DBContext()).connection;
            PreparedStatement pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, username);
            pstm.execute();
            
        } catch (Exception e) {
            System.out.println("updateStatusAccount: " + e.getMessage());
        }
    }
    
    public void addAccount(Account acc) {
        try {
            String strSelect = "insert into account (Account , Password,email,"
                    + "phoneNumber,name,roleId,money,createdAt,isActive)\n"
                    + "value(?,?,?,?,?,?,?,?,?)";
            Connection cnn = (new DBContext()).connection;
            PreparedStatement pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, acc.getUserName());
            pstm.setString(2, acc.getPassword());
            pstm.setString(3, acc.getEmail());
            pstm.setString(4, acc.getPhone());
            pstm.setString(5, acc.getName());
            pstm.setInt(6, acc.getRoleId());
            pstm.setDouble(7, acc.getMoney());
            
            Date d = new Date();
            java.sql.Date createdAt = new java.sql.Date(d.getTime());
            pstm.setDate(8, createdAt);
            pstm.setBoolean(9, acc.isActive());
            pstm.execute();
            
        } catch (Exception e) {
            System.out.println("addAccount: " + e.getMessage());
        }
    }
    
    public void updateMoney(String userName, double total, double money, HttpServletRequest request) {
        try {
            String strSelect = "UPDATE account\n"
                    + "SET money = ?\n"
                    + "WHERE account=?;";
            Connection cnn = (new DBContext()).connection;
            PreparedStatement pstm = cnn.prepareStatement(strSelect);
            pstm.setDouble(1, money - total);
            HttpSession sess = request.getSession();
            Account account = (Account) sess.getAttribute("account");
            account.setMoney(money - total);
            sess.setAttribute("account",account);
            pstm.setString(2, userName);
            pstm.execute();
            
        } catch (Exception e) {
            System.out.println("updateMoney: " + e.getMessage());
        }
    }
}
