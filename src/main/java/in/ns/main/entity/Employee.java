package in.ns.main.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Pattern;

@Entity
@Table(name="register")

public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	//@NotEmpty(message ="Name cannot be empty")
	@Pattern(
					regexp = "^[a-zA-Z ]{5,30}$",
					message = "Name must be 5-30 characters long and contain only letters and spaces"
					)
	private String name;
	@Pattern(
					regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}$",
					message = "Email must be in a valid format like user@example.com"
					)
	private String email;
	@Pattern(
			  		regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,30}$",
			  		message = "Password must be 6-30 characters, include uppercase, lowercase, number, and special character (e.g. @, $, !)"
					)
	private String password;
	@Pattern(
					regexp = "^[0-9]{10}$",
					message = "Phone number must be exactly 10 digits"
					)
	private String phoneNo;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
}
