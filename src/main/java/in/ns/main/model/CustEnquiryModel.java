package in.ns.main.model;

import in.ns.main.entity.CustEnquiry;
import in.ns.main.entity.CustFollowUp;

public class CustEnquiryModel {
	private String phoneNo;
	private CustEnquiry custEnquiry;
	private CustFollowUp custFollowUp;
	
	
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public CustEnquiry getCustEnquiry() {
		return custEnquiry;
	}
	public void setCustEnquiry(CustEnquiry custEnquiry) {
		this.custEnquiry = custEnquiry;
	}
	public CustFollowUp getCustFollowUp() {
		return custFollowUp;
	}
	public void setCustFollowUp(CustFollowUp custFollowUp) {
		this.custFollowUp = custFollowUp;
	}
}
