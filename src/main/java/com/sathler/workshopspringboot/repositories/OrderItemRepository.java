package com.sathler.workshopspringboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sathler.workshopspringboot.entities.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

}
