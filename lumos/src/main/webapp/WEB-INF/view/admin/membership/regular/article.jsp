<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>
.regular-article-table-tr td {
	padding: 5px 10px;
}
</style>

<script type="text/javascript">
	function updateRegular(memberIndex) {
		var page = "${page}";
		var query = "memberIndex="+memberIndex+"&page="+page;
		var url = "<%=cp%>/admin/membership/regular/created?" + query;
		
		location.href=url;
	}
</script>

<div class="body-right" style="width: 1380px; height: 800px;">
	<div style="clear: both;">
		<div style="height: 70px; background-color: #e8e8e8; text-align: center; margin-top: 30px;">
			개인회원 정보
		</div>
	</div>
	
	<!-- 메인 -->
	<table style="width: 1380px; clear: both; margin-top: 15px; text-align: center;">
		<thead>
			<tr style="height: 50px; background-color: #e0e0e0;">
				<th colspan="5">아이디 정보</th>
			</tr>
			<tr style="height: 30px; background-color: #e0e0e0;">
				<th>회원번호</th>
				<th>아이디</th>
				<th>최근 정보 수정일</th>
				<th>마지막 로그인</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<tr style="height: 30px;">
				<td>${dto.memberIndex}</td>
				<td>${dto.userId}</td>
				<td>${dto.modifyDate}</td>
				<td>${dto.lastLoginDate}</td>
				<td>${dto.createdDate}</td>
			</tr>
		</tbody>
	</table>
	<table style="width: 1380px; clear: both; text-align: center;">
		<thead>
			<tr style="height: 50px; background-color: #e0e0e0;">
				<th colspan="6">개인정보</th>
			</tr>
			<tr style="height: 30px; background-color: #e0e0e0;">
				<th style="width: 150px;">이름</th>
				<th style="width: 150px;">생년월일</th>
				<th style="width: 150px;">전화번호</th>
				<th style="width: 100px;">우편번호</th>
				<th>기본주소</th>
				<th>상세주소</th>
			</tr>
		</thead>
		<tbody>
			<tr class="regular-article-table-tr" style="height: 30px;">
				<td>${dto.userName}</td>
				<td>${dto.birth}</td>
				<td>${dto.phone}</td>
				<td>${dto.zip}</td>
				<td>${dto.address1}</td>
				<td>${dto.address2}</td>
			</tr>
		</tbody>
	</table>
	<button type="button" class="btn btn-default btn-sm wbtn" style="float: left;"
			onclick="javascript:location.href='<%=cp%>/admin/membership/regular/regularList';"> 뒤로가기
	</button>
	<button type="button" class="btn btn-default btn-sm wbtn" style="float: right;"
			onclick="updateRegular();">수정
	</button>
</div>