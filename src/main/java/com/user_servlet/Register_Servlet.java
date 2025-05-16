package com.user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.dao.UserDAO;
import com.dao.UserDAOImpl;
import com.entity.User;

@WebServlet("/register") // connected the Register.jsp page with the help of register which is used in form tag
public class Register_Servlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name"); // the arg passed inside the method is name = "name" from Register.jsp page
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String passWord =req.getParameter("password");
			String checkBox = req.getParameter("checkbox");
			
			User u = new User();
			
			u.setName(name);
			u.setEmail(email);
			u.setPhno(phno);
			u.setPassword(passWord);
			
			HttpSession httpSession = req.getSession();
			
			if (checkBox != null) 
			{
				UserDAOImpl dao = new UserDAOImpl(DBConnection.getConnection());
				boolean b = dao.userRegister(u);
				
				if(b)
				{
					httpSession.setAttribute("successMsg", "Register successfully!");
					resp.sendRedirect("Register.jsp");
				}
				else
				{
					httpSession.setAttribute("failedMsg", "Something wrong on server!!!");
					resp.sendRedirect("Register.jsp");
				}
			} else {
				httpSession.setAttribute("failedMsg", "Please! Agree Terms & Conditions!!!");
				resp.sendRedirect("Register.jsp");

			}
		
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	

}
