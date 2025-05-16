package com.user_servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.DBConnection;
import com.dao.UserDAOImpl;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password"); // Entered password for validation

            // Get database connection
            Connection con = DBConnection.getConnection();
            UserDAOImpl dao = new UserDAOImpl(con);

            // Check if the entered password is correct
            if (dao.checkPassword(id, password)) {
                // If correct, update the user profile
                String query = "UPDATE user SET name=?, email=?, phno=? WHERE id=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phno);
                ps.setInt(4, id);
                
                int i = ps.executeUpdate();
                if (i == 1) {
                    req.getSession().setAttribute("successMsg", "Profile updated successfully!");
                } else {
                    req.getSession().setAttribute("errorMsg", "Something went wrong, please try again.");
                }
            } else {
                req.getSession().setAttribute("errorMsg", "Incorrect password! Profile update failed.");
            }

            resp.sendRedirect("editProfile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
