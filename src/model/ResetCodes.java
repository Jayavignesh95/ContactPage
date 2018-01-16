package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ResetCodes {
	@Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private Long id;

String userName;
String passID;
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassID() {
	return passID;
}
public void setPassID(String passID) { 
	this.passID = passID;
}

}
