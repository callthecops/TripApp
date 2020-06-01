package com.example.model;

import java.io.InputStream;
import java.time.LocalDate;

public class Trip {

    private int id;
    private String name;
    private LocalDate startDate;
    private LocalDate endDate;
    private String impressions;
    private InputStream photoOne;
    private InputStream photoTwo;
    private String location;
    private String fileNameOne;
    private String fileNameTwo;

    public String getFileNameOne() {
        return fileNameOne;
    }

    public void setFileNameOne(String fileNameOne) {
        this.fileNameOne = fileNameOne;
    }

    public String getFileNameTwo() {
        return fileNameTwo;
    }

    public void setFileNameTwo(String fileNameTwo) {
        this.fileNameTwo = fileNameTwo;
    }

    public Trip(){}

    public Trip(int id, String name, LocalDate startDate, LocalDate endDate, String impressions, InputStream photoOne, InputStream photoTwo, String location, String fileNameOne, String fileNameTwo) {
        this.id = id;
        this.name = name;
        this.startDate = startDate;
        this.endDate = endDate;
        this.impressions = impressions;
        this.photoOne = photoOne;
        this.photoTwo = photoTwo;
        this.location = location;
        this.fileNameOne = fileNameOne;
        this.fileNameTwo = fileNameTwo;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getImpressions() {
        return impressions;
    }

    public void setImpressions(String impressions) {
        this.impressions = impressions;
    }

    public InputStream getPhotoOne() {
        return photoOne;
    }

    public void setPhotoOne(InputStream photoOne) {
        this.photoOne = photoOne;
    }

    public InputStream getPhotoTwo() {
        return photoTwo;
    }

    public void setPhotoTwo(InputStream photoTwo) {
        this.photoTwo = photoTwo;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
