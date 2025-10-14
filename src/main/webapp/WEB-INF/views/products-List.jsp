<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product's List</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">  
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <link rel="stylesheet" href="/css/style.css" type="text/css"/>
  
  <script>
    function confirmDetailsDelete(prodId) {
        $('#deleteEmpConfirmationModel').modal('show');
        $('#deleteEmployee').attr('href','/deleteProduct?id=' + prodId);
    }
    $(document).ready(function () {
        $(".viewBtn").on("click", function () {
            let name = $(this).data("name");
            let syllabus = $(this).data("syllabus");
            let originalPrice = $(this).data("original");
            let discountedPrice = $(this).data("discount");
            let validity = $(this).data("validity");
            let courseImage = $(this).data("courseimg");
            let trainerName = $(this).data("trainer");
            let trainerDetails = $(this).data("trainerdetails");
            let trainerImage = $(this).data("trainerimg");
            let otherDetails = $(this).data("other");

            // Fill modal
            $("#viewCourseName").text(name);
            $("#viewCourseSyllabus").text(syllabus);
            $("#viewOriginalPrice").text("₹" + originalPrice);
            $("#viewDiscountedPrice").text("₹" + discountedPrice);
            $("#viewCourseValidity").text(validity);
            $("#viewCourseImage").attr("src", courseImage);
            $("#viewTrainerName").text(trainerName);
            $("#viewTrainerDetails").text(trainerDetails);
            $("#viewTrainerImage").attr("src", trainerImage);
            $("#viewOtherDetails").text(otherDetails);

            // Show modal
            $("#viewProductModal").modal("show");
		        });
		    });
		    $(document).ready(function () {
		        $(".updateBtn").on("click", function () {
		            $('#updateProdId').val($(this).data('id'));
		            $('#updateProdName').val($(this).data('name'));
		            $('#updateProdSyllabus').val($(this).data('syllabus'));
		            $('#updateProdOriginal').val($(this).data('original'));
		            $('#updateProdDiscount').val($(this).data('discount'));
		            $('#updateProdValidity').val($(this).data('validity'));
		            $('#updateCourseImagePreview').attr('src', $(this).data('courseimg'));
		            $('#updateProdImage').val($(this).data('courseimg'));
		            $('#updateProdTrainer').val($(this).data('trainer'));
		            $('#updateProdTrainerDetails').val($(this).data('trainerdetails'));
		            $('#updateTrainerImagePreview').attr('src', $(this).data('trainerimg'));
		            $('#updateProdTrainerImage').val($(this).data('trainerimg'));
		            $('#updateProdOtherDetails').val($(this).data('other'));
		
		            $('#updateEmployeeModal').modal('show');
		        });
		    });
    </script>
