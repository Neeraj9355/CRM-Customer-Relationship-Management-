package in.ns.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import in.ns.main.entity.Product;

@Transactional
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	Product findByCourseName(String courseName);
	void deleteById(int id);
	
	@Query("SELECT courseName FROM Product")
	List<String>  findCourseName();
}
