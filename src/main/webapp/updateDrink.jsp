<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />

<title>주류 수정</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">주류 수정</h1>
        <p class="col-md-8 fs-4">Drink Updating</p>      
      </div>
    </div>
  <%@ include file="dbconn.jsp"%>
  <%
		String drinkId = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from hanjanhae where h_drinkId = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, drinkId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>		
	 <div class="row align-items-md-stretch">	  	
		
		<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("h_filename")%>" alt="image" style="width: 100%" />
			</div>
		<div class="col-md-7">	
		<form name="newDrink" action="./processUpdateDrink.jsp" method="post" enctype ="multipart/form-data">
		
			
			<div class="mb-3 row">
				<label class="col-sm-2">주류코드</label>
				<div class="col-sm-5">
					<input type="text" name="drinkId" id="drinkId" class="form-control" value='<%=rs.getString("h_drinkId")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">주류명</label>
				<div class="col-sm-5">
					<input type="text" name="drinkName" id="drinkName" class="form-control" value='<%=rs.getString("h_drinkName")%>'>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">주류 가격</label>
				<div class="col-sm-5">
					<input type="text" name="drinkPrice"  id="drinkPrice"class="form-control" value='<%=rs.getString("h_drinkPrice")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">도수</label>
				<div class="col-sm-5">
					<input type="text" name="ABV" class="form-control" value='<%=rs.getString("h_ABV")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">용량</label>
				<div class="col-sm-5">
					<input type="text" name="drinkVolume" class="form-control" value='<%=rs.getString("h_drinkVolume")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">제조일</label>
				<div class="col-sm-5">
					<input type="text" name="drinkPRO" class="form-control" value='<%=rs.getString("h_drinkPRO")%>'>
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-8">
					<textarea  name="drinkInfo" id="drinkInfo" cols="50" rows="2"
						class="form-control" placeholder="20자 이상 적어주세요"><%=rs.getString("h_drinkInfo")%></textarea>
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-5">
					<input type="text" name="drinkCategory" class="form-control" value='<%=rs.getString("h_drinkCategory")%>'>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-5">
					<input type="text" name="drinkStock" id="drinkStock"class="form-control" value='<%=rs.getString("h_drinkStock")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">술 aged</label>
				<div class="col-sm-5">
					<input type="text" name="drinkAged" id="drinkAged"class="form-control" value='<%=rs.getString("h_drinkAged")%>'>
				</div>				
			</div>		
			
			<div class="mb-3 row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-8">
					<input type="file" name="drinkImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록 " >
				</div>
			</div>
		</form>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
	<jsp:include page="footer.jsp" />
</div>	

</body>
</html>