</head>
<body>
 <!-- Header -->
 <jsp:include page="header-admin.jsp"/>

 <div class="container mt-3"> 
 	<c:if test="${not empty model_success}">
	        		<div class="row">
			        	<div class="alert alert-success alert-dismissible fade show" role="alert">
							 ${model_success}
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
			        </div>
	        </c:if>
	        <c:if test="${not empty model_error}">
	        		<div class="row">
			        	<div class="alert alert-danger alert-dismissible fade show" role="alert">
							 ${model_error}
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
			        </div>
	        </c:if>
    <h3 style="color: blue;font-weight: bold;margin-bottom: 20px;">Product's Details</h3>
    <table class="table table-light table-bordered table-hover">
        <thead class="table-dark text-center">
        <tr>
            <th>S.No.</th>
            <th>Course Image</th>
            <th>Course Name</th>
            <th>Course Validity</th>
            <th>Course Price</th>
            <th>Trainer</th>
            <th>View Details</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
      </thead>
      <tbody>
      <c:set var="i" value="${(model_currentPage-1)*model_PageSize+1}"/>
        <c:forEach var="product" items="${model_List_Prod}">
            <tr class="text-center">
                <td>${i}.</td>
                <td><img src="${product.getCourseImage()}" alt="course_Image" height="100"/></td>
                <td>${product.getCourseName()}</td>
                <td>${product.getCourseValidity()}</td>
                <td>
                   <del class="text-danger">₹${product.getOriginalPrice()}</del> 
                   ₹${product.getDiscountedPrice()}
                </td>
                <td>${product.getTrainerName()}</td>
               <td>
					  <button type="button" class="btn btn-info btn-sm viewBtn"
					    data-name="${product.getCourseName()}"
					    data-syllabus="${product.getCourseSyllabus()}"
					    data-original="${product.getOriginalPrice()}"
					    data-discount="${product.getDiscountedPrice()}"
					    data-validity="${product.getCourseValidity()}"
					    data-courseimg="${product.getCourseImage()}"
					    data-trainer="${product.getTrainerName()}"
					    data-trainerdetails="${product.getTrainerDetails()}"
					    data-trainerimg="${product.getTrainerImage()}"
					    data-other="${product.getOtherDetails()}">
					    <i class="bi bi-eye"></i> View
					  </button>
				</td>
               <td>
				  <button type="button" class="btn btn-success updateBtn"
					    data-id="${product.getId()}"
					    data-name="${fn:escapeXml(product.getCourseName())}"
					    data-syllabus="${fn:escapeXml(product.getCourseSyllabus())}"
					    data-original="${product.getOriginalPrice()}"
					    data-discount="${product.getDiscountedPrice()}"
					    data-validity="${product.getCourseValidity()}"
					    data-courseimg="${product.getCourseImage()}"
					    data-trainer="${fn:escapeXml(product.getTrainerName())}"
					    data-trainerdetails="${fn:escapeXml(product.getTrainerDetails())}"
					    data-trainerimg="${product.getTrainerImage()}"
					    data-other="${fn:escapeXml(product.getOtherDetails())}">
					    <i class="bi bi-pencil-square"></i>
					</button>
				</td>
                <td>
                    <button type="button" class="btn btn-danger"
                      onclick="confirmDetailsDelete('${product.getId()}')">
                      <i class="bi bi-trash"></i>
                    </button>
                </td>
            </tr>
            <c:set var="i" value="${i+1}"/>
        </c:forEach>
      </tbody>
    </table>
 </div>

 <!-- ===================== Delete Product Modal ===================== -->
<div class="modal fade" id="deleteEmpConfirmationModel" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header bg-danger text-white">
        <h5 class="modal-title"><b>Delete Product</b></h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
        Are you sure you want to delete this product?
      </div>

      <div class="modal-footer">
        <a type="button" class="btn btn-danger" id="deleteEmployee">Delete</a>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	<!-- ===================== Update Product Modal ===================== -->
<div class="modal fade" id="updateEmployeeModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">

      <div class="modal-header bg-success text-white">
        <h5 class="modal-title"><b>Update Product</b></h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>

      <!-- Make sure modal-body has a max height to allow scroll -->
      <div class="modal-body" style="max-height: 70vh; overflow-y: auto;">
        <form action="/updateProductDetails" method="post" enctype="multipart/form-data">
          <input type="hidden" id="updateProdId" name="id">

          <div class="mb-3">
            <label class="form-label">Course Name</label>
            <input type="text" class="form-control" id="updateProdName" name="courseName" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Course Syllabus</label>
            <textarea class="form-control" id="updateProdSyllabus" name="courseSyllabus" rows="3" required></textarea>
          </div>

          <div class="mb-3">
            <label class="form-label">Original Price</label>
            <input type="number" class="form-control" id="updateProdOriginal" name="originalPrice" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Discounted Price</label>
            <input type="number" class="form-control" id="updateProdDiscount" name="discountedPrice" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Course Validity</label>
            <input type="text" class="form-control" id="updateProdValidity" name="courseValidity" required>
          </div>
		<div class="mb-3">
		  <label class="form-label">Course Image</label>
		  <!-- Display existing course image -->
		  <div class="mb-2 text-center">
		    <img id="updateCourseImagePreview" src="" alt="Course Image" class="img-fluid rounded border p-2 shadow-sm" style="max-height:150px;">
		  </div>
		  <input type="file" class="form-control" name="courseImageFile">
		</div>
          <div class="mb-3">
            <label class="form-label">Trainer Name</label>
            <input type="text" class="form-control" id="updateProdTrainer" name="trainerName" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Trainer Details</label>
            <textarea class="form-control" id="updateProdTrainerDetails" name="trainerDetails" rows="3" required></textarea>
          </div>

          <div class="mb-3">
            <label class="form-label">Trainer Image</label>
            <!-- Display existing Trainer image -->
		  <div class="mb-2 text-center">
		    <img id="updateTrainerImagePreview" src="" alt="Trainer Image" class="img-fluid rounded border p-2 shadow-sm" style="max-height:150px;">
		  </div>
          <input type="file" class="form-control" name="trainerImageFile">
          </div>

          <div class="mb-3">
            <label class="form-label">Other Details</label>
            <textarea class="form-control" id="updateProdOtherDetails" name="otherDetails" rows="2"></textarea>
          </div>

          <div class="modal-footer">
            <button type="submit" class="btn btn-success">Update</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          </div>

        </form>
      </div>
    </div>
  </div>
