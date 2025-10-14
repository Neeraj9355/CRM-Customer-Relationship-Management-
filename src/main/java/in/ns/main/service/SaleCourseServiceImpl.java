package in.ns.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import in.ns.main.entity.SaleCourse;
import in.ns.main.repository.SaleCourseRepository;

@Service
public class SaleCourseServiceImpl implements SaleCourseService{
	@Autowired
	SaleCourseRepository saleCourseRepository;
	
	@Override
	public boolean addSaleCourseDetailsService(SaleCourse saleCourse) {
		boolean status = false;
		try {
			saleCourseRepository.save(saleCourse);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Object[]> getSelledCourseCount(String empEmailId) {
	    return saleCourseRepository.countCoursesByDate(empEmailId);
	}
}
