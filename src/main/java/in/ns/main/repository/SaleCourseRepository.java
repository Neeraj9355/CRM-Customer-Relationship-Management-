package in.ns.main.repository;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import in.ns.main.entity.SaleCourse;

@Repository
public interface SaleCourseRepository extends JpaRepository<SaleCourse, Integer> {
	@Query("SELECT s.date, COUNT(s.id) FROM SaleCourse s WHERE s.empEmailId = :empEmailId GROUP BY s.date ORDER BY s.date")
    List<Object[]> countCoursesByDate(@Param("empEmailId") String empEmailId);
}
