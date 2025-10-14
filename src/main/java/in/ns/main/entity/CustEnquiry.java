package in.ns.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="customer_enquiry")
public class CustEnquiry {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "phoneNo")
	private String phoneNo;
	
	@Column(name="name")
	private String name;
	
	@Column(name="interested_course")
	private String interestedCourse;
	
	@Column(name="discussion")
	private String discussion;
	
	@Column(name="enquiry_type")
	private String enquiryType;
	
	@Column(name="status")
	private String status;
	
	@Column(name="call_To")
	private String callTo;
	
	@Column(name="enquiry_date")
	private String enquiryDate;
	
	@Column(name="enquiry_time")
	private String enquiryTime;
	
	@Column(name="emp_email")
	private String empEmail;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInterestedCourse() {
		return interestedCourse;
	}
	public void setInterestedCourse(String interestedCourse) {
		this.interestedCourse = interestedCourse;
	}
	public String getDiscussion() {
		return discussion;
	}
	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}
	public String getEnquiryType() {
		return enquiryType;
	}
	public void setEnquiryType(String enquiryType) {
		this.enquiryType = enquiryType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCallTo() {
		return callTo;
	}
	public void setCallTo(String callTo) {
		this.callTo = callTo;
	}
	public String getEnquiryDate() {
		return enquiryDate;
	}
	public void setEnquiryDate(String enquiryDate) {
		this.enquiryDate = enquiryDate;
	}
	public String getEnquiryTime() {
		return enquiryTime;
	}
	public void setEnquiryTime(String enquiryTime) {
		this.enquiryTime = enquiryTime;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
}
