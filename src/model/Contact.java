package model;

import java.util.HashMap;

import javax.jdo.annotations.NotPersistent;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.google.gson.Gson;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Entity 
@PersistenceCapable
public class Contact {

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
	private HashMap<String, String> MobileNo;

	@NotPersistent
	private HashMap<String, String> Email;

	public HashMap<String, String> getMobileNo() {
		return MobileNo;
	}

	public void setMobileNo(HashMap<String, String> mobileNo) {
		MobileNo = mobileNo;
	}

	public HashMap<String, String> getEmail() {
		return Email;
	}

	public void setEmail(HashMap<String, String> email) {
		Email = email;
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