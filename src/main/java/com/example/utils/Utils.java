package com.example.utils;


import com.example.model.Trip;
import com.example.model.User;
import org.springframework.security.crypto.bcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Utils {

    //Retrieving user form input data from the request

    public static User getUserDataFromRequest(HttpServletRequest request) {

        User user = new User();

        user.setFirstName(request.getParameter("firstname"));
        user.setLastName(request.getParameter("lastname"));
        user.setUserName(request.getParameter("username"));
        user.setCity(request.getParameter("city"));
        user.setPhoneNr(Integer.parseInt(request.getParameter("phonenr")));

        // already hashing the password

        user.setPassword(hashPass(request.getParameter("password")));

        return user;

    }


    //password hashing static method using Bcrypt

    public static String hashPass(String password) {
        return BCrypt.hashpw(password, "$2a$10$33jaf54gs2qtWCmUzdSX5e");
    }


    public static boolean checkPassword(HttpServletRequest request, Connection conn) throws IOException, SQLException {
        //First we get parameter from request, and than we hash the input
        String userPass = request.getParameter("password");
        String userName = request.getParameter("userName");

        String hashedPass = hashPass(userPass);

        //Now we select from the db the 2 columns that we need for password and user comparing
        PreparedStatement pstmnt = conn.prepareStatement("select user_name,user_password from users where user_name=(?)");
        pstmnt.setString(1, userName);
        ResultSet rs = pstmnt.executeQuery();

        String dbPassword = null;
        String dbUserName = null;
        //Here we save the 2 resultset values in 2 String variables.
        while (rs.next()) {
            dbUserName = rs.getString("user_name");
            dbPassword = rs.getString("user_password");
        }

        boolean isValid = false;
        //Here we check for validity between user input(pass and user) and database user data.
        if (hashedPass.equals(dbPassword) && userName.equals(dbUserName)) {
            isValid = true;
        }
        pstmnt.close();
        conn.close();
        return isValid;
    }


    //Retrieves all the data from the addtrip form and returns a trip object
    public static Trip getTripDataFromRequest(HttpServletRequest request) throws IOException, ServletException {
        Trip trip = new Trip();

        //all form data saved to strings
        String name = request.getParameter("tripname");
        String startDate = request.getParameter("startdate");
        String endDate = request.getParameter("enddate");
        String impressions = request.getParameter("impressions");
        String location = request.getParameter("location");

        //first photo saved to inputStream
        Part filePartOne = request.getPart("photoone");
        //saves the name of the uploaded photo
        String fileNameOne = Paths.get(filePartOne.getSubmittedFileName()).getFileName().toString();
        //gets the content from the part
        InputStream fileContentOne = filePartOne.getInputStream();

        //second photo saved to inputStream
        Part filePartTwo = request.getPart("phototwo");
        //saves the name of the uploaded photo
        String fileNameTwo = Paths.get(filePartTwo.getSubmittedFileName()).getFileName().toString();
        //Gets the content from the part
        InputStream fileContentTwo = filePartTwo.getInputStream();

        //Adding everything to trip object
        trip.setName(name);

        //convert Strings date form inputs to LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
        LocalDate ldStartDate = LocalDate.parse(startDate, formatter);
        LocalDate ldEndDate = LocalDate.parse(endDate, formatter);

        trip.setStartDate(ldStartDate);
        trip.setEndDate(ldEndDate);

        trip.setImpressions(impressions);
        trip.setLocation(location);

        trip.setFileNameOne(fileNameOne);
        trip.setPhotoOne(fileContentOne);
        trip.setFileNameTwo(fileNameTwo);
        trip.setPhotoTwo(fileContentTwo);

        return trip;
    }

    // takes a Trip object as argument and adds the photos of that trip inside the uploads folder
    public static void addPhotosToStorage(Trip trip) throws IOException {
        File uploads = new File("C:\\Users\\Tudor\\Desktop\\ApacheTomcat\\apache-tomcat-9.0.24\\webapps\\TripAppServletsAndJspPhotos");
        //Creates a new file in the uploads folder , named based on the fileName variable
        File firstPhoto = new File(uploads, trip.getFileNameOne());
        Files.copy(trip.getPhotoOne(), firstPhoto.toPath());

        File secondPhoto = new File(uploads, trip.getFileNameTwo());
        Files.copy(trip.getPhotoTwo(), secondPhoto.toPath());

    }
}