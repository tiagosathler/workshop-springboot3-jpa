package com.sathler.workshopspringboot.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sathler.workshopspringboot.entities.Product;
import com.sathler.workshopspringboot.entities.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository repository;
	
	public List<Product> findAll(){
		List<Product> products = repository.findAll();
		return products;
	}
	
	public Product findById(Long id) {
		Optional<Product> product = repository.findById(id);
		return product.get();
	}
}
