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

	Drink product = dao.getDrinkById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoDrinkId.jsp");
	}

	ArrayList<Drink> goodsList = dao.getAlldrinks();
	Drink goods = new Drink();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getDrinkId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Drink> list = (ArrayList<Drink>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Drink>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Drink goodsQnt = new Drink();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getDrinkId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getDrinkQuantity() + 1;
			goodsQnt.setDrinkQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setDrinkQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("drink.jsp?id=" + id);
%>