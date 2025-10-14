<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Enquiry History</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>
    <script type="text/javascript">
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
        <!-- Messages -->
        <c:if test="${not empty model_success}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${model_success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <c:if test="${not empty model_error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${model_error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Two Column Layout -->
        <div class="row">
            <!-- Left Column: Enquiry History -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <c:if test="${not empty model_custEnq}">
                         <h3 class="text-center mb-4">Customer History</h3>
                            <p>Below is the history of customer :
                                <b>${model_custEnq[0].name} (${model_custEnq[0].phoneNo})</b>
                            </p>
                        </c:if>

                        <c:choose>
                            <c:when test="${not empty model_custEnq}">
                                <table class="table table-bordered table-striped text-center align-middle">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Interested Course</th>
                                            <th>Discussion</th>
                                            <th>Enquiry Date/Time</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cust" items="${model_custEnq}" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${cust.interestedCourse}</td>
                                                <td>${cust.discussion}</td>
                                                <td>${cust.enquiryDate} / ${cust.enquiryTime}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-info text-center">
                                    No enquiry history found for this phone number.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <!-- Right Column: Add New Enquiry Form -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="text-center mb-3">Add New Enquiry</h5>
                        <form:form action="custEnquiryForm" method="post" modelAttribute="modelCustEnquiryAttr">
							
							<form:hidden path="phoneNo" value="${model_custEnq[0].phoneNo}"/>
							<form:hidden path="custEnquiry.name" value="${model_custEnq[0].name}"/>
                            <!-- Interested Course -->
                            <div class="mb-3">
                                <label for="interestedCourse">Interested Course</label>
                                <form:select cssClass="form-select" id="interestedCourse" path="custEnquiry.interestedCourse">
                                    <form:option value="">Select Course</form:option>
                                    <form:options items="${model_coursename_list}"/>
                                </form:select>
                                <form:errors path="custEnquiry.interestedCourse" cssClass="text-danger"/>
                            </div>
                            <!-- Discussion -->
                            <div class="mb-3">
                                <label for="discussion">Discussion</label>
                                <form:textarea cssClass="form-control" id="discussion" path="custEnquiry.discussion" placeholder="Enter Discussion..."/>
                                <form:errors path="custEnquiry.discussion" cssClass="text-danger"/>
                            </div>

                            <!-- Enquiry Type -->
                            <div class="mb-3">
                                <label for="enquiryType">Enquiry Type</label>
                                <form:select cssClass="form-select" id="enquiryType" path="custEnquiry.enquiryType">
                                    <form:option value="">Select Enquiry Type</form:option>
                                    <form:option value="Call">Call</form:option>
                                    <form:option value="Mail">Mail</form:option>
                                    <form:option value="Website">Website</form:option>
                                    <form:option value="Social Networking">Social Networking</form:option>
                                </form:select>
                                <form:errors path="custEnquiry.enquiryType" cssClass="text-danger"/>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <label for="status">Status</label>
                                <form:select cssClass="form-select" id="status" path="custEnquiry.status" onchange="handleOption()">
                                    <form:option value="">Select Status</form:option>
                                    <form:option value="1">Open (1)</form:option>
                                    <form:option value="2">Interested (2)</form:option>
                                    <form:option value="3">Not Interested (3)</form:option>
                                    <form:option value="4">Purchased (4)</form:option>
                                </form:select>
                                <form:errors path="custEnquiry.status" cssClass="text-danger"/>
                            </div>

                            <!-- Follow Up -->
                            <div class="mb-3">
                                <label for="followupdate">Follow Up Date</label>
                                <form:input type="date" cssClass="form-control" id="followupdate" path="custFollowUp.followupdate"/>
                                <form:errors path="custFollowUp.followupdate" cssClass="text-danger"/>
                            </div>

                            <!-- Call To -->
                            <div class="mb-4">
                                <label for="callTo">Call To</label>
                                <form:select cssClass="form-select" id="callTo" path="custEnquiry.callTo">
                                    <form:option value="">Select Call To</form:option>
                                    <form:option value="Customer to Company">Customer to Company</form:option>
                                    <form:option value="Company to Customer">Company to Customer</form:option>
                                </form:select>
                                <form:errors path="custEnquiry.callTo" cssClass="text-danger"/>
                            </div>

                            <!-- Submit -->
                            <button type="submit" id="buttonSubmit" class="btn btn-primary w-100">
                                Add Enquiry
                            </button>

                        </form:form>
                    </div>
                </div>
            </div>
        </div> <!-- row end -->
    </div> <!-- container end -->
</body>
</html>
