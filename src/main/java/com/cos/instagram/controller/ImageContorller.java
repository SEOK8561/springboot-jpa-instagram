package com.cos.instagram.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cos.instagram.model.Images;
import com.cos.instagram.model.Tags;
import com.cos.instagram.repository.ImageRepository;
import com.cos.instagram.repository.TagRepository;

@RestController
public class ImageContorller {

	@Autowired
	private ImageRepository imageRepository;
	
	@Autowired
	private TagRepository TagRepository;
	
	@PostMapping("/image/upload")
	public ResponseEntity<Resource> uploadFile(@RequestParam("file") MultipartFile file) throws IOException {
	    //FileInputStream inputStream = (FileInputStream) file.getInputStream();
		
		Images image = new Images();
	    image.setFile(file.getBytes());
	    image.setCaption("git 집필 자료 사진");
	    image.setLocation("부산 어딘가");
	    
	    List<Tags> list = new ArrayList<>();
	    Tags tag1 = new Tags();
	    Tags tag2 = new Tags();
	    tag1.setName("Git");
	    tag2.setName("버전관리");
	    list.add(tag1);
	    list.add(tag2);
	
	    imageRepository.save(image);
	    for(Tags tag : list) {
	    	TagRepository.save(tag);
	    }

	    return  ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(file.getContentType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getOriginalFilename() + "\"")
                .body(new ByteArrayResource(file.getBytes()));
	}
}
