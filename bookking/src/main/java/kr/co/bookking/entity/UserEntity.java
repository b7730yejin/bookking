package kr.co.bookking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BK_USER")
public class UserEntity {
	
	@Id
	@Column(name="USER_ID")
	String userId;
	
	@Column(name="USER_NAME")
	String userName;
	
	@Column(name="USER_PASSWORD")
	String userPassword;

	public String getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	
}
