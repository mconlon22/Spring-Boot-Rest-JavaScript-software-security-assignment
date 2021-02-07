package com.example.demo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller // This means that this class is a Controller
@RequestMapping(path="/flight") // This means URL's start with /demo (after Application path)
public class MainController {
  @Autowired // This means to get the bean called userRepository
         // Which is auto-generated by Spring, we will use it to handle the data
  private FlightRepository flightRepository;

  @PostMapping(path="/add") // Map ONLY POST Requests
  public @ResponseBody String addNewUser (@RequestParam String departing
      , @RequestParam String destination, @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) Date departureTime) {
    // @ResponseBody means the returned String is the response, not a view name
    // @RequestParam means it is a parameter from the GET or POST request
    Flight n = new Flight();
    n.setDeparting(departing);
    n.setDestination(destination);
    n.setDepartureTime(departureTime);
    flightRepository.save(n);
    return "Saved";
  }

  @GetMapping(path="/all")
  public @ResponseBody Iterable<Flight> getAllUsers() {
    // This returns a JSON or XML with the users
    return flightRepository.findAll();
  }
  
  @GetMapping(path="/search")
  public @ResponseBody Iterable<Flight> searchFlights(@RequestParam String departing
  , @RequestParam String destination, @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date departureTime) {
    // This returns a JSON or XML with the users
    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh");  
    String strDate = dateFormat.format(departureTime);  

    List<Flight> flights=flightRepository.findFlights(departing, destination, strDate);
    return flights;
}
}
