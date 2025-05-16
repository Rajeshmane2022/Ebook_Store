package com.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.dao.BooksDaoImpl;
import com.dao.CartDaoImpl;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(req.getParameter("bid"));
            int uid = Integer.parseInt(req.getParameter("uid"));

            BooksDaoImpl dao = new BooksDaoImpl(DBConnection.getConnection());
            BookDetails b = dao.getBookById(bid);

            Cart c = new Cart();
            c.setBid(bid);
            c.setUid(uid);
            c.setBookName(b.getBookName());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));

            CartDaoImpl dao2 = new CartDaoImpl(DBConnection.getConnection());
            boolean f = dao2.addCart(c);

            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("addCart", "Book added to cart successfully!");
            } else {
                session.setAttribute("failed", "Failed to add book to cart. Please try again.");
            }
            resp.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failed", "Something went wrong. Please try again.");
            resp.sendRedirect("index.jsp");
        }
    }
}
