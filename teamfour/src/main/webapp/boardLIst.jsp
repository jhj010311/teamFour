<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.teamfour.board.model.BoardService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.teamfour.board.model.BoardVO"%>
<%@page import="com.teamfour.board.model.BoardPagingVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//페이징 작업
	int currentPage = 1;
	int totalRecord = 0;
	int pageSize = 10;
	int blockSize = 10;
	
	BoardPagingVO pageVo = new BoardPagingVO(currentPage, totalRecord, pageSize, blockSize);
	
<<<<<<< HEAD
	List<BoardVO>boardDao
	//3.
=======
	int num = pageVo.getNum();
	int firstPage = pageVo.getFirstPage();
	int lastPage = pageVo.getLastPage();
	int curPos = pageVo.getCurPos();
>>>>>>> branch 'main' of https://github.com/jhj010311/teamFour.git
	
	//db작업
	BoardService boardService = new BoardService();
	List<BoardVO> list = null;
	try{
		list = boardService.selectBoard();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//결과 처리
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>건의 게시판 <%-- --%>페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<style type="text/css">
	nav{
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	nav#navbarBoard{
		background-color: #7fad39; 
		color: white;
		width: 100%;
		height: 50px;
		padding-top: 4px;
	}
	
	#title{
		font-size: 25px;
	}
	
	#divSearchResult{
		text-align: right;
		padding: 5px;
		margin-bottom: 5px;
	}
	
	#searchResult{
		padding: 3px;
		background-color: #f8f9fa;
		margin-right: 5px;
		border-top: 2px solid #7fad39;
		border-bottom: 1px solid #dee2e6;
	}

	.table th{
		text-align: center;
		border-top: 2px solid #7fad39;
	}
	
	.table td{
		text-align: center;
	}
	
</style>
</head>
<body>
test
<nav id="navbarBoard" class="navbar">
	<div class="container-fluid">
    	<span id="title">건의 게시판</span>
	</div>
</nav>

<div class="container" id="divSearchResult" >
	<span id="searchResult">
		검색단어 : <%-- --%> | 총 검색 결과 : <%=list.size()%>건
	</span>
</div>

<div class="container">
  <table class="table" summary="건의 게시판(글번호, 제목, 작성자, 작성일, 조회)">
  	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
  	<thead class="table-light">
    <tr>
      	<th scope="col">글번호</th>
      	<th scope="col">제목</th>
      	<th scope="col">작성자</th>
      	<th scope="col">작성일</th>
      	<th scope="col">조회</th>
    </tr>
  	</thead>
  	<tbody>
  		<%if(list == null || list.isEmpty()){%>
  			<tr>
  				<td colspan="5">데이터가 없습니다.</td>
  			</tr>
  		<%}else{
			for(int i=0;i<pageSize;i++){
				
				if(num < 1) break;
				
				BoardVO boardVo = list.get(curPos++);
				num--;%>
				
				<tr>
					<td><%=boardVo.getWrite_no()%></td>
					<td>
						<a href="#"><%=boardVo.getTitle()%></a>
					</td>
					<td><%=boardVo.getWriter()%></td>
					<td><%=sdf.format(boardVo.getRegdate())%></td>
					<td><%=boardVo.getRead()%></td>
				</tr>
			<%}
  		  }%>
  	</tbody>
</table>
</div>

</body>
</html>