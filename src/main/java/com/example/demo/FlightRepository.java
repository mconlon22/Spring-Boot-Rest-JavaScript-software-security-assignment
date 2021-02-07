package com.example.demo;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

public interface FlightRepository extends CrudRepository<Flight, Integer> {
@Query(value = "SELECT * FROM flight  WHERE departing = ?1 and destination=?2 and departure_time>=?3+' 00:00:00'", nativeQuery = true)
    List<Flight> findFlights(String departing,String destination,String departureDate);


}
