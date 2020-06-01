package com.example.web;

import com.example.utils.DatabaseConnection;
import com.example.utils.Query;
import com.example.utils.Utils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String password = request.getParameter("password");
        try {
            Connection conn = DatabaseConnection.initializeConnection();
            //Checking if password is ok by calling the checkPassword method
            boolean isValidPass = Utils.checkPassword(request, conn);
            //Creating a new session
            HttpSession session = request.getSession();
            if (isValidPass) {
                //retrieving parameter from request
                String username = request.getParameter("userName");
                //Retrieving the user id and setting it as Session Attribute
                int userId = Query.retrieveUserId(username);
                session.setAttribute("userid", userId);
                //setting the same parameter as a session attribute
                session.setAttribute("username", username);
                //setting the password as session attribute in order to display the user password in the profile
                session.setAttribute("password", password);
                //Using dispatcher to request the logedin.jsp static resource
                //RequestDispatcher view = request.getRequestDispatcher("logedin.jsp");
                //view.forward(request, response);
                //Redirecting to MainMenu servlet
                response.sendRedirect("MainMenuServlet");
            } else {
                String tryAgain = "Password and/or User incorrect, please try again.";
                request.setAttribute("tryAgain", tryAgain);
                RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
                view.forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }
}