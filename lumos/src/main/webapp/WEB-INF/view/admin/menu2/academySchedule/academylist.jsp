<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.academy-top {
	width: 1580px; height: 50px; margin-top: 40px;
}
.academy-top-page {
	float: left; margin: 10px 0 0 7px;
	font-size: 12pt;
}
.academy-top-search {
	align-content: center; text-align: center;
}
.academylist-table {
	width: 1580px; margin: 0px;
	border-spacing: 0px;
	border-collapse: collapse;
	overflow: hidden;
}
.academylist-table thead tr {
	height: 41px;
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
}
.academylist-table tbody tr {
	height: 41px;
	border-bottom: 1px solid #cccccc;
	text-align: center;
}
.academylist-table tr:hover {
	cursor: pointer;
}
.academy-top-layout {
	float: right;
}
.academy-top-layout button, .btn {
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
		<div class="academy-top">
			<div class="academy-top-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>

			<div class="academy-top-search">
				<form action="searchForm" action="<%=cp%>/admin/menu2/academySchedule/academylist" method="post">
					<select name="searchKey" class="selectField">
						<option value="academyNum">강의번호</option>
						<option value="academyName">강의명</option>
						<option value="instName">강사명</option>
					</select>
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="margin: 5px">&nbsp;검색&nbsp;</button>
					
					<div class="academy-top-layout">
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/academySchedule/academylist';">
							<img src="<%=cp%>/resource/images/lumos/membershipListBtn.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;목록형&nbsp;&nbsp;
						</button>
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/academySchedule/academyCards';">
							<img src="<%=cp%>/resource/images/lumos/membershipCards.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;앨범형&nbsp;&nbsp;
						</button>
					</div>
				</form>
			</div>
		</div>
		
		<div style="clear: both; margin-top: 20px; font-size: 12pt;">
			<table class="academylist-table">
				<thead>
					<tr>
						<th style="width: 90px;">번호</th>
						<th style="width: 300px;">강의명</th>
						<th style="width: 150px;">강의실</th>
						<th style="width: 150px;">강의시작</th>
						<th style="width: 150px;">강의마감</th>
						<th style="width: 150px;">시작시간</th>
						<th style="width: 150px;">종료시간</th>
						<th style="width: 150px;">강의일</th>
						<th style="width: 150px;">가격</th>
						<th style="width: 150px;">강사명</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr
							onclick="location.href='<%=cp%>/admin/menu2/academySchedule/article?&page=${page}&academyNum=${dto.academyNum}';">
							<td>${dto.listNum}</td>
							<td>${dto.academyName}</td>
							<td>${dto.roomName}</td>
							<td>${dto.startDate}</td>
							<td>${dto.endDate}</td>
							<td>${dto.startTime}</td>
							<td>${dto.endTime}</td>
							<td>${dto.lectureDay}</td>
							<td>${dto.price}</td>
							<td>${dto.instName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
				<table style="width:1580px; margin:10px auto; border-spacing:0px">
		<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/academySchedule/academylist';">새로고침</button>
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/academy/list';">CLIENT</button>
					
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/academySchedule/created';">등록하기</button>
				</td>
		</tr>
	</table>
		</div>
	</c:if>

	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 강의가 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>