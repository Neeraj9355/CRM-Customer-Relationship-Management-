package in.ns.main.service;

import java.util.List;

import in.ns.main.entity.CustFollowUp;

public interface CustFollowUpService {
	public boolean addCustFollowUpDateService(CustFollowUp custFollowUp);
	public List<CustFollowUp> getFollowUpForProvidedDate(String date);
}
