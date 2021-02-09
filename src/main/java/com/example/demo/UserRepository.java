package com.example.demo;

import java.util.Date;
import java.util.List;

import com.example.demo.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

public interface UserRepository extends JpaRepository<User, Long> {
    @Query(value = "SELECT * FROM user  WHERE email = ?1 and password=?2", nativeQuery = true)
    User finduser(String email,String password);
}
