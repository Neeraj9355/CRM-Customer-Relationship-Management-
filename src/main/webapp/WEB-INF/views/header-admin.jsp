<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="container-fluid bg-primary text-white py-4">
	  <div class="d-flex justify-content-between align-items-center px-4">
		    <!-- Left: Brand -->
		    <a href="profileAdmin" class="navbar-brand text-white mb-0 h1">CRM Application</a>
		    <!-- Right: Admin Info + Logout -->
		    <div class="d-flex align-items-center">
			      <a href="profileAdmin" class="d-flex align-items-center text-white text-decoration-none me-3">
			        <img src="./images/admin_Profile_pic.png" alt="Welcome Admin" style="width:40px;" class="rounded-pill me-2">
			        <span>Admin</span>
			      </a>
		      	<a href="logout" class="text-decoration-none text-white">Logout</a>
		    </div>
	  </div>
	</header>
	<!-- Navbar Dropdowns -->
	  <nav class="container-fluid bg-dark py-2 navbar-dark-hover">
	    <div class="d-flex justify-content-center gap-4">
			
	      <!-- Home -->  
	      <a href="openAdminProfile" class="nav-link text-white fw-bold px-3 py-2 ">Home</a>
	      
	      <!-- Dropdown: Employees -->
	      <div class="dropdown">
	        <a class="dropdown-toggle text-white text-decoration-none fw-bold px-3 py-2 d-inline-block"
	           href="#" role="button" id="dropdownEmployees"
	           data-bs-toggle="dropdown" aria-expanded="false">
	          Employees
	        </a>
	        <ul class="dropdown-menu" aria-labelledby="dropdownEmployees">
	          <li><a class="dropdown-item" href="addEmployee">Add Employee</a></li>
	          <li><a class="dropdown-item" href="empList">Employee's List</a></li>
	        </ul>
	      </div>

	      <!-- Dropdown: Products -->
	      <div class="dropdown">
	        <a class="dropdown-toggle text-white text-decoration-none fw-bold px-3 py-2 d-inline-block"
	           href="#" role="button" id="dropdownProducts"
	           data-bs-toggle="dropdown" aria-expanded="false">
	          Products
	        </a>
	        <ul class="dropdown-menu" aria-labelledby="dropdownProducts">
	          <li><a class="dropdown-item" href="addProducts">Add Products</a></li>
	          <li><a class="dropdown-item" href="productList">Product's List</a></li>
	        </ul>
	      </div>

	      <!-- Link: Complaints -->
	      <div class="nav-item">
	        <a href="#" class="nav-link text-white fw-bold px-3 py-2">Complaints</a>
	      </div>
	    </div>
	  </nav>
</body>
</html>