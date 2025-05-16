package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	
	private Connection con;
	
	
	public UserDAOImpl(Connection con) {
		super();
		this.con = con;
		// TODO Auto-generated constructor stub
	}


	@Override
	public boolean userRegister(User user) {
		
		boolean f  = false;
		
		try {
			String sql = "INSERT INTO User (name, email, phno, password) values(?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getName() );
			ps.setString(2, user.getEmail() );
			ps.setString(3, user.getPhno());
			ps.setString(4, user.getPassword() );
			
			int i = ps.executeUpdate();
			if(i==1)
			{
				f= true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public User login(String email, String password) 
	{ User user = null;
	
		try {
				String query = "select* from user where email=? and password=?";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, email);
				ps.setString(2, password);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					user = new User();
					user.setId(rs.getInt(1));
					user.setName(rs.getString(2));
					user.setEmail(rs.getString(3));
					user.setPhno(rs.getString(4));
					user.setPassword(rs.getString(5));
					user.setAddress(rs.getString(6));
					user.setLandmark(rs.getString(7));
					user.setCity(rs.getString(8));
					user.setState(rs.getString(9));
					user.setPincode(rs.getString(10));
				}
					
		} catch (Exception e) {
	}
		return  user;
	}


	@Override
	public boolean checkPassword(int userId, String password) {
	    boolean isValid = false;
	    try {
	        String query = "SELECT password FROM user WHERE id=?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            String storedPassword = rs.getString("password");
	            if (storedPassword.equals(password)) {
	                isValid = true;  // Password matches
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isValid;
	}

}











