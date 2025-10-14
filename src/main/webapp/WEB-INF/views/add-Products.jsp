<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Course</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="header-admin.jsp"/>

    <div class="container-fluid pt-3">
	
        <!-- Success Alert -->
        <c:if test="${not empty model_success}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${model_success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Error Alert -->
        <c:if test="${not empty model_error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${model_error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <div class="row">
            <div class="col-3"></div>
            <div class="col-6 bg-light p-4 rounded shadow-sm">
                <h4 class="text-center mb-4">Add Course Details</h4>

                <form:form action="addCourseForm" method="post" enctype="multipart/form-data" modelAttribute="courseModel">

                    <div class="mb-3">
                        <label for="name" class="form-label">Course Name</label>
                        <form:input path="courseName" id="name" cssClass="form-control" placeholder="Enter course name"/>
                    </div>

                    <div class="mb-3">
                        <label for="syllabus" class="form-label">Course Syllabus</label>
                        <form:textarea path="courseSyllabus" id="syllabus" cssClass="form-control" placeholder="Enter course syllabus"/>
                    </div>

                    <div class="mb-3">
                        <label for="originalPrice" class="form-label">Original Price</label>
                        <form:input path="originalPrice" id="originalPrice" cssClass="form-control" placeholder="Enter original price"/>
                    </div>

                    <div class="mb-3">
                        <label for="discountedPrice" class="form-label">Discounted Price</label>
                        <form:input path="discountedPrice" id="discountedPrice" cssClass="form-control" placeholder="Enter discounted price"/>
                    </div>

                    <div class="mb-3">
                        <label for="validity" class="form-label">Course Validity</label>
                        <form:input path="courseValidity" id="validity" cssClass="form-control" placeholder="Enter validity"/>
                    </div>

                    <!-- Course Image -->
                    <div class="mb-3">
                        <label for="courseImage" class="form-label">Course Image</label>
                        <input type="file" name="courseImageFile" id="courseImage" class="form-control"/>
                    </div>

                    <div class="mb-3">
                        <label for="trainerName" class="form-label">Trainer's Name</label>
                        <form:input path="trainerName" id="trainerName" cssClass="form-control" placeholder="Enter trainer name"/>
                    </div>

                    <div class="mb-3">
                        <label for="trainerDetails" class="form-label">Trainer's Details</label>
                        <form:textarea path="trainerDetails" id="trainerDetails" cssClass="form-control" rows="3" placeholder="Enter trainer details"/>
                    </div>

                    <!-- Trainer Image -->
                    <div class="mb-3">
                        <label for="trainerImage" class="form-label">Trainer Image</label>
                        <input type="file" name="trainerImageFile" id="trainerImage" class="form-control"/>
                    </div>

                    <div class="mb-3">
                        <label for="otherDetails" class="form-label">Other Details</label>
                        <form:textarea path="otherDetails" id="otherDetails" cssClass="form-control" rows="3" placeholder="Enter other details"/>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Add Course</button>
                </form:form>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
</body>
</html>
