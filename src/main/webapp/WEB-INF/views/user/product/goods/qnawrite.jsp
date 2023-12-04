<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // 현재 날짜를 가져오기
    Date currentDate = new Date();

    // 날짜를 원하는 형식으로 포맷팅
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = dateFormat.format(currentDate);
%>

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
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					    <h2>판매자 문의 작성</h2>
							<p>작성자: ${loginInfo.id}</p>
							<p>회원번호: ${loginInfo.no } </p>
							<p>제품번호: 4 </p>
							<p>작성일: <%= formattedDate %></p>
				
				
		<form method="post" name="frm" id="frm" action="qnainsert.do" enctype="multipart/form-data" >
        <table class="board_write">
            <tbody>
        
            <td>
                <textarea name="question_content" id="/product/question_content" style="width: 400px; height: 200px;" placeholder="판매자에게 문의하실 내용을 적어주세요.(최대 255자) 
욕설, 비방 등 작성 시 관리자가 임의로 삭제할 수 있습니다."></textarea>
                
            </td>
           		
            <td>
            	<input type="hidden" name="user_no" value='${loginInfo.no}'>
            </td>
            
            <td>
            	<input type="hidden" name="product_no" value='4'>
            </td>
            
            </tbody>
        </table>
        <div class="btnSet">
            <a class="btn" href="javascript:goSave();">저장 </a>
        </div>
        </form>		

				</div>
			</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
    
<script>
function goSave() {
    // 사용자가 입력한 데이터 가져오기
    var questionContent = $("#question_content").val();
    var userNo = $("input[name='user_no']").val();
    var productNo = 4;

    // Ajax 호출
    $.ajax({
        type: 'POST',
        url: 'qnainsert.do',
        data: {
            question_content: questionContent,
            user_no: userNo,
            product_no: productNo
        },
        success: function(response) {
            // 서버에서 반환한 응답 처리
            console.log(response);
            // 여기에서 필요한 추가 동작 수행
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}
</script>
</body>
</html>