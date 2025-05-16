package com.dao;

import java.util.List;

import com.entity.Book_Order;
import com.entity.Cart;

public interface BookOrderDao {
	
	public int getOrderNo();
	
	public boolean saveOrder(List<Book_Order> b);
	
	public  List<Book_Order> getAllBook();
	
	  public boolean updateOrderStatus(String orderId, String status) ;
	  public List<Book_Order> getOrdersByUser(String email);
}
