package in.ns.main.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.ns.main.entity.Employee;
import in.ns.main.entity.Product;
import in.ns.main.entity.SaleCourse;
import in.ns.main.service.ProductService;
import in.ns.main.service.SaleCourseService;
import in.ns.main.urls.OtherUrls;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;
    
    @Autowired
    SaleCourseService saleCourseService;

    // ======================== OPEN ADD PRODUCT PAGE ===========================
    @GetMapping("/addProducts")
    public String openAddProducts(
            Model model,
            @RequestParam(name = "redirect_success", required = false) String success,
            @RequestParam(name = "redirect_fail", required = false) String fail) {

        model.addAttribute("courseModel", new Product());
        model.addAttribute("model_success", success);
        model.addAttribute("model_error", fail);

        return "add-Products";
    }

    // ======================== ADD PRODUCT ===========================
    @PostMapping("/addCourseForm")
    public String addCourseDetails(
            @ModelAttribute("courseModel") Product product,
            @RequestParam("courseImageFile") MultipartFile courseImage,
            @RequestParam("trainerImageFile") MultipartFile trainerImage,
            RedirectAttributes redirectAttributes) {

        try {
            // Save course image
            if (!courseImage.isEmpty()) {
                boolean status = saveImage(courseImage);
                if (status) {
                    product.setCourseImage(courseImage.getOriginalFilename());
                }
            }

            // Save trainer image
            if (!trainerImage.isEmpty()) {
                boolean status = saveImage(trainerImage);
                if (status) {
                    product.setTrainerImage(trainerImage.getOriginalFilename());
                }
            }

            boolean saved = productService.addProductService(product);
            if (saved) {
                redirectAttributes.addAttribute("redirect_success", "Product added successfully!");
            } else {
                redirectAttributes.addAttribute("redirect_fail", "Failed to add product!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("redirect_fail", "File upload failed!");
        }

        return "redirect:/addProducts";
    }

    private boolean saveImage(MultipartFile file) {
        boolean status = false;
        try {
            String fileName = file.getOriginalFilename();
            Path uploadPath = Paths.get(OtherUrls.IMAGE_UPLOAD_FOLDER);

            // create directory if not exists
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // ======================== VIEW PRODUCTS ===========================
    int pageSize = 5;

    @GetMapping("/productList")
    public String openProductListPage(
            @RequestParam(name = "redirect_success", required = false) String success,
            @RequestParam(name = "redirect_fail", required = false) String fail,
            Model model,
            @RequestParam(defaultValue = "1") int page) {

        List<Product> prodList = productService.getAllProductDetails();

        int totalProduct = prodList.size();
        int totalPage = (int) Math.ceil((double) totalProduct / pageSize);

        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalProduct);

        List<Product> newProdList = prodList.subList(startIndex, endIndex);

        model.addAttribute("model_List_Prod", newProdList);
        model.addAttribute("model_totalPages", totalPage);
        model.addAttribute("model_currentPage", page);
        model.addAttribute("model_PageSize", pageSize);

        model.addAttribute("model_success", success);
        model.addAttribute("model_error", fail);

        return "products-List";
    }

    // ======================== DELETE PRODUCT ===========================
    @GetMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
        boolean status = productService.deleteProduct(id);
        if (status) {
            redirectAttributes.addAttribute("redirect_success", "Product deleted successfully!");
        } else {
            redirectAttributes.addAttribute("redirect_fail", "Failed to delete product!");
        }
        return "redirect:/productList";
    }

    // ======================== UPDATE PRODUCT ===========================
    @PostMapping("/updateProductDetails")
    public String updateProductDetails(
            @ModelAttribute Product product,
            @RequestParam(value = "courseImageFile", required = false) MultipartFile courseImageFile,
            @RequestParam(value = "trainerImageFile", required = false) MultipartFile trainerImageFile,
            RedirectAttributes redirectAttributes) {

        try {
            if (courseImageFile != null && !courseImageFile.isEmpty()) {
                boolean status1 = saveImage(courseImageFile);
                if (status1) {
                    product.setCourseImage(courseImageFile.getOriginalFilename());
                }
            }

            if (trainerImageFile != null && !trainerImageFile.isEmpty()) {
                boolean status2 = saveImage(trainerImageFile);
                if (status2) {
                    product.setTrainerImage(trainerImageFile.getOriginalFilename());
                }
            }

            boolean updated = productService.updateProductDetails(product);
            if (updated) {
                redirectAttributes.addAttribute("redirect_success", "Product updated successfully!");
            } else {
                redirectAttributes.addAttribute("redirect_fail", "Product update failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("redirect_fail", "Unexpected error occurred!");
        }

        return "redirect:/productList";
    }
    
    
    //======================= Sale Course =======================
    
    @GetMapping("/saleCourse")
    public String openSaleCoursePage(Model model,
    														@RequestParam(name = "redirectAttr_success",required = false) String success,
    														@RequestParam(name = "redirectAttr_error",required = false) String error
    														) {
    	List<String> courseName = productService.getAllCourseName();
        model.addAttribute("model_coursename_list", courseName);
        
        model.addAttribute("modelSaleCourseAttr", new SaleCourse());
        model.addAttribute("model_success", success);
        model.addAttribute("model_error", error);
        
    	return "sale-course";
    }
    @PostMapping("/saleCourseForm")
    public String saleCourseForm(HttpSession session,
    												@ModelAttribute("modelSaleCourseAttr") SaleCourse saleCourse,
    												RedirectAttributes redirectAttributes
    												)
    {
    	Employee employee = (Employee) session.getAttribute("session_employee");
    	String empEmail = employee.getEmail();
    	
    	LocalDate ld = LocalDate.now();
    	String date1 = ld.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    	
    	LocalTime lt = LocalTime.now();
    	String time1 = lt.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
    	
    	saleCourse.setEmpEmailId(empEmail);
    	saleCourse.setDate(date1);
    	saleCourse.setTime(time1);
    	
    	boolean status = saleCourseService.addSaleCourseDetailsService(saleCourse);
    	if(status) {
    		redirectAttributes.addAttribute("redirectAttr_success","Course Sale Successfully");
    	}else {
    		redirectAttributes.addAttribute("redirectAttr_error","Course Not Sale Due to Some Error");
    	}
    	return "redirect:/saleCourse";
    }
    
    @GetMapping("/getCoursePrices")
    @ResponseBody
    public Product getCoursePrice(@RequestParam("selectedCourse") String selectCourse) {
    	return productService.getSelectedCourseDetailsService(selectCourse);
    }
}
