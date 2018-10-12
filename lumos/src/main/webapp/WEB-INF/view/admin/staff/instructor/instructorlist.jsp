<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.instructor-top {
	width: 1580px; height: 50px; margin-top: 40px;
}
.instructor-top-page {
	float: left; margin: 10px 0 0 7px;
	font-size: 12pt;
}
.instructor-top-search {
	align-content: center; text-align: right;
}
.instructorlist-table {
	width: 1580px; margin: 0px;
	border-spacing: 0px;
	border-collapse: collapse;
	overflow: hidden;
}
.instructorlist-table thead tr {
	height: 41px;
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
}
.instructorlist-table tbody tr {
	height: 41px;
	border-bottom: 1px solid #cccccc;
	text-align: center;
}
.instructorlist-table tr:hover {
	cursor: pointer;
}
.instructor-top-layout {
	float: right;
}
.instructor-top-layout button, .btn {
	cursor: pointer;
	font-size: 12pt;
	font-family: 'Varela Round', sans-serif;
	display: inline-flex;
	align-items: center;
}
.boxTF {
	width: 300px;
}
.list-btn {
	width: 96px; height: 30px;
	margin: 0 5px;
	align-content: center; align-items: center;
	background-color: #072659;
	border: 1px solid #072659;
	border-radius: 5px;
	color: #ffffff;
	cursor: pointer;
	transition: all 0.5s ease;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
}
.list-btn:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	transform: scale(1.1);
	text-decoration: none;
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
		<div class="instructor-top">
			<div class="instructor-top-page">
				<a href="<%=cp%>/admin/staff/instructor/excel">엑셀다운로드</a>
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>

			<div class="instructor-top-search">
				<form action="searchForm" action="<%=cp%>/admin/staff/instructor/instructorlist" method="post">
					<select name="searchKey" class="selectField">
						<option value="instNum">강사번호</option>
						<option value="instName">강사명</option>
						<option value="birth">생년월일</option>
					</select>
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="margin: 5px">&nbsp;검색&nbsp;</button>
				
				</form>
			</div>
		</div>
		
		<div style="clear: both; margin-top: 20px; font-size: 12pt;">
			<table class="instructorlist-table">
				<thead>
					<tr>
						<th style="width: 90px;">강사번호</th>
						<th style="width: 150px;">강사명</th>
						<th style="width: 180px;">생년월일</th>
						<th style="width: 150px;">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr
							onclick="location.href='<%=cp%>/admin/staff/instructor/article?&page=${page}&instNum=${dto.instNum}';">
							<td>${dto.instNum}</td>
							<td>${dto.instName}</td>
							<td>${dto.birth}</td>
							<td>${dto.tel}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
				<table style="width:1580px; margin:10px auto; border-spacing:0px">
		<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/staff/instructor/instructorlist';">새로고침</button>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/staff/instructor/created';">등록하기</button>
				</td>
		</tr>
	</table>
		</div>
	</c:if>

	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 강사가 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>