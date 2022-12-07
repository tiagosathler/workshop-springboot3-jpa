package com.sathler.workshopspringboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sathler.workshopspringboot.entities.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}
