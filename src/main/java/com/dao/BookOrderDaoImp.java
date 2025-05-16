package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.Book_Order;

public class BookOrderDaoImp implements BookOrderDao {

    private Connection conn;

    public BookOrderDaoImp(Connection conn) {
        this.conn = conn;
    }

    // Get the next unique order number
    public int getOrderNo() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM book_order";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count + 1; // Ensure unique order numbers
    }

    @Override
    public boolean saveOrder(List<Book_Order> bList) {
        boolean isSuccess = false;
        try {
            String sql = "INSERT INTO book_order(order_id, user_name, email, address, phone, book_name, author, price, payment_type) VALUES(?, ?, ?, ?, ?,?,?, ?, ?, ?)";

            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);

            for (Book_Order b : bList) {
                ps.setString(1, b.getOrderId());
                ps.setString(2, b.getUsername());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getFullAdd());
                ps.setString(5, b.getPhno());
                ps.setString(6, b.getBookName());
                ps.setString(7, b.getAuthor());
                ps.setString(8, b.getPrice());
                ps.setString(9, b.getPaymentType());
                ps.setString(10, "Pending");
                ps.addBatch();
            }

            int[] count = ps.executeBatch();
            conn.commit();
            isSuccess = count.length > 0;

        } catch (Exception e) {
            try {
                conn.rollback(); // Rollback on failure
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return isSuccess;
    }

    @Override
    public List<Book_Order> getOrdersByUser(String email) {
        List<Book_Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_order WHERE email = ? ORDER BY order_id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Book_Order order = new Book_Order();
                order.setOrderId(rs.getString("order_id"));
                order.setUsername(rs.getString("user_name"));
                order.setEmail(rs.getString("email"));
                order.setFullAdd(rs.getString("address"));
                order.setPhno(rs.getString("phone"));
                order.setBookName(rs.getString("book_name"));
                order.setAuthor(rs.getString("author"));
                order.setPrice(rs.getString("price"));
                order.setPaymentType(rs.getString("payment_type"));
                order.setStatus(rs.getString("status"));  // ✅ Ensure this line is present

                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public List<Book_Order> getAllBook() {
        List<Book_Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_order ORDER BY order_id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Book_Order order = new Book_Order();
                order.setOrderId(rs.getString("order_id"));
                order.setUsername(rs.getString("user_name"));
                order.setEmail(rs.getString("email"));
                order.setFullAdd(rs.getString("address"));
                order.setPhno(rs.getString("phone"));
                order.setBookName(rs.getString("book_name"));
                order.setAuthor(rs.getString("author"));
                order.setPrice(rs.getString("price"));
                order.setPaymentType(rs.getString("payment_type"));
                order.setStatus(rs.getString("status")); 
                
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
    
    @Override
    public boolean updateOrderStatus(String orderId, String status) {
        boolean isUpdated = false;
        try {
            String sql = "UPDATE book_order SET status = ? WHERE order_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, orderId);

            int i = ps.executeUpdate();
            if (i > 0) {
                isUpdated = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }



}
