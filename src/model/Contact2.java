package model;

import java.util.ArrayList;
import java.util.HashMap;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.NotPersistent;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.google.appengine.api.datastore.Key;
import com.google.gson.Gson;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
 
@Entity 
@PersistenceCapable
public class Contact2 {
 
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;

	public Key getKey() {
		return key;
	}

	public void setKey(Key key) {
		this.key = key;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Key id;

	@SerializedName("title")
	@Expose
	private String title;

	@SerializedName("website")
	@Expose 
	private String website;
  
	private String MobileString;
 
	private String eMailString;
   
	@NotPersistent
	private HashMap<String,ArrayList> MobileNo;

	@NotPersistent
	private HashMap<String, ArrayList> Email;
	
	@NotPersistent
	public HashMap<String,ArrayList> getMobileNo() {
		return MobileNo;
	}

	@NotPersistent
	public void setMobileNo(HashMap<String,ArrayList> mobileNo) {
		MobileNo = mobileNo;
	}

	@NotPersistent
	public HashMap<String, ArrayList> getEmail() {
		return Email;
	}

	@NotPersistent
	public void setEmail(HashMap<String,ArrayList> emailID) {
		Email = emailID;
	}

	@SerializedName("company")
	@Expose
	private String company;

	@SerializedName("contact_name")
	@Expose
	private String contactName;

	
	private String userKey;

	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getCompanyKey() {
		return userKey;
	}
	
 
	public void setCompanyKey(String companyKey) {
		this.userKey = companyKey;
	} 
     
	public void makeString() {
		Gson g =new Gson();
		MobileString = g.toJson(MobileNo);
		eMailString = g.toJson(Email);
		System.out.println(eMailString);
	      
		
	}
}