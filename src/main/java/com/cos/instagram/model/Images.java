package com.cos.instagram.model;

import javax.persistence.Entity;
import javax.persistence.Lob;

import lombok.Data;

@Data
@Entity
public class Images {
	private int id;
	@Lob
	private byte[] file;
	private String location;
	private String caption;
	private Users user;
	//private Tags tag;
}
