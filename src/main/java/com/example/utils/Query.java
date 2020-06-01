package com.example.utils;

import com.example.model.Trip;
import com.example.model.User;
import org.springframework.cglib.core.Local;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Query {

    public static String insertUser(User user, Connection conn) throws SQLException {
        PreparedStatement pstmnt = conn.prepareStatement("insert into users(first_name,last_name,user_name,city,phone_nr,user_password) values(?,?,?,?,?,?)");

        pstmnt.setString(1, user.getFirstName());
        pstmnt.setString(2, user.getLastName());
        pstmnt.setString(3, user.getUserName());
        pstmnt.setString(4, user.getCity());
        pstmnt.setInt(5, user.getPhoneNr());
        pstmnt.setString(6, user.getPassword());

        pstmnt.executeUpdate();
        pstmnt.close();
        conn.close();

        return "Profile has been successfully created,please log in !";

    }


    //Checks in the DB if there is already a username like the inputed user name.

    public static boolean checkIfUserAlreadyExists(String inputUserName, Connection conn) throws SQLException, ClassNotFoundException {

        conn = DatabaseConnection.initializeConnection();
        PreparedStatement pstmnt = conn.prepareStatement("select first_name,last_name,user_name,city,phone_nr,user_password from users where user_name=(?)");
        pstmnt.setString(1, inputUserName);

        ResultSet rs = pstmnt.executeQuery();
        boolean userDoesExist = false;

        while (rs.next()) {
            String dbUserName = rs.getString("user_name");
            if (dbUserName.equals(inputUserName)) {
                userDoesExist = true;
            } else {
                userDoesExist = false;
            }
        }
        pstmnt.close();
        conn.close();
        return userDoesExist;
    }

    public static int retrieveUserId(String username) throws ClassNotFoundException, SQLException {
        Connection conn = DatabaseConnection.initializeConnection();
        int userId = 0;

        String query = "select(user_id) from users where user_name=(?)";
        PreparedStatement psmt = conn.prepareStatement(query);
        //Searching in database by user_name
        psmt.setString(1, username);
        //Saving the column value in a resultset
        ResultSet rs = psmt.executeQuery();
        while (rs.next()) {
            userId = rs.getInt("user_id");
        }
        conn.close();
        rs.close();

        return userId;
    }


    //Takes a trip object as an argument and adds it to the database
    public static String insertTrip(Trip trip, int userId) throws ClassNotFoundException, SQLException {
        Connection conn = DatabaseConnection.initializeConnection();

        String name = trip.getName();
        LocalDate startDate = trip.getStartDate();
        LocalDate endDate = trip.getEndDate();
        String impressions = trip.getImpressions();
        InputStream photoOne = trip.getPhotoOne();
        InputStream photoTwo = trip.getPhotoTwo();
        String location = trip.getLocation();
        //Optional
        String fileNameOne = trip.getFileNameOne();
        String fileNameTwo = trip.getFileNameTwo();

        PreparedStatement pstmnt = conn.prepareStatement("insert into trips(user_id,trip_name,trip_start_date,trip_end_date,trip_impressions,photo_one_loc,photo_two_loc,trip_location_coordinates) values (?,?,?,?,?,?,?,?)");
        pstmnt.setInt(1, userId);
        pstmnt.setString(2, name);
        //Convertion to mysql standard DATE
        pstmnt.setDate(3, java.sql.Date.valueOf(startDate));
        pstmnt.setDate(4, java.sql.Date.valueOf(endDate));
        pstmnt.setString(5, impressions);

        String path = "C:\\Users\\Tudor\\Desktop\\ApacheTomcat\\apache-tomcat-9.0.24\\webapps\\TripAppServletsAndJspPhotos\\";

        pstmnt.setString(6, path + fileNameOne);
        pstmnt.setString(7, path + fileNameTwo);


        //Adding actual photos to DB- not needed anymore
//        pstmnt.setBinaryStream(6, photoOne);
//        pstmnt.setBinaryStream(7, photoTwo);
        pstmnt.setString(8, location);

        pstmnt.executeUpdate();
        pstmnt.close();
        conn.close();

        return "Trip successfully inserted into the database";

    }

    public static User retrieveUserProfile(int userid) throws ClassNotFoundException, SQLException {

        Connection conn = DatabaseConnection.initializeConnection();
        String query = "Select user_id, first_name, last_name, user_name, city, phone_nr,user_password from users where user_id=(?);";

        PreparedStatement pstmnt = conn.prepareStatement(query);
        pstmnt.setInt(1, userid);
        ResultSet rs = pstmnt.executeQuery();
        User user = new User();

        while (rs.next()) {

            int userId = rs.getInt("user_id");
            String firstName = rs.getString("first_name");
            String lastName = rs.getString("last_name");
            String userName = rs.getString("user_name");
            String city = rs.getString("city");
            int phoneNr = rs.getInt("phone_nr");
            String userPassword = rs.getString("user_password");

            user.setId(userId);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setUserName(userName);
            user.setCity(city);
            user.setPhoneNr(phoneNr);
            user.setPassword(userPassword);
        }

        conn.close();
        pstmnt.close();
        return user;
    }

    public static String updateUser(User user, HttpSession session) throws ClassNotFoundException, SQLException {
        Connection conn = DatabaseConnection.initializeConnection();

        String query = "update users set first_name = ?, last_name=?, user_name=?, city=?, phone_nr=?, user_password=? where user_id=?";

        PreparedStatement pstmnt = conn.prepareStatement(query);
        pstmnt.setString(1, user.getFirstName());
        pstmnt.setString(2, user.getLastName());
        pstmnt.setString(3, user.getUserName());
        pstmnt.setString(4, user.getCity());
        pstmnt.setInt(5, user.getPhoneNr());
        //Hashing the new password
        pstmnt.setString(6, user.getPassword());
        //Using session user id attribute
        pstmnt.setInt(7, (int) session.getAttribute("userid"));

        pstmnt.executeUpdate();
        pstmnt.close();
        conn.close();

        return "User has been updated";
    }

    //Added method
    public static Trip retrieveTripById(int tripId) throws SQLException, ClassNotFoundException {
        Connection conn = DatabaseConnection.initializeConnection();

        String query = "Select * from trips where trip_id=?";
        PreparedStatement pstmnt = conn.prepareStatement(query);
        pstmnt.setInt(1, tripId);
        ResultSet rs = pstmnt.executeQuery();

        if (!rs.next()) {
            throw new IllegalStateException("No trip found for id " + tripId);
        }

        Trip trip = new Trip();
        String tripName = rs.getString("trip_name");
        //Conversion from Mysql standard date to LocalDate
        LocalDate startDate = (rs.getDate("trip_start_date")).toLocalDate();
        LocalDate endDate = (rs.getDate("trip_end_date")).toLocalDate();
        String impressions = (rs.getString("trip_impressions"));
        String photoOneLocation = (rs.getString("photo_one_loc"));
        String photoTwoLocation = (rs.getString("photo_two_loc"));
        String tripLocation = (rs.getString("trip_location_coordinates"));

        trip.setId(tripId);
        trip.setName(tripName);
        trip.setStartDate(startDate);
        trip.setEndDate(endDate);
        trip.setImpressions(impressions);
        trip.setFileNameOne(photoOneLocation);
        trip.setFileNameTwo(photoTwoLocation);
        trip.setLocation(tripLocation);

        conn.close();
        return trip;
    }

    public static List<Trip> retrieveTrips(int userId) throws ClassNotFoundException, SQLException {
        Connection conn = DatabaseConnection.initializeConnection();
        List<Trip> trips = new ArrayList<>();

        String query = "Select * from trips where user_id=?";
        PreparedStatement pstmnt = conn.prepareStatement(query);
        pstmnt.setInt(1, userId);
        ResultSet rs = pstmnt.executeQuery();

        while (rs.next()) {
            Trip trip = new Trip();
            int tripId = rs.getInt("trip_id");
            String tripName = rs.getString("trip_name");
            //Conversion from Mysql standard date to LocalDate
            LocalDate startDate = (rs.getDate("trip_start_date")).toLocalDate();
            LocalDate endDate = (rs.getDate("trip_end_date")).toLocalDate();
            String impressions = (rs.getString("trip_impressions"));
            String photoOneLocation = (rs.getString("photo_one_loc"));
            String photoTwoLocation = (rs.getString("photo_two_loc"));
            String tripLocation = (rs.getString("trip_location_coordinates"));

            trip.setId(tripId);
            trip.setName(tripName);
            trip.setStartDate(startDate);
            trip.setEndDate(endDate);
            trip.setImpressions(impressions);
            trip.setFileNameOne(photoOneLocation);
            trip.setFileNameTwo(photoTwoLocation);
            trip.setLocation(tripLocation);

            trips.add(trip);
        }
        return trips;
    }

    public static String updateTrip(Trip trip, int id) throws ClassNotFoundException, SQLException {
        Connection conn = DatabaseConnection.initializeConnection();
        String query = "update trips set trip_name = ?, trip_start_date=?, trip_end_date=?, trip_impressions=?, photo_one_loc=?, photo_two_loc=?,trip_location_coordinates=? where trip_id=?";
        PreparedStatement pstmnt = conn.prepareStatement(query);
        pstmnt.setString(1, trip.getName());

        pstmnt.setDate(2, java.sql.Date.valueOf(trip.getStartDate()));
        pstmnt.setDate(3, java.sql.Date.valueOf(trip.getEndDate()));
        pstmnt.setString(4, trip.getImpressions());

        String path = "C:\\Users\\Tudor\\Desktop\\ApacheTomcat\\apache-tomcat-9.0.24\\webapps\\TripAppServletsAndJspPhotos\\";

        pstmnt.setString(5, path + trip.getFileNameOne());
        pstmnt.setString(6, path + trip.getFileNameTwo());
        pstmnt.setString(7, trip.getLocation());


        pstmnt.setInt(8, id);
        pstmnt.executeUpdate();
        pstmnt.close();
        conn.close();

        return "Trip has been updated";
    }

    //Deletes trip entry from the database
    public static String deleteTrip(int id) throws SQLException, ClassNotFoundException {
        Connection conn = DatabaseConnection.initializeConnection();
        String query = "delete from trips where trip_id=(?)";
        PreparedStatement pstmnt = conn.prepareStatement(query);
        pstmnt.setInt(1, id);
        pstmnt.executeUpdate();
        pstmnt.close();
        conn.close();

        return "Trip has been deleted";
    }

    //Deletes photos from the folder
    public static String deleteTripPhotos(int id) throws SQLException, ClassNotFoundException, IOException {
        String successDelete = "Photos have been deleted";
        Connection conn = DatabaseConnection.initializeConnection();
        String query = "select photo_one_loc, photo_two_loc from trips where trip_id=(?)";
        PreparedStatement pstmnt = conn.prepareStatement(query);
        pstmnt.setInt(1, id);
        ResultSet rs = pstmnt.executeQuery();

        String photoOneLocation = null;
        String photoTwoLocation = null;

        while (rs.next()) {
            photoOneLocation = rs.getString("photo_one_loc");
            photoTwoLocation = rs.getString("photo_two_loc");
        }

        Path fileToDeletePathOne = Paths.get(photoOneLocation);
        Files.delete(fileToDeletePathOne);

        Path fileToDeletePathTwo = Paths.get(photoTwoLocation);
        Files.delete(fileToDeletePathTwo);

        conn.close();
        return successDelete;
    }

}
