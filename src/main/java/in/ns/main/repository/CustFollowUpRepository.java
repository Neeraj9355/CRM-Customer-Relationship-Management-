package in.ns.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.ns.main.entity.CustFollowUp;

public interface CustFollowUpRepository extends JpaRepository<CustFollowUp, Integer> {
	CustFollowUp findByPhoneNo(String phoneNo);
	List<CustFollowUp> findByFollowupdate(String date);
}
