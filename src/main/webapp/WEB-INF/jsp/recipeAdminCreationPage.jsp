<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<style>
.box-size1 {
    height:150px;
    width:500px;
    font-size:12pt;
    border-radius: 7px; 
}
</style>



<script type="text/javascript">
	$(document).ready(function() {

		$("#error-input").validate({

			rules : {
				recipeName : {
					required : true
				},
				servingSize : {
					required : true,
					number : true
				},
				prepTime : {
					required : true,
					number : true
				},
				ingredients : {
					required : true
				},
				instructions : {
					required : true
				}

			},
			messages : {

			},
			errorClass : "error"
		});
	});
</script>

<section class="bg-1">

	<c:url value="/recipeAdminCreationPage" var="registration" />

	<form:form class="container" id="error-input" action="${registration}"
		method="POST" modelAttribute="recipe">
		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
		<!-- have this for every form we have!!!! -->
		<div class="row">
			<br> <br> <br>
			<div class="col-sm-4">
				<label class="white-font" for="recipeName">Recipe Name</label>
				<div>
					<form:input name="recipeName" id="recipeName" path="recipeName"
						placeHolder="Recipe name" class="form-control grey-font" />
					<form:errors path="recipeName" cssClass="error" style="color:red" />
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<label class="white-font" for="servingSize">Serving Size</label>
				<div>
					<form:input name="servingSize" path="servingSize"
						placeHolder="Number of servings."
						class="form-control grey-font" id="servingSize" />
					<form:errors path="servingSize" cssClass="error" style="color:red" />
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<label class="white-font" for="prepTime">Prep Time</label>
				<div>
					<form:input name="prepTime" path="prepTime"
						placeHolder="Time in minutes."
						class="form-control grey-font" id="prepTime" />
					<form:errors path="prepTime" cssClass="error" style="color:red" />
				</div>
			</div>
		</div>
		<br>
		<div>
			<label class="white-font" for="ingredients">Ingredients
				Needed</label>
			<div>
				<form:textarea path="ingredients"
					placeHolder="Ingredients separated by a comma" id="ingredients"
					class="box-size1 grey-font" rows="5"></form:textarea>
				<form:errors path="ingredients" cssClass="error" style="color:red" />
				<%-- <form:errors path="passwordMatching" cssClass="error" style="color:red"/> --%>
			</div>
		</div>
		<br>
		<div>
			<label class="white-font" for="instructions">Cooking
				Instructions</label>
			<div>
				<form:textarea path="instructions"
					placeHolder="Ingredients separated by a comma" id="instructions"
					class="box-size1 grey-font" rows="5"></form:textarea>
				<form:errors path="instructions" cssClass="error" style="color:red" />
			</div>
		</div>
		<br><br> <br> <br>
		<!--///////////uplaod photo code  -->
		<!-- <input type="file" onchange="previewFile()"><br>
<img src="" height="200" alt="Image preview..."> -->
		<!-- <script>
   function previewFile(){
       var preview = document.querySelector('img'); //selects the query named img
       var file    = document.querySelector('input[type=file]').files[0]; //sames as here
       var reader  = new FileReader();

       reader.onloadend = function () {
           preview.src = reader.result;
       }

       if (file) {
           reader.readAsDataURL(file); //reads the data as a URL
       } else {
           preview.src = "";
       }
  }

  previewFile();  //calls the function named previewFile()
  </script>  -->
		<!-- 	///////tag box -->
		<div class="form-group">

			<div id="tagsDiv">
				<br />
			</div>
			<div class="form-group">
				<label class="white-font"> Add Tags</label> <input type="text"
					name="tags" id="testInput" placeholder="Tags separated by comma"
					class="typeahead tm-input form-control tm-input-info grey-font"
					onchange="appendTagsToDiv(this)" />
			</div>

			<!-- ///////tag box end -->
			<div>
				<input type="submit" value="Submit!" id="submit-button" />
			</div>
			<div class="col-sm-4"></div>
			<br> <br> <br>
		</div>
	</form:form>
	
</section>
<br> <br> <br><br> <br> <br><br> <br> <br><br> <br> <br><br> <br> <br><br> <br> <br>
<c:import url="/WEB-INF/jsp/footer.jsp" />