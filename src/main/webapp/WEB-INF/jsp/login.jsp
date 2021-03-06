<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<br>
<br>
<br>
<br>
<br>
<br>
<script type="text/javascript">
	$(document).ready(function() {

		$("form").validate({

			rules : {
				userName : {
					required : true
				},
				password : {
					required : true
				}
			},
			messages : {
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script>



<div class="row">
	<c:if test="${param.success eq true}">
		<div class="alert alert-success">Sign up is successful, please
			log in.</div>
	</c:if>
	<c:if test="${param.success eq false}">
		<div class="alert alert-danger">Your username and or password is
			incorrect.</div>
	</c:if>
	<div class="container-fluid bg-1 item img-size-box">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-10 login-margin-input">
				<br> <br> <br> <br>
				<div class="form-group">
					<c:url var="formAction" value="/login" />
					<form method="POST" action="${formAction}">
						<input type="hidden" name="destination"
							value="${param.destination}" /> <input type="hidden"
							name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> <label for="userName"
							style="color: #fff; margin-top: -20px;">User Name: </label> <input
							type="text" id="userName" name="userName" placeHolder="User Name"
							class="form-control" />

						<div class="form-group">
							<label for="password" style="color: #fff;">Password: </label> <input
								type="password" id="password" name="password"
								placeHolder="Password" class="form-control" />
						</div>
						<button type="submit" class="btn btn-default">Login</button>
					</form>
				</div>
			</div>
		<div class="col-sm-2"></div>
		</div>
	</div>
</div>
<br>
<br>
<br>
<br>
<c:import url="/WEB-INF/jsp/footer.jsp" />