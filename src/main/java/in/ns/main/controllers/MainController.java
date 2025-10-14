package in.ns.main.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import in.ns.main.entity.Employee;
import in.ns.main.service.EmpService;
import in.ns.main.service.SaleCourseService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {
	
	@Autowired
	EmpService empService;
	
	@Autowired
	SaleCourseService saleCourseService;
	@GetMapping("/")
	public String openIndexPage() {
		return "index";
	}
	@GetMapping("/home")
	public String openHomePage() {
		return "index";
	}
	@GetMapping("/login")
	public String openloginPage() {
		return "login";
	}
	@GetMapping("/openAdminProfile")
	public String openAdminProfilePage() {
		return "profile-admin";
	}
	@GetMapping("/about")
	public String openAboutPage() {
		return "about";
	}
	// ==================== Employee List ===========================
	int pageSize = 5;
	@GetMapping("/empList")
	public String openEmpListPage(		
															@RequestParam(name="redirectAttr_success",required = false) String success,
															@RequestParam(name="redirectAttr_error", required = false) String error,
															Model model,
															@RequestParam(defaultValue = "1") int page
															)
	{
		List<Employee> listEmp = empService.getAllEmpDetailsService();
		
		int totalEmployee = listEmp.size();
		int totalPage = (int) Math.ceil(( (double) totalEmployee/pageSize));
		
		int listStartIndex = (page - 1) * pageSize;
		int listEndIndex = Math.min(listStartIndex+pageSize, totalEmployee);
		
		List<Employee>  newListEmp = listEmp.subList(listStartIndex, listEndIndex);
		
		model.addAttribute("model_List_Emp",newListEmp);
		model.addAttribute("model_totalPages",totalPage);
		model.addAttribute("model_currentPage", page);
		model.addAttribute("model_PageSize", pageSize);
		
		model.addAttribute("model_success", success);		
		model.addAttribute("model_error", error);
		
		return "employees-list";
	}
	
	@GetMapping("/profileAdmin")
	public String openProfileAdminPage() {
		return "profile-admin";
	}
	@GetMapping("/profileEmployee")
	public String openProfileEmployeePage() {
		return "profile-employee";
	}
   // ==================== Login Form ===========================
	@PostMapping("/LoginForm")
	public String openLoginForm(
																	@RequestParam("email") String myemail,
																	@RequestParam("password") String myPassword,
																	Model model,
																	HttpSession session
																) 
	{
		String page="login";
		if(myemail.equals("admin@gmail.com") && myPassword.equals("admin@123")) {
			page="profile-admin";
		}else {
			Employee emp = empService.authenticate(myemail);
			if(emp!=null && emp.getPassword().equals(myPassword)) {
				page="home-employee";
				session.setAttribute("session_employee", emp);
			}else {				
				model.addAttribute("model_error","Email ID & Password didn't Matched");
				page="login";
			}
		}
		return page;
	}
	
	@GetMapping("/addEmployee")
	public String openAddEmployee(Model model) {
		model.addAttribute("modelEmpAttr",new Employee());
		return "add-Employee";
	}
	// ==================== Register Employee Form ===========================
	@PostMapping("/AddEmployee")
	public String registerEmpForm(
															@Valid @ModelAttribute("modelEmpAttr") Employee emp,
															BindingResult br,
															Model model
														)
	{	
		if(!br.hasErrors()) {
			boolean status = empService.addEmpService(emp);
			if(status) {
				model.addAttribute("model_success","Employee added successfully");
			}else {
				model.addAttribute("model_error","Employee not added  due to some error");
			}
			emp.setName("");
			emp.setEmail("");
			emp.setPassword("");
			emp.setPhoneNo("");
		}
		return "add-Employee";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	//======================= Delete Employee ==========================
	@GetMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("empEmail") String email,RedirectAttributes redirectAttributes) {
		//System.out.println("email :"+email);
		boolean status = empService.deleteEmployeeService(email);
		if(status) {
			redirectAttributes.addAttribute("redirectAttr_success","Employee Deleted Successfully");
		}else {
			redirectAttributes.addAttribute("redirectAttr_error","Employee Not Deleted Due to Some Error");
		}
		return "redirect:/empList";
	}
	//======================= Edit Employee ==========================
	@PostMapping("/updateEmployeeDetails")
	public String openEditEmployee(
															@RequestParam("empName") String name,
															@RequestParam("empEmail") String email,
															@RequestParam("empPass") String password,
															@RequestParam("empPhone") String phoneNo,
															RedirectAttributes redirectAttributes
															)
	{
		/*--------------- for check data is coming ---------------
		System.out.println("name -"+name);
		System.out.println("email - "+email);
		System.out.println("password -"+password);
		System.out.println("phone No -"+phoneNo);
		*/
		Employee emp = new Employee();
		emp.setName(name);
		emp.setEmail(email);
		emp.setPassword(password);
		emp.setPhoneNo(phoneNo);
		
		boolean status = empService.updateEmployeeDetailService(emp);
		if(status) {
			redirectAttributes.addAttribute("redirectAttr_success","Employee Updated Successfully");
		}else {
			redirectAttributes.addAttribute("redirectAttr_error","Employee Not Updated Due to Some Error");
		}
		return "redirect:/empList";
	}
	
	
	@GetMapping("/homeEmployee")
	public String openHomeEmployeePage(Model model, @SessionAttribute("session_employee") Employee employee) {
	    List<Object[]> soldCourses = saleCourseService.getSelledCourseCount(employee.getEmail());
	    model.addAttribute("model_soldCourses", soldCourses);
	    return "home-employee";
	}
}