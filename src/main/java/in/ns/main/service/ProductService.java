package in.ns.main.service;

import java.util.List;
import in.ns.main.entity.Product;

public interface ProductService{
	public boolean addProductService(Product product);
	public List<Product> getAllProductDetails();
	public boolean deleteProduct(int id);
	public boolean updateProductDetails(Product product);
	
	public List<String> getAllCourseName();
	
	public Product getSelectedCourseDetailsService(String courseName);
}
