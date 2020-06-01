create database coretripapp;
use coretripapp;
create table users(
	user_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    user_name VARCHAR(30) NOT NULL,
    city VARCHAR(20) NOT NULL,
    phone_nr INT NOT NULL,
    user_password VARCHAR(70) NOT NULL,
		primary key(user_id)
        );
drop table users;

create table trips(
	trip_id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    trip_name VARCHAR(255) NOT NULL,
    trip_start_date DATE,
    trip_end_date DATE,
    trip_impressions VARCHAR(255) NOT NULL,
    photo_one_loc VARCHAR(255), 
    photo_two_loc VARCHAR(255),
    trip_location_coordinates VARCHAR(255) NOT NULL,
		primary key(trip_id),
        foreign key(user_id) references users(user_id)
        );
  drop table trips;
  select * from trips;
  
  drop table category;
  drop table person;
  drop table car;
    
