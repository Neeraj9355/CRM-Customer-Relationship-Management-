package in.ns.main.service;

import java.util.List;

import in.ns.main.entity.SaleCourse;

public interface SaleCourseService {
	public boolean addSaleCourseDetailsService(SaleCourse saleCourse);
	
	public List<Object[]> getSelledCourseCount(String empName);
}
