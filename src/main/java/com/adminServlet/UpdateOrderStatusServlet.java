package com.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.DBConnection;
import com.dao.BookOrderDaoImp;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String status = request.getParameter("status");

        BookOrderDaoImp dao = new BookOrderDaoImp(DBConnection.getConnection());
        boolean updated = dao.updateOrderStatus(orderId, status);

        if (updated) {
            request.getSession().setAttribute("SuccessMsg", "Order status updated successfully!");
        } else {
            request.getSession().setAttribute("FailedMsg", "Failed to update order status!");
        }
        response.sendRedirect("admin/orders.jsp");

    }
}
