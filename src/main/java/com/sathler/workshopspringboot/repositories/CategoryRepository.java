package com.sathler.workshopspringboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sathler.workshopspringboot.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
