<%@page import="com.teamfour.cart.model.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "include/subtop2.jsp" %>
<jsp:useBean id="cartService" class="com.teamfour.cart.model.CartService"
	scope="session"></jsp:useBean>

<%
	request.setCharacterEncoding("utf-8");
	
	int cartLength = (int)request.getAttribute("cartLength");
	// 카트 페이지의 list의 length만 받아오기
	// list를 통째로 받아오면 qty 변경이 반영되기 힘들 것 같음
	
	// 카트에서 변경시킨 qty를 받아오는 방법???
	// post로 값들을 받아오는 것 자체는 확정
	// 아니면 js에서 click function으로 새 list에 add로 집어넣은 뒤에 setAttribute?
			
	// 이 페이지에서 최종확인 + 주소 입력을 할 것인지 아니면 카트 페이지에서 받아오고 이 페이지에선 바로 처리할지
	
%>

<section>

</section>


<%@ include file="../include/bottom.jsp"%>