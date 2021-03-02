package com.example.demo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller // This means that this class is a Controller
@RequestMapping(path = "/flight") // This means URL's start with /demo (after Application path)
@CrossOrigin

public class MainController {
  @Autowired
  private FlightRepository flightRepository;
  @Autowired
  private CardRepository cardRepository;
  @Autowired
  private UserRepository userRepository;

  @PostMapping(path = "/addFlight") // Map ONLY POST Requests
  @CrossOrigin

  public @ResponseBody String newFlight(@RequestParam String departing, @RequestParam String destination,
      @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) Date departureTime) {
    // @ResponseBody means the returned String is the response, not a view name
    // @RequestParam means it is a parameter from the GET or POST request
    Flight n = new Flight();
    n.setDeparting(departing);
    n.setDestination(destination);
    n.setDepartureTime(departureTime);
    flightRepository.save(n);
    return "Saved";
  }

  @PostMapping(path = "/addReservation") // Map ONLY POST Requests
  @CrossOrigin

  public @ResponseBody String newReservation(@RequestParam int userId, @RequestParam int flightId) {
    // @ResponseBody means the returned String is the response, not a view name
    // @RequestParam means it is a parameter from the GET or POST request
    Long uid = (long) userId;
    long fid = (long) flightId;
    Optional<Flight> flight = flightRepository.findById(fid);
    Optional<User> user = userRepository.findById(uid);
    if (user.isPresent() && flight.isPresent()) {
      System.out.println("added");
      User newuser = user.get();
      Flight newflight = flight.get();
      newuser.addReservation(newflight);
      userRepository.save(newuser);
    }

    return "Saved";
  }
  @PostMapping(path = "/removeReservation") 
  @CrossOrigin

  public @ResponseBody String removeReservation(@RequestParam int userId, @RequestParam int flightId) {
    Long uid = (long) userId;
    long fid = (long) flightId; 
    Flight flight = flightRepository.findById(fid).get();
    User user = userRepository.findById(uid).get();
    System.out.println(user.getReservations().size());
    if (user!=null && flight!=null) {      
      user.removeReservation(flight);
      userRepository.save(user);
    }
  System.out.println(user.getReservations().size());
    return "Cancel";
  }
  @PostMapping(path = "/getUserReservations") 
  @CrossOrigin

  public @ResponseBody User getUserReservations(@RequestParam int userId) throws JsonProcessingException {
    Long uid=(long)userId;
    Optional<User> user=userRepository.findById( uid);
    if(user.isPresent()){

      User newuser=user.get();
      System.out.println(newuser.getReservations().size());
      return newuser;
    }
    return null;
    
  }
  @PostMapping(path = "/getCards") 
  @CrossOrigin

  public @ResponseBody List<Card> getCards(@RequestParam int userId) throws JsonProcessingException {
    Long uid=(long)userId;
    List<Card> cards = cardRepository.findByCardUser(uid);
    
     return cards;
    
    
    
  }
  @PostMapping(path = "/getCard") 
  @CrossOrigin

  public @ResponseBody Card getCard(@RequestParam int cardId) throws JsonProcessingException {
    Long uid=(long)cardId;
    Card card = cardRepository.findById(uid).get();
    
     return card;
    
    
    
  }
  @PostMapping(path = "/removeCard") 
  @CrossOrigin

  public @ResponseBody String removeCard(@RequestParam int cardId) throws JsonProcessingException {
    Long uid=(long)cardId;
    cardRepository.deleteById( uid);
   
    return "success";
    
  }
  @PostMapping(path="/editUser") // Map ONLY POST Requests
  @CrossOrigin
  public @ResponseBody Long editUser(@RequestParam int userId,@RequestParam String firstname, @RequestParam String surname,
      @RequestParam String phone, @RequestParam String address, @RequestParam String email,
      @RequestParam String password) 
  {
 
    User user = userRepository.findById((long)userId).get();
    user.setFirstname(firstname);
    user.setSurname(surname);
    user.setEmail(email);
    user.setPhone(phone);
    user.setAddress(address);
    user.setPassword(address);
    userRepository.save(user);
    
    return user.getId();
  }
  @PostMapping(path="/addUser") // Map ONLY POST Requests
  @CrossOrigin
  public @ResponseBody Long newUser(@RequestParam String firstname, @RequestParam String surname,
      @RequestParam String phone, @RequestParam String address, @RequestParam String email,
      @RequestParam String password) 
  {
 
    User user = new User();
    user.setFirstname(firstname);
    user.setSurname(surname);
    user.setEmail(email);
    user.setPhone(phone);
    user.setAddress(address);
    user.setPassword(address);
    userRepository.save(user);
    
    return user.getId();
  }
  @PostMapping(path="/deleteUser") // Map ONLY POST Requests
  @CrossOrigin
  public @ResponseBody String deleteUser(@RequestParam int userId) 
  {
    userRepository.deleteById((long) userId);
    return "success";
  }

  @PostMapping(path="/editCard") // Map ONLY POST Requests
  @CrossOrigin
@ResponseBody String editCard(@RequestParam int cardId, @RequestParam String cardname,@RequestParam String cardnum, @RequestParam String cardcvc, @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date carddate) {
    // This returns a JSON or XML with the users
    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh");  
    String strDate = dateFormat.format(carddate);  
System.out.println("card");
  
Card card =cardRepository.findById((long)cardId).get();
card.setCardcvc(cardcvc);
card.setCardnum(cardnum);
card.setCardname(cardname);
card.setCarddate(strDate);

cardRepository.save(card);

return "success";
}

  @PostMapping(path="/getUser") // Map ONLY POST Requests
  @CrossOrigin
  public @ResponseBody User getUser(@RequestParam int userId) 
  {
 
    User user = userRepository.findById((long)userId).get();

    
    return user;
  }
  @PostMapping(path="/addCard") // Map ONLY POST Requests
  @CrossOrigin
  public @ResponseBody String addCard(@RequestParam int userId, @RequestParam String cardname,
      @RequestParam String cardnum, @RequestParam String cardcvc, @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date carddate) {
        // This returns a JSON or XML with the users
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh");  
        String strDate = dateFormat.format(carddate);  

      
    Card card = new Card();
    card.setCardcvc(cardcvc);
    card.setCardnum(cardnum);
    card.setCardname(cardname);
    card.setCarddate(strDate);
    card.setUser(userRepository.findById((long)userId).get());

    cardRepository.save(card);

 return "success";
    
  }
  @PostMapping(path="/login") // Map ONLY POST Requests
  @CrossOrigin
  public @ResponseBody User login(@RequestParam String email, @RequestParam String password) {
    
    User user=userRepository.finduser(email, password);
    System.out.println("User " + user.getId());
   


 return user;
    
  }
  @GetMapping(path="/all")
  public @ResponseBody Iterable<Flight> getAllUsers() {
    // This returns a JSON or XML with the users
    return flightRepository.findAll();
  }
  
  @GetMapping(path="/search")
  @CrossOrigin

  public @ResponseBody Iterable<Flight> searchFlights(@RequestParam String departing
  , @RequestParam String destination, @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date departureTime) {
    // This returns a JSON or XML with the users
    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh");  
    String strDate = dateFormat.format(departureTime);  

    List<Flight> flights=flightRepository.findFlights(departing, destination, strDate);
    return flights;
}
}
