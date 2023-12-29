<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>관리자:: 판매자 목록</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
	
	<style>
		.paging_div{
			height:30px;	
			text-align:center;
			width:1200px;
			clear:both;
			margin-bottom:15px;
		}
		
		
		.paging li{
			list-style: none;
			margin-right:8px;
			margin-top:15px;
			
			text-align:center;
			display:inline-block;
		}
		
		.paging li button{
			width:20px;
			height:20px;
			background: white;
			border-radius: 4px;
			border: 1px solid black;
			text-decoration: none;
			font-size:13px;
			color:black;
			display:block;
			line-height:18px;
		}
		
		
		
		.paging li button:hover{
			width:20px;
			height:20px;
			background: black;
			color:white;
			cursor:pointer;
			
		}
		
		.bbsSearch{
			width:1200px;
			text-align:center;
		}
		
		.search_keyword_btn{
			background-color:#FFDE30;
			border:1px solid gray;
			width:40px;
		}
		
		.bbb9{
			background-color: #fff;
			height: 30px;
			width: 120px;
			padding: 3px 7px;
			line-height: normal;
			border: 1px solid #a6a6a6;
			border-top-color: #949494;
			border-radius: 3px;
			box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
			outline: 0;
			color: #111;
			font-size: 13px;
			
			:focus{
				border-color: #e77600;
				box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
			}
		}
		
		
		
		
		.searchWord input{
			height:30px;
		}
		
		.contents{
			text-align:center;
		}
		
		.contents table{
		    margin-left:auto; 
	    	margin-right:auto;
		}
	</style>

</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        </div>
        <div>
        	<%@ include file="/WEB-INF/views/common/admin_menu.jsp" %>
        </div>
        <div class="contents">
        	<h1>판매자 목록 조회</h1>
        	<table border='1'>
        		<tr>
        			<td>회원 번호</td>
        			<td>아이디</td>
        			<td>이름</td>
        			<td>이메일</td>
        			<td>연락처</td>
        			<td>제재여부</td>
        		</tr>
        	
	        	<c:forEach items="${list }" var="vo">
					<tr>
	        			<td>${vo.no }</td>
	        			<td>${vo.id }</td>
	        			<td>${vo.name }</td>
	        			<td>${vo.email }</td>
	        			<td>${vo.phone }</td>
	        			<td>${vo.restricted }</td>
	        		</tr>
	        	</c:forEach>
        	</table>
        	
        	<div class="paging_div">
		   		<ul class='paging'>
		            <c:if test="${paging.prev }">
		            	<li><button class="pageButton" data-page="${paging.startPage-1 }"> << </button></li>
		            </c:if>
		            <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
		            	<c:if test="${p == svo.page}">
			            	<li> <button data-page=${p }>${p }</button></li>
		                </c:if>
		                <c:if test="${p != svo.page}">
		                	<li> <button class="pageButton" data-page=${p }>${p }</button></li>
		                </c:if>
		            </c:forEach>
		            <c:if test="${paging.next }">
		            	<li><button class="pageButton" data-page="${paging.endPage+1 }"> >> </button></li>
		            </c:if>
				</ul> 
		   	</div>
		   	<div class="bbsSearch">
				<form method="get" name="searchForm" id="searchForm" action="/admin/sellerList.do">
					<span class="srchSelect">
						<select class="bbb9" name="searchType">
							<option value="all">전체</option>
							<option value="no" <c:if test="${productSearchVO.searchType == 'no'}">selected</c:if>>판매자 번호</option>
							<option value="id" <c:if test="${productSearchVO.searchType == 'id'}">selected</c:if>>아이디</option>
							<option value="name" <c:if test="${productSearchVO.searchType == 'name'}">selected</c:if>>이름</option>
						</select>
					</span>
					<span class="searchWord">
						<input type="text" id="sval" name="searchWord" value="${productSearchVO.searchWord}"  title="검색어 입력">
						<input type="submit" class="search_keyword_btn" value="검색">
					</span>
				</form>
			</div>	
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
<script>
	$('.pageButton').on('click', function(){
		location.href="/admin/sellerList.do?page=" + $(this).data('page');
	})
</script>
</body>
</html>