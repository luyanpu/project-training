package com.backend.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import com.frontend.entity.Product;
@Entity
@Table(name="producttype")
public class ProductType {

	@Id
	@GeneratedValue(generator="protypeid")
	@GenericGenerator(name="protypeid",strategy="native")
	private int id;
	@Column(name="name")
	private String name;
	@ManyToMany(mappedBy="proTypeSet")
	private Set<Product> proSet=new HashSet<Product>();
	
	public ProductType() {
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
	
	public Set<Product> getProSet() {
			return proSet;
		}
	public void setProSet(Set<Product> proSet) {
			this.proSet = proSet;
		}

}
