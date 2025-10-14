package in.ns.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.ns.main.entity.CustEnquiry;

@Repository
public interface CustEnquiryRepository extends JpaRepository<CustEnquiry, Integer>{
	boolean existsByPhoneNo(String phoneNo);
	List<CustEnquiry> findAllByPhoneNo(String phoneNo);
}
