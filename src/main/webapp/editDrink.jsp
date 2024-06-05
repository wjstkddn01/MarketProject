<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>


<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>주류 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 주류를 삭제합니다!!") == true)
			location.href = "./deleteDrink.jsp?id=" + id;
		else
			return;
	}
</script>

</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">주류 편집</h1>
        <p class="col-md-8 fs-4">DrinkEditing</p>      
      </div>
    </div>
    <%@ include file="dbconn.jsp" %>
     <div class="row align-items-md-stretch   text-center">
	<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from hanjanhae";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
      
	
	
     	<div class="col-md-4">
       		<div class="h-100 p-2 round-3">		
       		    <img src="./resources/images/<%=rs.getString("h_filename")%>" style="width: 250; height:350" />	
				<p><h5><b><%=rs.getString("h_drinkName")%></b></h5>
				<p><%=rs.getString("h_ABV")%>
				<br> <%=rs.getString("h_drinkVolume")%> | <%=rs.getString("h_drinkPrice")%>원
				<p> <%=rs.getString("h_drinkInfo").substring(0,40)%>....
				<p><%=rs.getString("h_drinkPrice")%>원
				<p><%
						if (edit.equals("update")) {
					%>
					<a href="./updateDrink.jsp?id=<%=rs.getString("h_drinkId")%>" class="btn btn-success" role="button"> 수정 &raquo;></a>
					
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("h_drinkId")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>	
			</div>	
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
	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>
