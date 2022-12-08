package com.sathler.workshopspringboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sathler.workshopspringboot.entities.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
