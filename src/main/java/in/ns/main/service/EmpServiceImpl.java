package in.ns.main.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import in.ns.main.entity.Employee;
import in.ns.main.repository.EmpRepository;

@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	EmpRepository empRepository;
	// ================== Add Employee =====================
	@Override
	public boolean addEmpService(Employee employee) {
		boolean status = false;
		try {
			empRepository.save(employee);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}
	// ================== Get All Employees ==================
	@Override
	public List<Employee> getAllEmpDetailsService() {
		return empRepository.findAll();
	}
	// ================== Authenticate  ==================
	@Override
	public Employee authenticate(String email) {
		Employee emp =  empRepository.findByEmail(email);
		return emp;
	}
	// ================== Delete Employee ======================
	@Override
	public boolean deleteEmployeeService(String email) {
		boolean status = false;
		try {
			empRepository.deleteByEmail(email);		
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}
	// ================== Update Employee Details ======================
	@Override
	public boolean updateEmployeeDetailService(Employee emp) {
		boolean status  = false;
		try {
			Employee existing = empRepository.findByEmail(emp.getEmail());
			if(existing != null) {
				existing.setName(emp.getName());
				existing.setEmail(emp.getEmail());
				existing.setPhoneNo(emp.getPhoneNo());
				
				empRepository.save(existing);
				status = true;
			}
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}
}
