<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<jsp:useBean id="sellerInfoService" class="com.sellerinfo.model.SellerInfoService"
scope="session"></jsp:useBean>
<%
	String d_sellerid = (String)session.getAttribute("d_sellerid");
	String pwd = request.getParameter("pwd");
	
	try{
		boolean bool = sellerInfoService.deleteSeller(d_sellerid, pwd);
		
		if(bool==false){
			Cookie cookie = new Cookie("ck_sellerid", d_sellerid);
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			session.invalidate();
			%>
			<script type="text/javascript">
			alert('탈퇴성공...');
			location.href="<%=request.getContextPath()%>/mainpage.jsp";
			</script>
			
		<%}else{%>
		
			<script type="text/javascript">
			alert('비밀번호가 맞지 않는 모양인가보네요');
			location.href="<%=request.getContextPath()%>/mainpage.jsp";
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
	

%>
</body>
</html>