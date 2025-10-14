package in.ns.main.service;

import java.util.List;

import in.ns.main.entity.CustEnquiry;

public interface CustEnquiryService {
	public boolean addCustEnquiryDetailsService(CustEnquiry custEnquiry);
	public boolean isPhoneNoExists(String phoneNumber);
	public List<CustEnquiry> getCustAllEnquiryHistory(String phoneNo);
}
