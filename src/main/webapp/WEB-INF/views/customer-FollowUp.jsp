<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Follow Up</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>

    <script type="text/javascript">
        function getSelectedDate() {
            var selectedDate = $('#followUpDate').val();
            if (selectedDate) {
                window.location.href = '/customerFollowUp?followUpDate=' + selectedDate;
            }
        }
        function custEnquiry(phoneNumber){
			if(phoneNumber != ' '){
				window.location.href="/custEnquiryHistoryPage?phNo="+encodeURIComponent(phoneNumber);
			}
        }
    </script>
</head>

<body>
    <!-- Header Include -->
    <jsp:include page="header-employee.jsp"/>

    <div class="container-fluid pt-4">
        <!-- Content -->
        <div class="row justify-content-center">
            <div class="col-md-8 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Customer Follow-Up</h3>

                        <p class="text-muted text-center">
                            Below are the customers scheduled for a follow-up call today.
                        </p>

                        <div class="mb-3">
                            <label for="followUpDate" class="form-label">Or choose another date:</label>
                            <input type="date" id="followUpDate" class="form-control"
                                   name="followUpDate" onchange="getSelectedDate()"
                                   value="${param.followUpDate != null ? param.followUpDate : ''}"/>
                        </div>

                        <!-- Follow-up Table -->
                        <div id="followUpTableContainer">
                            <c:choose>
                                <c:when test="${not empty model_followUps}">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped text-center align-middle">
                                            <thead class="table-dark">
                                                <tr>
                                                    <th>Sr. No.</th>
                                                    <th>Phone No.</th>
                                                    <th>Get History</th>
                                                </tr>
                                            </thead>
                                            <tbody id="followUpTableBody">
                                                <c:forEach var="followUp" items="${model_followUps}" varStatus="loop">
                                                    <tr>
                                                        <td>${loop.index + 1}</td>
                                                        <td>${followUp.phoneNo}</td>
                                                        <td>
                                                            <button class="btn btn-sm btn-info" onclick="custEnquiry('${followUp.phoneNo}')">
                                                                View
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="alert alert-info text-center mb-0" id="error">
                                        No follow-ups scheduled for this date.
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
