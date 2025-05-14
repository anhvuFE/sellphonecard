package dao;

///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package DAO;
//
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import Model.InforUser;
//
//public class InforUserDAO extends DBContext {
//
//    public InforUser getInforUserByUserName(String username) {
//        String sql = "SELECT `username`, `first_name`, `last_name`, `age`, `phone_number`, `address`, `surplus`, `image` FROM `infor_user` WHERE `username`=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, username);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                InforUser i = new InforUser(rs.getString("username"),
//                        rs.getString("first_name"),
//                        rs.getString("last_name"),
//                        rs.getString("phone_number"),
//                        rs.getString("address"),
//                        rs.getString("image"),
//                        rs.getInt("age"),
//                        rs.getInt("surplus"));
//                return i;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
//    public void updateProfile(InforUser user) {
//
//        String sql = "UPDATE `infor_user` SET `first_name`=?, `last_name`=?, `age`=?, `phone_number`=?, `address`=?, `image`=?, `surplus`=? WHERE `username`=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, user.getFirstname());
//            st.setString(2, user.getLastname());
//            st.setInt(3, user.getAge());
//            st.setString(4, user.getPhonenumber());
//            st.setString(5, user.getAddress());
//            st.setString(6, user.getImage());
//            st.setInt(7, user.getSurplus());
//            st.setString(8, user.getUsername());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//
//    public int insert(InforUser user) {
//        String sql = "INSERT INTO `infor_user` (`username`, `first_name`, `last_name`, `age`, `phone_number`, `address`, `surplus`, `image`) VALUES (?,?,?,?,?,?,?,?)";
//
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, user.getUsername());
//            st.setString(2, user.getFirstname());
//            st.setString(3, user.getLastname());
//            st.setInt(4, user.getAge());
//            st.setString(5, user.getPhonenumber());
//            st.setString(6, user.getAddress());
//            st.setInt(7, user.getSurplus());
//            st.setString(8, user.getImage());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return 0;
//
//    }
//
//}
