package dao;

///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package DAO;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//import Model.Category;
//
//public class CategoryDAO extends DBContext {
//
//    //lay toan bo cac ban ghi cua category
//    public List<Category> getAll() {
//        List<Category> list = new ArrayList<>();
//        String sql = "SELECT * FROM Categories";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Category c = new Category();
//                c.setId(rs.getInt("categories_id"));
//                c.setName(rs.getString("categories_name"));
//                c.setUrl_image(rs.getString("cate_url_image"));
//                list.add(c);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//
//    //xoa
//    public void delete(int id) {
//        String sql = "DELETE FROM Categories WHERE categories_id=?";
//
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//
//    //insert
//    public int insert(Category c) {
//        String sql = "INSERT INTO Categories(categories_id, categories_name, cate_url_image) VALUES(?,?,?)";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, c.getId());
//            st.setString(2, c.getName());
//            st.setString(3, c.getUrl_image());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return 0;
//    }
//
//    public Category getCategoryById(int id) {
//        String sql = "SELECT * FROM Categories WHERE categories_id=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Category c = new Category(rs.getInt("categories_id"),
//                        rs.getString("categories_name"),
//                        rs.getString("cate_url_image"));
//                return c;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
//    //update
//    public void update(Category c) {
//        String sql = "UPDATE Categories SET categories_name=?, cate_url_image=? WHERE categories_id=?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, c.getName());
//            st.setString(2, c.getUrl_image());
//            st.setInt(3, c.getId());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//
//    public static void main(String[] args) {
//        CategoryDAO d = new CategoryDAO();
//        List<Category> list = d.getAll();
//        System.err.println(list.get(0).getName());
//    }
//
//}
