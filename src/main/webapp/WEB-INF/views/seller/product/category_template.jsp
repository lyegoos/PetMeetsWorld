<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="category_original" style="display: none;">
	<hr>
	<div>
		카테고리 *<br> <select name="category1_list" class="category1_list">
			<c:forEach var="category_name" items="${category.category_name }"
				varStatus="status">
				<option value="${status.index}">${category_name }</option>
			</c:forEach>
		</select>

		<div>
			세부 카테고리 *<br> <select name="category2_list"
				class="category2_list" data-no="${status.index }">
				<c:forEach var="category" items="${category.category[0] }"
					varStatus="status">
					<option value="${status.index}">${category }</option>
				</c:forEach>
			</select>
		</div>

	</div>
	<a href="javascript:;" class="remove_btn_category"><img
		src="/resources/img/product/option_content_remove.png" width="25"
		height="25" /></a><br>
</div>
<div class="category_add_button" style="display: none;">
	<a href="javascript:;" class="add_btn_category"><img
		src="/resources/img/product/add.png" width="25" height="25" /> 카테고리
		추가</a>
</div>