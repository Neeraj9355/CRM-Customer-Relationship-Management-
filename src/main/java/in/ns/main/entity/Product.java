package in.ns.main.entity;

import org.springframework.web.multipart.MultipartFile;
import jakarta.persistence.*;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "course_name")
    private String courseName;

    @Column(name = "course_syllabus")
    private String courseSyllabus;

    @Column(name = "original_Price")
    private String originalPrice;

    @Column(name = "discounted_Price")
    private String discountedPrice;

    @Column(name = "course_Validity")
    private String courseValidity;

    @Column(name = "course_Image_url")
    private String courseImage; 

    @Column(name = "trainer_Name")
    private String trainerName;

    @Column(name = "trainer_Details")
    private String trainerDetails;

    @Column(name = "trainer_Image_url")
    private String trainerImage; 

    @Column(name = "other_Details")
    private String otherDetails;

    @Transient
    private MultipartFile courseImageFile;

    @Transient
    private MultipartFile trainerImageFile;

    // --- Getters and Setters ---
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseSyllabus() {
        return courseSyllabus;
    }

    public void setCourseSyllabus(String courseSyllabus) {
        this.courseSyllabus = courseSyllabus;
    }

    public String getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(String originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getDiscountedPrice() {
        return discountedPrice;
    }

    public void setDiscountedPrice(String discountedPrice) {
        this.discountedPrice = discountedPrice;
    }

    public String getCourseValidity() {
        return courseValidity;
    }

    public void setCourseValidity(String courseValidity) {
        this.courseValidity = courseValidity;
    }

    public String getCourseImage() {
        return courseImage;
    }

    public void setCourseImage(String courseImage) {
        this.courseImage = courseImage;
    }

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public String getTrainerDetails() {
        return trainerDetails;
    }

    public void setTrainerDetails(String trainerDetails) {
        this.trainerDetails = trainerDetails;
    }

    public String getTrainerImage() {
        return trainerImage;
    }

    public void setTrainerImage(String trainerImage) {
        this.trainerImage = trainerImage;
    }

    public String getOtherDetails() {
        return otherDetails;
    }

    public void setOtherDetails(String otherDetails) {
        this.otherDetails = otherDetails;
    }

    public MultipartFile getCourseImageFile() {
        return courseImageFile;
    }

    public void setCourseImageFile(MultipartFile courseImageFile) {
        this.courseImageFile = courseImageFile;
    }

    public MultipartFile getTrainerImageFile() {
        return trainerImageFile;
    }

    public void setTrainerImageFile(MultipartFile trainerImageFile) {
        this.trainerImageFile = trainerImageFile;
    }
}
