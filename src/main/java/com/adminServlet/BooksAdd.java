package com.adminServlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DBConnection;
import com.dao.BooksDaoImpl;
import com.entity.BookDetails;

@WebServlet("/addBooks")
@MultipartConfig
public class BooksAdd extends HttpServlet
{
	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 try {
			
			 String bookName= req.getParameter("bookName");
			 String author = req.getParameter("authorName");
			 String price = req.getParameter("price");
			 String categories = req.getParameter("bookCategory");
			 String status = req.getParameter("bookStatus");
			 Part part = req.getPart("bookFile");
			 String fileName = part.getSubmittedFileName();
			 
			 String email = "Admin@gmail.com";
			 
			 BookDetails b = new BookDetails( bookName,  author,  categories,  status,  fileName, email,  price);
		
			 BooksDaoImpl dao = new BooksDaoImpl(DBConnection.getConnection());
			 
			 
			
			 boolean f = dao.addBooks(b);
			 
			 HttpSession session = req.getSession();
			 
			 if (f) {
				 
				 String path = getServletContext().getRealPath("")+"books";
				 File file = new File(path);
				 part.write(path + File.separator + fileName);
				 
				 
				  session.setAttribute("SuccessMsg", "Book Add Successfully");
				  resp.sendRedirect("admin/addBooks.jsp");
			}
			 else {
				 session.setAttribute("FailedMsg", "Somehing Wrong On Server!!");
				  resp.sendRedirect("admin/addBooks.jsp");
			}
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
