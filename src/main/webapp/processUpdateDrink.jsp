<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");


	String filename = "";
	//String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로


	String realFolder = "C:\\web_server\\Hanjanhae\\src\\main\\webapp\\resources\\images";
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	
	
	String drinkId = multi.getParameter("drinkId");
	String drinkName = multi.getParameter("drinkName");
	String drinkPrice = multi.getParameter("drinkPrice");
	String ABV = multi.getParameter("ABV");
	String drinkVolume = multi.getParameter("drinkVolume");
	String drinkPRO = multi.getParameter("drinkPRO");	
	String drinkInfo = multi.getParameter("drinkInfo");	
	String drinkCategory = multi.getParameter("drinkCategory");
	String drinkStock = multi.getParameter("drinkStock");
	String drinkAged = multi.getParameter("drinkAged");

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	int price;

	if (drinkPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(drinkPrice);

	long stock;

	if (drinkStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(drinkStock);
	
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from hanjanhae where h_drinkId = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, drinkId);
	rs = pstmt.executeQuery();	
	
	
	if (rs.next()) {		
		if (fileName != null) {
			sql = "UPDATE hanjanhae SET h_drinkName=?, h_drinkPrice=?, h_ABV=?, h_drinkInfo=?, h_drinkVolume=?, h_drinkCategory=?, h_drinkStock=?, h_drinkPRO=?, h_drinkAged=?, h_fileName=? WHERE h_drinkId=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, drinkName);
			pstmt.setInt(2, price);
			pstmt.setString(3, ABV);
			pstmt.setString(4, drinkInfo);
			pstmt.setString(5, drinkVolume);
			pstmt.setString(6, drinkCategory);
			pstmt.setLong(7, stock);
			pstmt.setString(8, drinkPRO);		
			pstmt.setString(9, drinkAged);	
			pstmt.setString(10, fileName);	
			pstmt.setString(11, drinkId);	
			pstmt.executeUpdate();
			
					
		} else {
			sql = "UPDATE hanjanhae SET h_drinkName=?, h_drinkPrice=?, h_ABV=?, h_drinkInfo=?, h_drinkVolume=?, h_drinkCategory=?, h_drinkStock=?, h_drinkPRO=?, h_drinkAged=? WHERE h_drinkId=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, drinkName);
			pstmt.setInt(2, price);
			pstmt.setString(3, ABV);
			pstmt.setString(4, drinkInfo);
			pstmt.setString(5, drinkVolume);
			pstmt.setString(6, drinkCategory);
			pstmt.setLong(7, stock);
			pstmt.setString(8, drinkPRO);		
			pstmt.setString(9, drinkAged);			
			pstmt.setString(10, drinkId);	
			pstmt.executeUpdate();
		}		
	}
	

	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	

	response.sendRedirect("editDrink.jsp?edit=update");

%>
