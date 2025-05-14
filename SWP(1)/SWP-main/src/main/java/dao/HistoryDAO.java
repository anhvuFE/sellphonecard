package dao;

///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package DAO;
//
///**
// *
// * @author dell
// */
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import Model.HistoryBuy;
//import Model.Product;
//import Model.Status;
//
//public class HistoryDAO extends DBContext {
//
//    public HistoryBuy getBuyId(int id) {
//        ProductDAO w = new ProductDAO();
//        StatusDAO s = new StatusDAO();
//
//        String sql = "SELECT id, usernamecus, productid, quantity, bill, date, status "
//                + "FROM HistoryBuy "
//                + "WHERE id=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                Product p = w.getProduct(rs.getInt("productid"));
//                Status ste = s.getById(rs.getInt("status"));
//                HistoryBuy pq = new HistoryBuy(
//                        rs.getInt("id"),
//                        rs.getInt("quantity"),
//                        rs.getInt("bill"),
//                        rs.getString("usernamecus"),
//                        rs.getString("date"),
//                        p,
//                        ste);
//                return pq;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
//    public List<HistoryBuy> getAllByUser(String user) {
//        ProductDAO w = new ProductDAO();
//        StatusDAO s = new StatusDAO();
//        List<HistoryBuy> list = new ArrayList<>();
//
//        String sql = "SELECT id, usernamecus, productid, quantity, bill, date, status "
//                + "FROM HistoryBuy "
//                + "WHERE usernamecus=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, user);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Product p = w.getProduct(rs.getInt("productid"));
//                Status ste = s.getById(rs.getInt("status"));
//                HistoryBuy pq = new HistoryBuy(
//                        rs.getInt("id"),
//                        rs.getInt("quantity"),
//                        rs.getInt("bill"),
//                        rs.getString("usernamecus"),
//                        rs.getString("date"),
//                        p,
//                        ste);
//                list.add(pq);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//
//    public List<HistoryBuy> getAll() {
//        ProductDAO w = new ProductDAO();
//        StatusDAO s = new StatusDAO();
//        List<HistoryBuy> list = new ArrayList<>();
//
//        String sql = "SELECT id, usernamecus, productid, quantity, bill, date, status "
//                + "FROM HistoryBuy";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Product p = w.getProduct(rs.getInt("productid"));
//                Status ste = s.getById(rs.getInt("status"));
//                HistoryBuy pq = new HistoryBuy(
//                        rs.getInt("id"),
//                        rs.getInt("quantity"),
//                        rs.getInt("bill"),
//                        rs.getString("usernamecus"),
//                        rs.getString("date"),
//                        p,
//                        ste);
//                list.add(pq);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//
//    public int getIdMax() {
//        String sql = "SELECT MAX(id) as result1 "
//                + "FROM HistoryBuy";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                int i = rs.getInt("result1");
//                return i;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return 0;
//    }
//
//    public int insert(HistoryBuy c) {
//        String sql = "INSERT INTO HistoryBuy (id, usernamecus, productid, quantity, bill, date, status) "
//                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, c.getId());
//            st.setString(2, c.getUsername());
//            st.setInt(3, c.getProduct().getId());
//            st.setInt(4, c.getQuantity());
//            st.setInt(5, c.getBill());
//            st.setString(6, c.getDate());
//            st.setInt(7, c.getStatus().getId());
//            st.executeUpdate();
//            return 1;
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return 0;
//    }
//
//   public void update(HistoryBuy c) {
//    String sql = "UPDATE HistoryBuy "
//            + "SET usernamecus=?, productid=?, quantity=?, bill=?, date=?, status=? "
//            + "WHERE id=?";
//
//    try (PreparedStatement st = connection.prepareStatement(sql)) {
//        st.setString(1, c.getUsername());
//        st.setInt(2, c.getProduct().getId());
//        st.setInt(3, c.getQuantity());
//        st.setInt(4, c.getBill());
//        st.setString(5, c.getDate());
//        st.setInt(6, c.getStatus().getId());
//        st.setInt(7, c.getId());
//
//        st.executeUpdate();
//    } catch (SQLException e) {
//        System.out.println(e);
//    }
//}
//
//public static void main(String[] args) {
//    HistoryDAO his = new HistoryDAO();
//    List<HistoryBuy> e = his.getAll();
//    for (HistoryBuy historyBuy : e) {
//        System.out.println(historyBuy.toString());
//    }
//}
//}
