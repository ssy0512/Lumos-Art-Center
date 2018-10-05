<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.staff-top {
	width: 1580px; height: 50px; margin-top: 40px;
}
.staff-top-page {
	float: left; margin: 10px 0 0 7px;
	font-size: 12pt;
}
.staff-top-search {
	align-content: center; text-align: right;
}
.stafflist-table {
	width: 1580px; margin: 0px;
	border-spacing: 0px;
	border-collapse: collapse;
	overflow: hidden;
}
.stafflist-table thead tr {
	height: 41px;
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
}
.stafflist-table tbody tr {
	height: 41px;
	border-bottom: 1px solid #cccccc;
	text-align: center;
}
.stafflist-table tr:hover {
	cursor: pointer;
}
.staff-top-layout {
	float: right;
}
.staff-top-layout button, .btn {
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
		<div class="staff-top">
			<div class="staff-top-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>

			<div class="staff-top-search">
				<form action="searchForm" action="<%=cp%>/admin/staff/staffs/stafflist" method="post">
					<select name="searchKey" class="selectField">
						<option value="staffNum">사번</option>
						<option value="staffName">사원명</option>
						<option value="department">소속부서</option>
						<option value="birth">생년월일</option>
					</select>
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="margin: 5px">&nbsp;검색&nbsp;</button>
					
					<%-- <div class="staff-top-layout">
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/staff/staffs/stafflist';">
							<img src="<%=cp%>/resource/images/lumos/membershipListBtn.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;목록형&nbsp;&nbsp;
						</button>
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/academySchedule/academyCards';">
							<img src="<%=cp%>/resource/images/lumos/membershipCards.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;앨범형&nbsp;&nbsp;
						</button>
					</div> --%>
				</form>
			</div>
		</div>
		
		<div style="clear: both; margin-top: 20px; font-size: 12pt;">
			<table class="stafflist-table">
				<thead>
					<tr>
						<th style="width: 90px;">사번</th>
						<th style="width: 150px;">사원명</th>
						<th style="width: 180px;">생년월일</th>
						<th style="width: 150px;">소속부서</th>
						<th style="width: 150px;">전화번호</th>
						<th style="width: 150px;">이메일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr
							onclick="location.href='<%=cp%>/admin/staff/staffs/article?&page=${page}&staffNum=${dto.staffNum}';">
							<td>${dto.staffNum}</td>
							<td>${dto.staffName}</td>
							<td>${dto.birth}</td>
							<td>${dto.department}</td>
							<td>${dto.tel}</td>
							<td>${dto.email}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
				<table style="width:1580px; margin:10px auto; border-spacing:0px">
		<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/staff/staffs/stafflist';">새로고침</button>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/staff/staffs/created';">등록하기</button>
				</td>
		</tr>
	</table>
		</div>
	</c:if>

	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 사원이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>