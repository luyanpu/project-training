package com.backend.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="backuser")
public class BackUser {

	@Id
	@GeneratedValue(generator="buid")
	@GenericGenerator(name="buid",strategy="native")
	private int id;
	@Column(name="name")
	private String name;
	@Column(name="job")
	private String job;
	@Column(name="password")
	private String password;
	@Column(name="state")
	private int state;
	@Column(name="intro")
	private String intro;
	public BackUser() {
		
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String inpro) {
		this.intro = inpro;
	}
	
}
