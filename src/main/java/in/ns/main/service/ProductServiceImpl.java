package in.ns.main.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import in.ns.main.entity.Product;
import in.ns.main.repository.ProductRepository;
import in.ns.main.urls.OtherUrls;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductRepository productRepository;
	//======================== Add Product ==========================
	@Override
	public boolean addProductService(Product product) {
		boolean status =false;
		
		try {
			productRepository.save(product);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		
		return status;
	}

	//======================== Get All Product ==========================
	@Override
	public List<Product> getAllProductDetails() {
		return productRepository.findAll();
	}
	
	@Override
	public boolean deleteProduct(int id) {
		boolean status = false;
		try {
			productRepository.deleteById(id);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}
	//======================== Update  Product Details ==========================
	/**
	 *
	 */
	@Override
	public boolean updateProductDetails(Product product) {
		boolean status = false;
		try {
			Optional<Product> existingOpt = productRepository.findById(product.getId());
			if(existingOpt.isPresent()) {
				Product existing = existingOpt.get();
				
				existing.setCourseName(product.getCourseName());
	            existing.setCourseSyllabus(product.getCourseSyllabus());
	            existing.setOriginalPrice(product.getOriginalPrice());
	            existing.setDiscountedPrice(product.getDiscountedPrice());
	            existing.setCourseValidity(product.getCourseValidity());
	            existing.setTrainerName(product.getTrainerName());
	            existing.setTrainerDetails(product.getTrainerDetails());
	            existing.setOtherDetails(product.getOtherDetails());
	            
	            if(product.getCourseImage() != null && !product.getCourseImage().isEmpty()) {
	            	String fileName = product.getCourseImageFile().getOriginalFilename();
	                Path uploadPath = Paths.get(OtherUrls.IMAGE_UPLOAD_FOLDER);
	                Files.createDirectories(uploadPath);

	                Files.copy(product.getCourseImageFile().getInputStream(),
	                           uploadPath.resolve(fileName),
	                           StandardCopyOption.REPLACE_EXISTING);

	                existing.setCourseImage(OtherUrls.IMAGE_UPLAOD_URL+ fileName);
	            }
	            if (product.getTrainerImageFile() != null && !product.getTrainerImageFile().isEmpty()) {
	                String fileName = product.getTrainerImageFile().getOriginalFilename();
	                Path uploadPath = Paths.get(OtherUrls.IMAGE_UPLOAD_FOLDER);
	
	                Files.createDirectories(uploadPath);
	                Files.copy(product.getTrainerImageFile().getInputStream(),
	                           uploadPath.resolve(fileName),
	                           StandardCopyOption.REPLACE_EXISTING);

	                existing.setTrainerImage(OtherUrls.IMAGE_UPLAOD_URL+ fileName);
	            } else {
	                existing.setTrainerImage(product.getTrainerImage());
	            }
	            
	            productRepository.save(existing);
	            status = true;
			}
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}
	//======================== Get All Course Details ==========================
	@Override
	public List<String> getAllCourseName() {
		return productRepository.findCourseName();
	}
	//======================== Get Selected Course =========================
	@Override
	public Product getSelectedCourseDetailsService(String courseName) {
		return productRepository.findByCourseName(courseName);
	}
}
