<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>주류 등록</title>
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message" >
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><fmt:message key="title" /></h1>
        <p class="col-md-8 fs-4">Drink Addition</p>      
      </div>
    </div>
  
  <div class="row align-items-md-stretch">	
  		<div class="text-end"> 
			<a href="?language=ko" >Korean</a> | <a href="?language=en" >English</a>
			<a href = "logout.jsp" class ="btn btn-sm btn-success pull right">logout</a>
		</div>	 	
		<form name="newDrink" action="./processAddDrink.jsp" method="post" enctype="multipart/form-data">		
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkId" /></label>
				<div class="col-sm-3">
					<input type="text" name="drinkId" id="drinkId" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkName" /></label>
				<div class="col-sm-3">
					<input type="text" name="drinkName" id="drinkName" class="form-control" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkPrice" /></label>
				<div class="col-sm-3">
					<input type="text" name="drinkPrice" id="drinkPrice" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="ABV" /></label>
				<div class="col-sm-3">
					<input type="text" name="ABV" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkVolume" /></label>
				<div class="col-sm-3">
					<input type="text" name="drinkVolume" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkPRO" /></label>
				<div class="col-sm-3">
					<input type="text" name="drinkPRO" class="form-control">
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkInfo" /></label>
				<div class="col-sm-5">
					<textarea name="drinkInfo" id="drinkInfo" cols="50" rows="2" 
						class="form-control" placeholder="100자 이상 적어주세요"></textarea>
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkCategory" /></label>
				<div class="col-sm-3">
					<input type="text" name="drinkCategory" class="form-control" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkStock" /></label>
				<div class="col-sm-3">
					<input type="text" name="drinkStock" id = "drinkStock" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkAged" /></label>
				<div class="col-sm-5">
					<input type="text" name="drinkAged" id = "drinkAged" class="form-control" >
				</div>				
			</div>		
			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="drinkImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="drinkImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button" />" onclick="CheckAddDrink()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</div>	
</fmt:bundle>
</body>
</html>
