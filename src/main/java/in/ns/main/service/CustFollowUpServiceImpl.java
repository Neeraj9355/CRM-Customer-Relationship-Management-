package in.ns.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import in.ns.main.entity.CustFollowUp;
import in.ns.main.repository.CustFollowUpRepository;

@Service
public class CustFollowUpServiceImpl  implements CustFollowUpService{
	
	@Autowired
	CustFollowUpRepository custFollowUpRepository;
	@Override
	public boolean addCustFollowUpDateService(CustFollowUp custFollowUp) {
		boolean status = false;
		
		try {
			CustFollowUp custFollowUp_db = custFollowUpRepository.findByPhoneNo(custFollowUp.getPhoneNo());
			if(custFollowUp_db != null) {
				custFollowUp_db.setFollowupdate(custFollowUp.getFollowupdate());
				custFollowUpRepository.save(custFollowUp_db);
			}else {
				custFollowUpRepository.save(custFollowUp);			
			}
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}
	
	
	@Override
	public List<CustFollowUp> getFollowUpForProvidedDate(String date) {
		return custFollowUpRepository.findByFollowupdate(date);
	}

}
