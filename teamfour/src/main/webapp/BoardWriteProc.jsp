<%@page import="java.sql.SQLException"%>
<%@page import="com.reboard.model.ReboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="boardVO" class="com.reboard.model.ReboardVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="reboardService" class="com.reboard.model.ReboardService"
	scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");

	try{
		int cnt=reboardService.insertBoard(boardVO);
		if(cnt>0){
		response.sendRedirect("BoardList.jsp");
	    }
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>