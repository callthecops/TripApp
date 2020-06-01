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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class UpdateProfileServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        //Password is returned as already hashed in here
        try {
            Connection conn = DatabaseConnection.initializeConnection();
            boolean isUserExisting = Query.checkIfUserAlreadyExists(request.getParameter("username"), conn);
            if(!isUserExisting){
                User user = Utils.getUserDataFromRequest(request);
                HttpSession session = request.getSession();
                String password = request.getParameter("password");
                String userName = user.getUserName();

                String success = Query.updateUser(user, session);
                request.setAttribute("success", success);
                //updating the needed session attributes aswell when the user updates
                session.setAttribute("username", userName);
                session.setAttribute("password", password);
                RequestDispatcher view = request.getRequestDispatcher("profile.jsp");
                view.forward(request, response);

            }else{
                //Creating request attribute to add to the jsp if user is already existing
                String alreadyExists = "User name already exist, please choose another name";
                request.setAttribute("alreadyExists", alreadyExists);
                RequestDispatcher view = request.getRequestDispatcher("profile.jsp");
                view.forward(request, response);

            }
        }catch (ClassNotFoundException | SQLException ex){
            ex.printStackTrace();
        }



    }
}
