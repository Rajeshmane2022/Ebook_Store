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
import com.entity.BookDetails;

@WebServlet("/editBooks")
public class EditBooksServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try {
			 int id  = Integer.parseInt(req.getParameter("id"));
			 String bookName= req.getParameter("bookName");
			 String author = req.getParameter("authorName");
			 String price = req.getParameter("price");
			 String status = req.getParameter("bookStatus");
			 
			 
			 BookDetails b= new BookDetails();
			 b.setBookId(id);
			 b.setAuthor(author);
			 b.setBookName(bookName);
			 b.setStatus(status);
			 b.setPrice(price);
			 
			 BooksDaoImpl dao = new BooksDaoImpl(DBConnection.getConnection());
			 boolean f = dao.updateEditBook(b);
			 
			 HttpSession session = req.getSession();
			 
			 if (f) 
			 {
				session.setAttribute("SuccessMsg", "Books updated successfully");
				resp.sendRedirect("admin/allBooks.jsp");
			}
			 else
			 {
				 session.setAttribute("FailedMsg", "Something went wrong on server");
					resp.sendRedirect("admin/allBooks.jsp");
				}
			 
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
		
}
