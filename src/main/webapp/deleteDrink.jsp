<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String drinkId = request.getParameter("id");

	PreparedStatement pstmt = null;	
	ResultSet rs = null;

	String sql = "select * from hanjanhae";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "delete from hanjanhae where h_drinkId = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, drinkId);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 주류가 없습니다");
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editDrink.jsp?edit=delete");
%>
