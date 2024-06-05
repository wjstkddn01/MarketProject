<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">

<title>주류 목록</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	
   
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">주류목록</h1>
        <p class="col-md-8 fs-4">drinkList</p>      
      </div>
    </div>
    <%@ include file = "dbconn.jsp" %> 
	 <div class="row align-items-md-stretch text-center">	 	
	 <%
	    PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from hanjanhae";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
	  %>
     	<div class="col-md-4">
       		<div class="h-100 p-2">	
       			<img src="./resources/images/<%=rs.getString("h_filename")%>" style="width: 250; height:350" />		
				<h5><b><%=rs.getString("h_drinkName")%></b></h5>
				<p><%=rs.getString("h_ABV")%>
				<br> <%=rs.getString("h_drinkVolume")%> | <%=rs.getString("h_drinkPrice")%>원
				<p> <%=rs.getString("h_drinkInfo").substring(0,30)%>....
				<p><%=rs.getString("h_drinkPrice")%>원
				<p><a href="./drink.jsp?id=<%=rs.getString("h_drinkId")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>	</div>	
		</div>			
		<%
			}
			if(rs!=null)
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
