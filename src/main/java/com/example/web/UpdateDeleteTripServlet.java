package com.example.web;

import com.example.utils.DatabaseConnection;
import com.example.utils.Query;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class UpdateDeleteTripServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        if (request.getParameter("butonUpdate") != null) {
            try {
                Connection conn = DatabaseConnection.initializeConnection();
                //retrieving the trip id
                if (request.getParameter("butonUpdate").equals("")) {
                    String unsuccessfull = "Please select a trip first";
                    request.setAttribute("unsuccessfull", unsuccessfull);
                    RequestDispatcher view = request.getRequestDispatcher("logedin.jsp");
                    view.forward(request, response);
                }
                int id = Integer.parseInt(request.getParameter("butonUpdate"));
                HttpSession session = request.getSession();
                //setting the id as session attribute so we can use it in the query
                session.setAttribute("tripid", id);
                RequestDispatcher view = request.getRequestDispatcher("updatetrip.jsp");
                view.forward(request, response);
                conn.close();
            } catch (SQLException | ClassNotFoundException | IOException ex) {
                ex.printStackTrace();
            }
        } else if (request.getParameter("butonDelete") != null) {
            try {
                if (request.getParameter("butonDelete").equals("")) {
                    String unsuccessfull = "Please select a trip first";
                    request.setAttribute("unsuccessfull", unsuccessfull);
                    RequestDispatcher view = request.getRequestDispatcher("logedin.jsp");
                    view.forward(request, response);
                }
                int id = Integer.parseInt(request.getParameter("butonDelete"));
                HttpSession session = request.getSession();
                session.removeAttribute("updateSuccess");
                Query.deleteTripPhotos(id);
                String deleteTripSuccess = Query.deleteTrip(id);
                request.setAttribute("deletesuccess", deleteTripSuccess);
                response.sendRedirect("MainMenuServlet");
            } catch (ClassNotFoundException | SQLException | IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
