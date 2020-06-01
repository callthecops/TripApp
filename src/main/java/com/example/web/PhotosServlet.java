package com.example.web;

import com.example.model.Trip;
import com.example.utils.DatabaseConnection;
import com.example.utils.Query;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;

public class PhotosServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int tripId = Integer.parseInt(request.getParameter("tripId"));
            Trip trip = Query.retrieveTripById(tripId);
            //Arbitrary variable for each column that contains photo name in mysql
            int photoIndex = Integer.parseInt(request.getParameter("photoIndex"));
            String photoLocation;
            if (photoIndex == 1) {
                photoLocation = trip.getFileNameOne();
            } else if (photoIndex == 2) {
                photoLocation = trip.getFileNameTwo();
            } else {
                throw new IllegalArgumentException();
            }
            //Similar to File object.Creates file representation
            Path photoPath = Paths.get(photoLocation);
            try (InputStream photoContent = Files.newInputStream(photoPath)) {
                byte[] buffer = new byte[1024]; // We are about to tell to the InputStream to read 1 Kb of data
                int length;
                // 2049 bit
                //Here we tell it to read for each iteration 1024 bits.Once it reaches end of file it returns 0, wich means end of file.
                while ((length = photoContent.read(buffer)) > 0) {
                    // this writes to the outputstream 1024 bits for each iteration.It is the other way around.
                    response.getOutputStream().write(buffer, 0, length);
                }
            }
        } catch (ClassNotFoundException | SQLException | IOException ex) {
            ex.printStackTrace();
            // Use java.util.logging or SLF4J with logback
            //Because we are in a servlet , we need to throw back error to servlet.
            throw new RuntimeException(ex);
        }
    }
}
