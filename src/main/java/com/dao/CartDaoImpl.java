package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnection;
import com.entity.BookDetails;
import com.entity.Cart;

public class CartDaoImpl implements CartDao {
	
	private Connection conn;
	
	public CartDaoImpl(Connection conn)
	{
		this.conn = conn;
	}

	public boolean addCart(Cart c) {
		boolean f = false;
		
		try {
			String sql = "INSERT INTO cart ( bid, uid, bookName, author, price, totalPrice) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

	        // Setting values from Cart object
	        ps.setInt(1, c.getBid());
	        ps.setInt(2, c.getUid());
	        ps.setString(3, c.getBookName());
	        ps.setString(4, c.getAuthor());
	        ps.setDouble(5, c.getPrice());
	        ps.setDouble(6, c.getTotalPrice());
	        
	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true; // Record inserted successfully
	        }
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return f;
	}

	@Override
	public List<Cart> getBookByUser(int userId) {
	    List<Cart> cartList = new ArrayList<>();
	    double totalPrice = 0.0;

	    try {
	        String sql = "SELECT * FROM cart WHERE uid = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) { // Fetch all books for the user
	            Cart cart = new Cart();
	            cart.setCid(rs.getInt(1));         // cid
	            cart.setBid(rs.getInt(2));         // bid
	            cart.setUid(rs.getInt(3));         // uid
	            cart.setBookName(rs.getString(4)); // bookName
	            cart.setAuthor(rs.getString(5));   // author
	            cart.setPrice(rs.getDouble(6));    // price
	            cart.setTotalPrice(rs.getDouble(7)); // Set totalPrice from DB

	            totalPrice += rs.getDouble(7); // Accumulate total price separately

	            cartList.add(cart); // Add cart object to the list
	        }

	        // Update the total price for all cart items
	        for (Cart c : cartList) {
	            c.setTotalPrice(totalPrice);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return cartList;
	}

	@Override
	public boolean deleteBook(int cid, int userId) { // Use cid instead of bid
	    boolean f = false;
	    try {
	        String sql = "DELETE FROM cart WHERE cid=? AND uid=?"; // Use cid for deletion
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, cid);
	        ps.setInt(2, userId);
	        
	        int i = ps.executeUpdate();
	        if (i > 0) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}





}
