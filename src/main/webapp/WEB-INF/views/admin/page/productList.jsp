<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
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
        	<h1>상품 목록 조회</h1>
        	<table border='1'>
        		<tr>
					<td>상품번호</td>
					<td>판매자 번호</td>
					<td>가격</td>
					<td>재고</td>
					<td>제조사</td>
					<td>브랜드</td>
					<td>평점</td>
					<td>리뷰 건수</td>
        		</tr>
        	
	        	<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.no }</td>
						<td>${vo.seller_no }</td>
						<td>${vo.price }</td>
						<td>${vo.stock }</td>
						<td>${vo.company }</td>
						<td>${vo.brand }</td>
						<td>${vo.rating }</td>
						<td>${vo.review_cnt }</td>
	        		</tr>
	        	</c:forEach>
        	</table>
        	
        	<div>
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
				<form method="get" name="searchForm" id="searchForm" action="/seller/product/list.do">
	            	<span class="sortSelect">
						<select name="sorttype">
							<option value="minstock" <c:if test="${productSearchVO.sorttype == 'minstock'}">selected</c:if>>재고 적은 순</option>
					</select>
	            	</span>
					<span class="srchSelect">
						<select name="searchType">
							<option value="all">전체</option>
							<option value="company" <c:if test="${productSearchVO.searchType == 'company'}">selected</c:if>>제조사</option>
						</select>
					</span>
					<span class="searchWord">
						<input type="text" id="sval" name="searchWord" value="${productSearchVO.searchWord}"  title="검색어 입력">
						<input type="submit" value="검색">
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
		location.href="/admin/productList.do?page=" + $(this).data('page');
	})
</script>
</body>
</html>