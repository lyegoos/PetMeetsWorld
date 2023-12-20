<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
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
    
<style>
 
.zzim_On {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 150px;
  height: 35px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 500;
  color: #222;
  margin-top:5px;
  
 }
 
 .price{
 text-align: center;
 margin_top : 80px;
 margin-left: 40px;
 font-size: 20px;
 }
 
.goods_container {
display : flex;

}

.menu_name {
margin-bottom: 30px;	
}

.goods_image {
width : 100px;
hegiht : 100px;
}

.goods_name {
position:relative;
margin-left : 30px;
margin-top : 20px;
width: 1000px;
height: 100px;
}

.go_more {
width :150px;
height : 100px;
margin-top: 20px;
margin-left: 20px;	
}

.goods_info {
width: 200px;
height : 100px;
}

.zzimcancel_button {
text-align: center;
width: 200px;
height : 100px;
margin-right : 30px;
margin-top : 5px; 
}

</style>       
    
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
					<div>	
						회원 번호 : ${userLoginInfo.no } <br>
						
					<h1>작성 가능한 리뷰</h1>
					
					
				<c:forEach items="${possible_write_review2}" varStatus = "possible_write_review" >
					<c:if test="${!empty possible_write_review2[possible_write_review.index] }">
						<div>
							<div class="goods-photo">
								<c:if test="${possible_write_review2[possible_write_review.index][0] }">
									<img src="/resources/img/product/no_image.jpg" width="100" height="100">
								</c:if>
								<c:if test="${!empty possible_write_review2[possible_write_review.index][0] && fn:substring(possible_write_review2[possible_write_review.index][0], 0, 1) == 'h' }">
									<img src="${possible_write_review2[possible_write_review.index][0] }" width="100" height="100">
								</c:if>
								<c:if test="${!empty possible_write_review2[possible_write_review.index][0] && !(fn:substring(possible_write_review2[possible_write_review.index][0], 0, 1) == 'h') }">
									<img src="/resources/img/product/registed_img/${possible_write_review2[possible_write_review.index][0] }" width="100" height="100">
								</c:if>
							</div>
								
							<div>	
								<c:if test="${!empty possible_write_review2[possible_write_review.index][1] }">
								<button class ="goWriteReview" data-dno="${possible_write_review2[possible_write_review.index][1]}">리뷰 작성 </button>	<br>
								</c:if>
		
								<c:if test="${!empty possible_write_review2[possible_write_review.index][1] }">
									주문 번호: ${possible_write_review2[possible_write_review.index][1]} <br>
								</c:if>
								
								<c:if test="${!empty possible_write_review2[possible_write_review.index][2] }">
									제품명:	${possible_write_review2[possible_write_review.index][2]} <br>
								</c:if>
								
								<c:if test="${!empty possible_write_review2[possible_write_review.index][3] }">
									가격:	${possible_write_review2[possible_write_review.index][3]} <br>
								</c:if>
								
								<c:if test="${!empty possible_write_review2[possible_write_review.index][4] }">
									구매일자:	${possible_write_review2[possible_write_review.index][4]} <br>
								</c:if>
								
								<c:if test="${!empty possible_write_review2[possible_write_review.index][5] }">
									상품번호:	${possible_write_review2[possible_write_review.index][5]} <br>
								</c:if>
								<br>
							</div>
							
						</div>
					</c:if>
			   </c:forEach>			
				</div>
			</div>
        </div>
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
  <script>
$(".goWriteReview").on('click', goReviewwrite_popup);

function goReviewwrite_popup(){
	
	console.log($(this).data('dno'));
	
	var dno = $(this).data('dno');
	var url = '/user/order/write_review.do?no='+ dno;
	window.open(url, '리뷰 등록', 'width=300px, height=355px');
}

</script>      
</body>
</html>