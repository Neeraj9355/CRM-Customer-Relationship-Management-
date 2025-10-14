package in.ns.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import in.ns.main.entity.CustEnquiry;
import in.ns.main.repository.CustEnquiryRepository;

@Service
public class CustEnquiryServiceImpl implements CustEnquiryService {
	@Autowired
	CustEnquiryRepository custEnquiryRepository;
	
	//==================== Add Customer Enquiry =========================
	@Override
	public boolean addCustEnquiryDetailsService(CustEnquiry custEnquiry) {
		boolean status = false;
		try {
			custEnquiryRepository.save(custEnquiry);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}
	//===================== Phone No exists or not ==========================
	@Override
	public boolean isPhoneNoExists(String phoneNumber) {
		return custEnquiryRepository.existsByPhoneNo(phoneNumber);
	}
	@Override
	public List<CustEnquiry> getCustAllEnquiryHistory(String phoneNo) {
		return custEnquiryRepository.findAllByPhoneNo(phoneNo);
	}
	
}
