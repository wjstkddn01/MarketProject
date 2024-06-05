<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");


	String filename = "";

	String realFolder = "C:\\web_server\\Hanjanhae\\src\\main\\webapp\\resources\\images";
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	String encType = "utf-8"; //인코딩 타입
	

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

	String sql = "insert into hanjanhae values(?,?,?,?,?,?,?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, drinkId);
	pstmt.setString(2, drinkName);
	pstmt.setInt(3, price);
	pstmt.setString(4, ABV);
	pstmt.setString(5, drinkInfo);
	pstmt.setString(6, drinkVolume);
	pstmt.setString(7, drinkCategory);
	pstmt.setLong(8, stock);
	pstmt.setString(9, drinkPRO);	
	pstmt.setString(10, drinkAged);
	pstmt.setString(11, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	response.sendRedirect("drinks.jsp");

%>
