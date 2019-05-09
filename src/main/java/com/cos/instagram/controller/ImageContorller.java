package com.cos.instagram.controller;

import java.io.FileInputStream;
import java.io.IOException;

import org.apache.catalina.startup.ClassLoaderFactory.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cos.instagram.repository.ImageRepository;

@RestController
public class ImageContorller {

	@Autowired
	private ImageRepository Repository;
	
	@PostMapping("/image/upload")
	public String uploadFile( MultipartFile file) throws IOException {
	    FileInputStream inputStream = (FileInputStream) file.getInputStream();
	    
	    //Repository.save();
	    return  "file uploaded successfully ";
	}
}
