package model;

import com.google.appengine.api.datastore.Key;

public class Event {
	String eventName;
	String date;
	String start_time;
	String end_time;
	int duration;
	Key contactKey;
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public Key getContactKey() {
		return contactKey;
	}
	public void setContactKey(Key contactKey) {
		this.contactKey = contactKey;
	}

}
