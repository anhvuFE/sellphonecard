package dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Product;

public class ProductDAO extends DBContext {

    public void updateAmount(int quantity, Product p) {
        String sql = "UPDATE product\n"
                + "SET amount= ? "
                + (p.getAmount() == quantity?",status=0 ":" ")
                + "WHERE id=?;";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, p.getAmount() - quantity);
            st.setInt(2, p.getId());
            st.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM swp1.product where status !=0 and ExpirationDate"
                + " > ?  order by ExpirationDate;";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setDate(1, new java.sql.Date((new Date()).getTime()));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("Id"),
                        rs.getString("name"),
                        rs.getDouble("SellPrice"),
                        rs.getInt("Amount"),
                        rs.getString("supplier"),
                        rs.getString("image"),
                        rs.getDate("ExpirationDate"),
                        rs.getString("Description"),
                        rs.getDate("createdAt"),
                        rs.getDate("deleteAt"),
                        rs.getBoolean("status"),
                        rs.getString("accountId"),
                        rs.getDate("updateAt"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public static void main(String[] args) {
        ProductDAO pd =new ProductDAO();
        for (Product p : pd.getAllProduct()) {
            System.out.println(p.getExpirationDate());
        }
    }

    int addProduct(Product p, Date expirationDate) {
        String sql = "insert into product (SellPrice,supplier,amount,"
                + "Image,ExpirationDate,Description,createdAt,status)\n"
                + "values(?,?,?,?,?,?,?,?);";
        try ( PreparedStatement st = connection.prepareStatement(sql
        ,Statement.RETURN_GENERATED_KEYS)) {
            st.setDouble(1, p.getSellPrice());
            st.setString(2, p.getSupplier());
            st.setInt(3, 0);
            st.setString(4, p.getImage());
            java.sql.Date sqlExpirationDate = new java.sql.Date(expirationDate.getTime());
            st.setDate(5, sqlExpirationDate);
            st.setString(6, p.getDescription());
            st.setDate(7, new java.sql.Date((new Date()).getTime()));
            st.setBoolean(8, p.isStatus());
            st.execute();
            
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                int productId = rs.getInt(1);
                return productId;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    void updateDateProduct(int productId) {
        String sql = "update product \n"
                + "set updateAt=?\n"
                + "where Id=?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setDate(1, new java.sql.Date((new Date()).getTime()));
            st.setInt(2, productId);
            st.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    int getLastId() {
        String sql = "select Id from product order by id desc limit 1";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    void updateAmountProduct(int productId, int amount) {
        String sql = "update product \n"
                + "set amount=?\n"
                + "where Id=?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, ++amount);
            st.setInt(2, productId);
            st.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    int getAmountById(int productId) {
        String sql = "select amount from product where id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
//    public static void main(String[] args) {
//        ProductDAO pd = new ProductDAO();
//        pd.addProduct(new Product(10, "", 20000, 0, "viettel", "viettel_logo.png", new Date(), "quwenqwe", null, null, false, "", null), new Date());
//    }

    public Product getProductById(String productId) {
        String sql = "SELECT * FROM product where id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            int id = Integer.parseInt(productId);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product(
                        rs.getInt("Id"),
                        rs.getString("name"),
                        rs.getDouble("SellPrice"),
                        rs.getInt("Amount"),
                        rs.getString("supplier"),
                        rs.getString("image"),
                        rs.getDate("ExpirationDate"),
                        rs.getString("Description"),
                        rs.getDate("createdAt"),
                        rs.getDate("deleteAt"),
                        rs.getBoolean("status"),
                        rs.getString("accountId"),
                        rs.getDate("updateAt"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
