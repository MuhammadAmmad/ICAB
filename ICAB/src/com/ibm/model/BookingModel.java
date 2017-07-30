package com.ibm.model;

public class BookingModel {
private String uname;
private String cabid;
private String start;
private String end;
private String date;
private String time;
private String city;

public String getStart() {
	return start;
}
public void setStart(String start) {
	this.start = start;
}
public String getEnd() {
	return end;
}
public void setEnd(String end) {
	this.end = end;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getCabid() {
	return cabid;
}
public void setCabid(String cabid) {
	this.cabid = cabid;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
}
