package in.ns.main.controllers;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.ns.main.entity.CustEnquiry;
import in.ns.main.entity.CustFollowUp;
import in.ns.main.entity.Employee;
import in.ns.main.model.CustEnquiryModel;
import in.ns.main.service.CustEnquiryService;
import in.ns.main.service.CustFollowUpService;
import in.ns.main.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustEnquiryController {

    @Autowired
    ProductService productService;

    @Autowired
    CustEnquiryService custEnquiryService;

    @Autowired
    CustFollowUpService custFollowUpService;

    @GetMapping("/customerEnquiry")
    public String openCustomerEnquiryPage(
            Model model,
            @RequestParam(name="redirect_success", required=false) String success,
            @RequestParam(name="redirect_error", required=false) String error
    ) {
        List<String> courseName = productService.getAllCourseName();
        model.addAttribute("model_coursename_list", courseName);

        // Initialize model with nested objects to avoid null binding
        CustEnquiryModel custEnquiryModel = new CustEnquiryModel();
        custEnquiryModel.setCustEnquiry(new CustEnquiry());
        custEnquiryModel.setCustFollowUp(new CustFollowUp());

        model.addAttribute("modelCustEnquiryAttr", custEnquiryModel);
        model.addAttribute("model_success", success);
        model.addAttribute("model_error", error);

        return "customer-enquiry";
    }

    @PostMapping("/custEnquiryForm")
    public String custEnquiryForm(
            @ModelAttribute("modelCustEnquiryAttr") CustEnquiryModel custEnquiryModel,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        LocalDate date = LocalDate.now();
        String dateStr = date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));

        LocalTime time = LocalTime.now();
        String timeStr = time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));

        Employee employee = (Employee) session.getAttribute("session_employee");
        String empEmail = employee != null ? employee.getEmail() : "";

        String phoneNo = custEnquiryModel.getPhoneNo();

        // Use the bound CustEnquiry from the form
        CustEnquiry custEnquiry = custEnquiryModel.getCustEnquiry();
        custEnquiry.setPhoneNo(phoneNo);
        custEnquiry.setEnquiryDate(dateStr);
        custEnquiry.setEnquiryTime(timeStr);
        custEnquiry.setEmpEmail(empEmail);

        CustFollowUp custFollowUp = custEnquiryModel.getCustFollowUp();
        if (custFollowUp != null) {
            custFollowUp.setPhoneNo(phoneNo);
        }

        boolean status1 = custEnquiryService.addCustEnquiryDetailsService(custEnquiry);
        boolean status2 = custFollowUp != null 
                            && custFollowUpService.addCustFollowUpDateService(custFollowUp);

        if(status1 && status2) {
            redirectAttributes.addAttribute("redirect_success", "Customer Enquiry Details Added Successfully");
        } else {
            redirectAttributes.addAttribute("redirect_error", "Customer Enquiry Details Not Added Due to Some Error");
        }

        return "redirect:/customerEnquiry";
    }
    
    @GetMapping("/checkPhoneNumberAvailability")
    @ResponseBody
    public String checkPhoneNo(@RequestParam("phoneNumber") String phoneNo) {
    	boolean status = custEnquiryService.isPhoneNoExists(phoneNo);
    	
    	if(status) {
    		return "exists";
    	}else {
    		return "not-exists";    		
    	}
    }
    @GetMapping("/custEnquiryHistoryPage")
    public String openCustEnquiryHistoryPage(
    																		@RequestParam("phNo") String phoneNo,
    																		Model model
    																		)
    {
    	//System.out.println(phoneNo);
    	List<CustEnquiry> list_custEnquiry = custEnquiryService.getCustAllEnquiryHistory(phoneNo);
    	
    	model.addAttribute("model_custEnq",list_custEnquiry);
    	model.addAttribute("modelCustEnquiryAttr",new CustEnquiryModel());
    	
    	List<String> courseName = productService.getAllCourseName();
        model.addAttribute("model_coursename_list", courseName);
        
    	return "cusEnq-history";
    }
    
    @GetMapping("/customerFollowUp")
    public String openCustomerFollowUpPage(
    																	@RequestParam(name ="followUpDate",required = false) String selectedDate,
    																	Model model
    																	) 
    {
    	if(selectedDate != null) {
    		List<CustFollowUp> listFollowUps =  custFollowUpService.getFollowUpForProvidedDate(selectedDate);
    		model.addAttribute("model_followUps", listFollowUps);
    	}else {
    		LocalDate ld = LocalDate.now();
    		String date1 = ld.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    		List<CustFollowUp> listFollowUps =  custFollowUpService.getFollowUpForProvidedDate(date1);
    		model.addAttribute("model_followUps", listFollowUps);
    	}
        return "customer-FollowUp";
    }
}
