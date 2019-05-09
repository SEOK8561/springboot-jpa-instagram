package com.cos.instagram.model;

import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String name;
	private String website;
	private String bio;
	private String email;
	private String phone;
	private String gender;
	
// Users객체에서 Follow 연관관계를 검색하고 싶다면 아래 추가
// mappedBy는 연관관계의 주인이 아님을 설정
// mappedBy가 없는 쪽이 FK가 생김
// mappedBy에 들어가는 값은 연관 관계 객체 Follow의 변수명
//	@OneToMany(mappedBy = "from_user")
//	private List<Follow> from_user;
//	
//	@OneToMany(mappedBy = "to_user")
//	private List<Follow> to_user;
	
	private Timestamp create_date;
	private Timestamp update_date;
}
