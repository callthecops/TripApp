package com.example.web;

import com.example.model.User;
import com.example.utils.DatabaseConnection;
import com.example.utils.Query;
import com.example.utils.Utils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class FormServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = Utils.getUserDataFromRequest(request);

        Connection conn;

        try {
            conn = DatabaseConnection.initializeConnection();
            //First we check if username is already taken by somebody else.
            boolean isUserExisting = Query.checkIfUserAlreadyExists(request.getParameter("username"), conn);
            //If it is not taken than a new profile can be created with that username and the success string is shown
            if (!isUserExisting) {
                String success = Query.insertUser(user, conn);
                request.setAttribute("success", success);
                //!!!!! This and Login servlet should redirect at same resource so that i can automatically login once
                //profile is created.
                RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
                view.forward(request, response);
                //If username is taken it will let the user know to try again with another username.
            } else {
                //Creating request attribute to add to the jsp if user is already existing
                String alreadyExists = "User name already exist, please choose another name";
                request.setAttribute("alreadyExists", alreadyExists);
                RequestDispatcher view = request.getRequestDispatcher("newuserform.jsp");
                view.forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
}
