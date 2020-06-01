package com.example.web;

import com.example.model.User;
import com.example.utils.Query;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class ProfileServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userid");
        try {
            session.removeAttribute("updateSuccess");
            User user = Query.retrieveUserProfile(userId);
            //Overwriting user password that i got with the above method with the password from the session
            user.setPassword((String)session.getAttribute("password"));
            request.setAttribute("user", user);
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        RequestDispatcher view = request.getRequestDispatcher("profile.jsp");
        view.forward(request,response);
    }
}
