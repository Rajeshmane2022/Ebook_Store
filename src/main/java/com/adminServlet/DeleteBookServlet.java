package com.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.dao.BooksDaoImpl;

@WebServlet("/delete")
public class DeleteBookServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			int id  = Integer.parseInt(req.getParameter("id"));
			
			 BooksDaoImpl dao = new BooksDaoImpl(DBConnection.getConnection());
			 boolean f = dao.deleteBook(id);
			 
			 HttpSession session = req.getSession();
			 
			 if (f) 
			 {
				session.setAttribute("SuccessMsg", "Books deleted successfully");
				resp.sendRedirect("admin/allBooks.jsp");
			}
			 else
			 {
				 session.setAttribute("FailedMsg", "Something went wrong on server");
					resp.sendRedirect("admin/allBooks.jsp");
				}
			 
			
		} catch (Exception e) {
			e.printStackTrace();	
			}
	
	}

}
