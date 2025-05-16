package com.user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.dao.CartDaoImpl;
import com.entity.User;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cidParam = req.getParameter("cid"); // Use cid instead of bid
        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("userObj");
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        if (cidParam == null || cidParam.trim().isEmpty()) {
            session.setAttribute("failedMsg", "Invalid Cart ID!");
            resp.sendRedirect("checkOut.jsp"); // Redirect correctly
            return;
        }

        try {
            int cid = Integer.parseInt(cidParam);
            int userId = user.getId();

            CartDaoImpl dao = new CartDaoImpl(DBConnection.getConnection());
            boolean success = dao.deleteBook(cid, userId);

            if (success) {
                session.setAttribute("succMsg", "Book removed from cart!");
            } else {
                session.setAttribute("failedMsg", "Failed to remove book.");
            }
        } catch (NumberFormatException e) {
            session.setAttribute("failedMsg", "Invalid Cart ID format!");
        }

        resp.sendRedirect("checkOut.jsp"); // Redirect correctly
    }
}

