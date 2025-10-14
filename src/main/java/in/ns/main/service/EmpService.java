package in.ns.main.service;

import java.util.List;

import in.ns.main.entity.Employee;

public interface EmpService {
	public Employee authenticate(String email);
	public boolean addEmpService(Employee employee);
	public List<Employee> getAllEmpDetailsService();
	public boolean deleteEmployeeService(String email);
	public boolean updateEmployeeDetailService(Employee emp);
}
