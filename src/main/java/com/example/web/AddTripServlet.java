package com.example.web;

import com.example.model.Trip;
import com.example.utils.Query;
import com.example.utils.Utils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class AddTripServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String success;
        if (request.getParameter("tripname").isEmpty() || request.getParameter("startdate").isEmpty() ||
                request.getParameter("enddate").isEmpty() || request.getParameter("impressions").isEmpty() ||
                request.getPart("photoone") == null || request.getPart("phototwo") == null) {
            RequestDispatcher view = request.getRequestDispatcher("tripfieldsareempty.html");
            view.forward(request, response);
        } else {
            //Gets addtrip user input from the form and adds the photos to the storage
            Trip trip = Utils.getTripDataFromRequest(request);
            Utils.addPhotosToStorage(trip);
            //I use the user id wich i set in the session so that i can use it as foreign key in mysql
            HttpSession session = request.getSession();
            int userId = (int) session.getAttribute("userid");
            session.removeAttribute("updateSuccess");
            try {
                //Adds the trip to the database
                success = Query.insertTrip(trip, userId);
                request.setAttribute("success", success);
                RequestDispatcher view = request.getRequestDispatcher("addtrip.jsp");
                view.forward(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                ex.printStackTrace();
            }
        }

    }
}
