<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Drink"%>
<%@ page import="dao.DrinkRepository"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("drinks.jsp");
		return;
	}

	DrinkRepository dao = DrinkRepository.getInstance();
	
	Drink drink = dao.getDrinkById(id);
	if (drink == null) {
		response.sendRedirect("exceptionNoDrinkId.jsp");
	}

	ArrayList<Drink> cartList = (ArrayList<Drink>) session.getAttribute("cartlist");
	Drink goodsQnt = new Drink();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getDrinkId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
