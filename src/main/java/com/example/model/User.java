package com.example.model;

public class User {

    String firstName;
    String lastName;
    String userName;
    String city;
    int phoneNr;
    String password;
    int id;


    public User() {
    }

    public User(String firstName, String lastName, String userName, String city, int phoneNr, String password, int id) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.city = city;
        this.phoneNr = phoneNr;
        this.password = password;
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getPhoneNr() {
        return phoneNr;
    }

    public void setPhoneNr(int phoneNr) {
        this.phoneNr = phoneNr;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
