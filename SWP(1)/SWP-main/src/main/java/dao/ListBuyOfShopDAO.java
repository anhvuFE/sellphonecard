package dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ListBuyOfShopDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM product order by ExpirationDate,Supplier;";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setSellPrice(rs.getDouble("SellPrice"));
                p.setAmount(rs.getInt("Amount"));
                p.setExpirationDate(rs.getDate("ExpirationDate"));
                p.setSupplier(rs.getString("Supplier"));
                p.setDescription(rs.getString("Description"));
                p.setCreatedAt(rs.getDate("createdAt"));
                p.setStatus(rs.getBoolean("status"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Product> getAllSupplier() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT distinct Supplier,image FROM product";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setSupplier(rs.getString("Supplier"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    

}
