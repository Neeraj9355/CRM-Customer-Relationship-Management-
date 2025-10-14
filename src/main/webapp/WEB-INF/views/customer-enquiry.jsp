<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Enquiry</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>

    <script type="text/javascript">
    $(document).ready(function() {
        $('#phoneNoInput').keyup(function() {
            var phoneNumber = $(this).val();

            // Run AJAX only if 10 digits entered
            if (phoneNumber.length === 10 && /^\d+$/.test(phoneNumber)) {
                $.ajax({
                    url: "/checkPhoneNumberAvailability",
                    data: { phoneNumber: phoneNumber },
                    success: function(response) {
                        console.log("Server response:", response);

                        if (response.trim() === "exists") {
                            $('#phoneNoInput').addClass("is-invalid");

                            // Disable input fields
                            $('#name').prop('readonly', true);
                            $('#interestedCourse').prop('disabled', true);
                            $('#discussion').prop('readonly', true);
                            $('#enquiryType').prop('disabled', true);
                            $('#status').prop('disabled', true);
                            $('#followupdate').prop('readonly', true);
                            $('#callTo').prop('disabled', true);
                            $('#buttonSubmit').prop('disabled', true);

                            $('#getHistoryButton').show();
                        } else {
                            $('#phoneNoInput').removeClass("is-invalid");

                            // Enable input fields
                            $('#name').prop('readonly', false);
                            $('#interestedCourse').prop('disabled', false);
                            $('#discussion').prop('readonly', false);
                            $('#enquiryType').prop('disabled', false);
                            $('#status').prop('disabled', false);
                            $('#followupdate').prop('readonly', false);
                            $('#callTo').prop('disabled', false);
                            $('#buttonSubmit').prop('disabled', false);

                            $('#getHistoryButton').hide();
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("AJAX error:", error);
                    }
                });
            } else {
                // Reset state while typing (< 10 digits)
                $('#phoneNoInput').removeClass("is-invalid");
                $('#getHistoryButton').hide();
            }
        });
    });

    function custEnquiry() {
        var phoneNumber = $('#phoneNoInput').val();
        if (phoneNumber.trim() !== '') {
            window.location.href = "/custEnquiryHistoryPage?phNo=" + encodeURIComponent(phoneNumber);
        }
    }
    function handleOption() {
        var statusOption = $('#status').val();
        if (statusOption === "1") {
            $('#followupdate').prop('readonly', false);
        } else {
            $('#followupdate').prop('readonly', true).val('');
        }
    }
    </script>
</head>

<body>
    <!-- Header Include -->
    <jsp:include page="header-employee.jsp"/>

    <div class="container-fluid pt-4">
        <!-- Success Message -->
        <c:if test="${not empty model_success}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${model_success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty model_error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${model_error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Form -->
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8 bg-light p-4 rounded shadow-sm mb-5">
                <h4 class="text-center mb-4">Customer Enquiry</h4>

                <form:form action="custEnquiryForm" method="post" modelAttribute="modelCustEnquiryAttr">
                    <!-- Phone Number -->
                    <div class="form-group mb-3">
                        <label for="phoneNoInput">Phone Number</label>
                        <form:input cssClass="form-control" id="phoneNoInput" path="phoneNo" placeholder="Enter Phone Number"/>
                        <button type="button" id="getHistoryButton" class="btn btn-success mt-2" style="display:none;" onclick="custEnquiry()">Get History</button>
                        <form:errors path="phoneNo" cssClass="error_message_design"/>
                    </div>

                    <!-- Name -->
                    <div class="form-group mb-3">
                        <label for="name">Name</label>
                        <form:input cssClass="form-control" id="name" path="custEnquiry.name" placeholder="Enter Name"/>
                        <form:errors path="custEnquiry.name" cssClass="error_message_design"/>
                    </div>

                    <!-- Interested Course -->
                    <div class="form-group mb-3">
                        <label for="interestedCourse">Interested Course</label>
                        <form:select cssClass="form-select" id="interestedCourse" path="custEnquiry.interestedCourse">
                            <form:option value="">Select Course</form:option>
                            <form:options items="${model_coursename_list}"/>
                        </form:select>
                        <form:errors path="custEnquiry.interestedCourse" cssClass="error_message_design"/>
                    </div>

                    <!-- Discussion -->
                    <div class="form-group mb-3">
                        <label for="discussion">Discussion</label>
                        <form:textarea cssClass="form-control" id="discussion" path="custEnquiry.discussion" placeholder="Enter Discussion..."/>
                        <form:errors path="custEnquiry.discussion" cssClass="error_message_design"/>
                    </div>

                    <!-- Enquiry Type -->
                    <div class="form-group mb-3">
                        <label for="enquiryType">Enquiry Type</label>
                        <form:select cssClass="form-select" id="enquiryType" path="custEnquiry.enquiryType">
                            <form:option value="">Select Enquiry Type</form:option>
                            <form:option value="Call">Call</form:option>
                            <form:option value="Mail">Mail</form:option>
                            <form:option value="Website">Website</form:option>
                            <form:option value="Social Networking">Social Networking</form:option>
                        </form:select>
                        <form:errors path="custEnquiry.enquiryType" cssClass="error_message_design"/>
                    </div>

                    <!-- Status -->
                    <div class="form-group mb-3">
                        <label for="status">Status</label>
                        <form:select cssClass="form-select" id="status" path="custEnquiry.status" onchange="handleOption()">
                            <form:option value="">Select Status</form:option>
                            <form:option value="1">Open (1)</form:option>
                            <form:option value="2">Interested (2)</form:option>
                            <form:option value="3">Not Interested (3)</form:option>
                            <form:option value="4">Purchased (4)</form:option>
                        </form:select>
                        <form:errors path="custEnquiry.status" cssClass="error_message_design"/>
                    </div>

                    <!-- Follow Up -->
                    <div class="form-group mb-3">
                        <label for="followupdate">Follow Up Date</label>
                        <form:input type="date" cssClass="form-control" id="followupdate" path="custFollowUp.followupdate"/>
                        <form:errors path="custFollowUp.followupdate" cssClass="error_message_design"/>
                    </div>

                    <!-- Call To -->
                    <div class="form-group mb-4">
                        <label for="callTo">Call To</label>
                        <form:select cssClass="form-select" id="callTo" path="custEnquiry.callTo">
                            <form:option value="">Select Call To</form:option>
                            <form:option value="Customer to Company">Customer to Company</form:option>
                            <form:option value="Company to Customer">Company to Customer</form:option>
                        </form:select>
                        <form:errors path="custEnquiry.callTo" cssClass="error_message_design"/>
                    </div>

                    <!-- Submit -->
                    <button type="submit" id="buttonSubmit" class="btn btn-primary w-100">Add Enquiry</button>
                </form:form>
            </div>
            <div class="col-lg-2"></div>
        </div>
    </div>
</body>
</html>
