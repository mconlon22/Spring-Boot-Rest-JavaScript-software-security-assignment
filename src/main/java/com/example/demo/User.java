package com.example.demo;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;

import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;
    @Column(name = "firstname")

    private String firstname;
    @Column(name = "surname")

    private String surname;
    @Column(name = "number")

    private String number;
    @Column(name = "address")

    private String address;
    @Column(name = "email")

    private String email;


    @OneToMany(mappedBy="user")
    @JsonIgnore
     private Set<Card> cards;
	
    @Column(name = "phone")
    private String phone;

    private String password;
    private String status;
    @ManyToMany(cascade = CascadeType.ALL)
    
    @JoinTable(
    name = "user_reservations", 
    joinColumns = @JoinColumn(name = "user_id"), 
    inverseJoinColumns = @JoinColumn(name = "flight_id"))
    Set<Flight> reservations;
    User(){}
    User( String firstname, String surname,String number, String email, String password,String status){
        
        this.firstname = firstname;
        this.surname = surname;
        this.number = number;
        this.email = email;
        this.password = password;
        this.status = status;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

 

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone2) {
        this.phone = phone2;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Set<Flight> getReservations() {
        return reservations;
    }
    public void addReservation(Flight f) {
       reservations.add(f);
    }
    public void removeReservation(Flight f) {
        reservations.remove(f);
     }
    public void setReservations(Set<Flight> reservations) {
        this.reservations = reservations;
    }

    public Set<Card> getCards() {
        return cards;
    }

    public void setCards(Set<Card> cards) {
        this.cards = cards;
    }
}
