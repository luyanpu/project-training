package com.frontend.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import com.backend.entity.ProductType;


@Entity
@Table(name="product")
public class Product {
	@Id
	@GeneratedValue(generator="pid")
	@GenericGenerator(name="pid",strategy="native")
	private  int id;
	@Column(name="name")
	private String name;
	@Column(name="price")
	private double price;
	@Column(name="salePrice")
	private double salePrice;
	@Column(name="count")
	private int count;
	 @ManyToMany
	 @JoinTable(name="product_type", 
	        joinColumns=@JoinColumn(name="productid"),
	        inverseJoinColumns=@JoinColumn(name="producttypeid"))
	private Set<ProductType> proTypeSet=new HashSet<ProductType>();
	public Product() {
		
	}
	public Product(String name, double price, double salePrice,int count) {
		super();
		this.name = name;
		this.price = price;
		this.salePrice = salePrice;
		this.count=count;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}
	public int getCount() {
		
		return this.count;
	}
	public void setCount(int count) {
		this.count=count;
	}
	
	public Set<ProductType> getProTypeSet() {
		return proTypeSet;
	}
	public void setProTypeSet(Set<ProductType> proTypeSet) {
		this.proTypeSet = proTypeSet;
	}
}