</div>
<!-- ========================= View Details Modal ===================== -->
	<div class="modal fade" id="viewProductModal" tabindex="-1">
	  <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	
	      <!-- Header -->
	      <div class="modal-header bg-info text-dark">
	        <h5 class="modal-title fw-bold">Product Details</h5>
	        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Body -->
	      <div class="modal-body">
	
	        <!-- ==============================
	             1️⃣ COURSE DETAILS SECTION
	        =============================== -->
	        <section>
	          <h4 class="fw-bold text-primary mb-3 border-bottom pb-2">
	            <i class="bi bi-journal-bookmark"></i> Course Details
	          </h4>
	
	          <div class="row align-items-center mb-4">
	            <!-- Left: Course Image -->
	            <div class="col-md-5 text-center mb-3">
	              <img id="viewCourseImage" src="" alt="Course Image"
	                   class="img-fluid rounded border p-2 shadow-sm" />
	            </div>
	
	            <!-- Right: Course Info -->
	            <div class="col-md-7">
	              <h5 id="viewCourseName" class="fw-bold text-primary mb-2"></h5>
	              <p><b>Course Validity:</b> <span id="viewCourseValidity"></span></p>
	              <p>
	                <b>Price:</b>
	                <del id="viewOriginalPrice" class="text-danger"></del>
	                <span id="viewDiscountedPrice" class="fw-bold text-success"></span>
	              </p>
	              <p><b>Course Syllabus:</b> <span id="viewCourseSyllabus"></span></p>
	            </div>
	          </div>
	        </section>
	
	        <hr>
	
	        <!-- ==============================
	             2️⃣ TRAINER DETAILS SECTION
	        =============================== -->
	        <section>
	          <h4 class="fw-bold text-primary mb-3 border-bottom pb-2">
	            <i class="bi bi-person-badge"></i> Trainer Details
	          </h4>
	
	          <div class="row align-items-center">
	            <div class="col-md-4 text-center mb-3">
	              <img id="viewTrainerImage" src="" alt="Trainer Image"
	                   class="img-fluid rounded-circle shadow-sm border" width="160" height="160" />
	            </div>
	            <div class="col-md-8">
	              <p><b>Name:</b> <span id="viewTrainerName"></span></p>
	              <p><b>About:</b> <span id="viewTrainerDetails"></span></p>
	            </div>
	          </div>
	        </section>
	
	        <hr>
	
	        <!-- ==============================
	             3️⃣ OTHER DETAILS SECTION
	        =============================== -->
	        <section>
	          <h4 class="fw-bold text-primary mb-3 border-bottom pb-2">
	            <i class="bi bi-info-circle"></i> Other Details
	          </h4>
	          <p id="viewOtherDetails" class="mb-0"></p>
	        </section>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>
