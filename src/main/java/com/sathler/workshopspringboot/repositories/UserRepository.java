package com.sathler.workshopspringboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sathler.workshopspringboot.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
