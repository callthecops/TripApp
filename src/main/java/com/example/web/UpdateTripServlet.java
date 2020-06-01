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

public class UpdateTripServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //because of html limitation when working with multipart forms we can't use required attribute in form and
        // because of that we have to add another page.
        if (request.getParameter("tripname").isEmpty() || request.getParameter("startdate").isEmpty() ||
                request.getParameter("enddate").isEmpty() || request.getParameter("impressions").isEmpty() ||
                request.getPart("photoone") == null || request.getPart("phototwo") == null) {
            RequestDispatcher view = request.getRequestDispatcher("tripfieldsareempty.html");
            view.forward(request, response);

        } else {
            try {
                Trip trip = Utils.getTripDataFromRequest(request);
                Utils.addPhotosToStorage(trip);
                HttpSession session = request.getSession();
                int id = (int) session.getAttribute("tripid");
                String updateSuccess = Query.updateTrip(trip, id);
                session.setAttribute("updateSuccess", updateSuccess);
                //After editing the trip , we redirect the user back through the MainMenuServlet in order to
                //see the updated trips on the logedin.jsp
                response.sendRedirect("MainMenuServlet");
            } catch (ServletException | IOException | ClassNotFoundException | SQLException | NullPointerException ex) {
                ex.printStackTrace();
            }
        }
    }
}
