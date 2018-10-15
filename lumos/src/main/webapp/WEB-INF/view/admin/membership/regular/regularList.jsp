<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.top {
	margin-top: 15px;
}
.regularList {
	margin: 0px;
	width: 1380px;
	border-spacing: 0px; border-collapse: collapse;
}
.regularList thead th, tbody td {
	height: 45px;
	text-align: center;
}
.regularList thead tr {
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
}
.regularList tbody td {
	border-bottom: 1px solid #86888a;
}
.regularList-tr:hover{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function searchList() {
		var f = document.searchForm;
		f.submit();
	}
</script>

<div class="body-right" style="width: 1380px; height: 800px;">
	<c:if test="${dataCount!=0}">
		<div class="top">
			<img src="<%=cp %>/resource/images/lumos/adminMemRegular.png">
		</div>
		<div style="clear: both; margin-top: 5px;">
			<table class="regularList">
				<thead>
					<tr style="height: 30px;">
						<th style="width: 100px;">회원번호</th>
						<th style="width: 130px;">아이디</th>
						<th style="width: 100px;">이름</th>
						<th style="width: 120px;">생일</th>
						<th style="width: 150px;">이메일</th>
						<th style="width: 200px;">연락처</th>
						<th style="width: 100px;">우편번호</th>
						<th style="width: 240px;">기본주소</th>
						<th style="width: 240px;">상세주소</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr onclick="location.href='<%=cp%>/admin/membership/regular/article?page=${page}&memberIndex=${dto.memberIndex}'">
							<td>${dto.memberIndex}</td>
							<td>${dto.userId}</td>
							<td>${dto.userName}</td>
							<td>${dto.birth}</td>
							<td>${dto.email}</td>
							<td>${dto.phone}</td>
							<td>${dto.zip}</td>
							<td>${dto.address1}</td>
							<td>${dto.address2}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div style="width: 1380px; height: 35px; margin-top: 15px;">
			<div style="width: 200px; float: left; margin-left: 10px">
				${dataCount}개(${page}/${total_page} 페이지)
			</div>
			
			<div style="float: right; text-align: center;">
				<form action="searchForm" action="<%=cp%>/admin/membership/regular/regularList" method="post">
					<select name="searchKey" class="selectField">
						<option value="memberIndex">회원번호</option>
						<option value="userId">아이디</option>
						<option value="userName">이름</option>
						<option value="phone">연락처</option>
					</select>
					
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="width: 60px;">검색</button>
				</form>
			</div>
		</div>
		
	</c:if>
	<div class="paging"
		style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>