<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Drink"%>
<%@ page import="dao.DrinkRepository"%>
<%@ page errorPage="exceptionNoDrinkId.jsp"%>

<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">

<title>주류 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("이 주류를 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">주류정보</h1>
        <p class="col-md-8 fs-4">DrinkInfo</p>      
      </div>
    </div>
	
	<%
		String id = request.getParameter("id");
	    DrinkRepository dao = DrinkRepository.getInstance();
	    Drink drink = dao.getDrinkById(id);
	%>
	 <div class="row align-items-md-stretch">	 	
	 		<div class="col-md-5">
				<img src="./resources/images/<%=drink.getFilename()%>" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3><b><%=drink.getDrinkName()%></b></h3>
				<p><%=drink.getDrinkInfo()%>
				<p><b>주류코드 : </b><span class="badge text-bg-danger"> <%=drink.getDrinkId()%></span>							
				<p><b>도수</b> : <%=drink.getABV()%>	
				<p><b>용량</b> : <%=drink.getDrinkVolume()%>		
				<p><b>제조일</b> : <%=drink.getDrinkPRO()%>					
				<p><b>분류</b> : <%=drink.getDrinkCategory()%>
				<p><b>재고수</b> : <%=drink.getDrinkStock()%>
				<h4><%=drink.getDrinkAged()%>년</h4>
				<h4><%=drink.getDrinkPrice()%>원</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=drink.getDrinkId()%>" method="post"><a href="#" class="btn btn-info" onclick="addToCart()"> 주류주문 &raquo;</a>
				    <a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>	 
					<a href="./drinks.jsp" class="btn btn-secondary"> 주류목록 &raquo;</a>
					</form>
			</div>
		</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
