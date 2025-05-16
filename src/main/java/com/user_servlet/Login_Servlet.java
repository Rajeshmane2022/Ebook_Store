package com.user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.dao.UserDAOImpl;
import com.entity.User;

@WebServlet("/Login")
public class Login_Servlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			UserDAOImpl dao = new UserDAOImpl(DBConnection.getConnection());
			HttpSession session = req.getSession();
			
			String email = req.getParameter("email");
			String passWord =req.getParameter("password");
			
			
			if ("admin@gmail.com".equals(email) && "admin".equals(passWord)) {
				
				User user= new User();
				user.setName("Admin");
				session.setAttribute("userObj", user);
				
				resp.sendRedirect("admin/Home.jsp");
				
				
			} else {
				
					User u= dao.login(email, passWord);
					
					if (u != null) {
						
						session.setAttribute("userObj", u);
						resp.sendRedirect("index.jsp");
						
					} else {
						
						session.setAttribute("failedMsg", " Please! Enter valid email or Password.");
						resp.sendRedirect("Login.jsp");
					}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
