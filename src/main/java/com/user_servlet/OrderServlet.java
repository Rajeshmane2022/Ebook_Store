package com.user_servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.DBConnection;
import com.dao.BookOrderDaoImp;
import com.dao.CartDaoImpl;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phone");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("paymentType");

			// Full Address
			String fullAdd = address + ", " + landmark + ", " + city + ", " + state + " - " + pincode;

			// Fetch Cart Items
			CartDaoImpl cartDao = new CartDaoImpl(DBConnection.getConnection());
			List<Cart> cartList = cartDao.getBookByUser(id);

			// Create Order List
			BookOrderDaoImp orderDao = new BookOrderDaoImp(DBConnection.getConnection());
			int orderNumber = orderDao.getOrderNo();
			List<Book_Order> orderList = new ArrayList<>();

			for (Cart c : cartList) {
				Book_Order order = new Book_Order(); // Create new object for each order
				order.setOrderId("ORDER-" + orderNumber);
				order.setUsername(name); // Set the username
				order.setEmail(email);
				order.setPhno(phno);
				order.setFullAdd(fullAdd); // Set full address
				order.setBookName(c.getBookName());
				order.setAuthor(c.getAuthor());
				order.setPrice(String.valueOf(c.getPrice()));
				order.setPaymentType(paymentType);

				orderList.add(order);
				orderNumber++;
			}

			// Save Order
			boolean orderSaved = orderDao.saveOrder(orderList);

			// Redirect Based on Success
			if (!"noSelect".equals(paymentType) && orderSaved) {
				resp.sendRedirect("order_success.jsp");
			} else {
				resp.sendRedirect("checkOut.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("checkOut.jsp"); // Redirect to checkout in case of error
		}
	}
}
