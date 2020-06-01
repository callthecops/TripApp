package com.example.web;

import com.example.model.Trip;
import com.example.utils.Query;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

// This servlet checks if there are trips for this user or not
public class MainMenuServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Trip> trips;
        HttpSession session = request.getSession();
        try {
            trips = Query.retrieveTrips((int) session.getAttribute("userid"));

            session.setAttribute("trips", trips);
            RequestDispatcher view = request.getRequestDispatcher("logedin.jsp");
            view.forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("tripid"));
        try {
            Trip trip = Query.retrieveTripById(id);
            String start = "You started this trip on: ";
            String end = " and you ended this trip on: ";
            request.setAttribute("start", start);
            request.setAttribute("end", end);

            request.setAttribute("trip", trip);
            RequestDispatcher view = request.getRequestDispatcher("logedin.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }

}
