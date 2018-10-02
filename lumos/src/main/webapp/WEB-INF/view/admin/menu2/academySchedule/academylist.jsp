<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>

.academylist-tr td{
	height: 35px;
}

.academylist-tr:hover{
	cursor: pointer;
}
</style>

<%-- <link rel="stylesheet" href="<%=cp%>/resource/css/adminAcademy.css" type="text/css"> --%>

<script type="text/javascript">
	function searchList() {
		var f = document.searchForm;
		f.submit();
	}
</script>

<div class="body-right" style="width: 1380px; height: 800px;">
	<c:if test="${dataCount!=0}">
		<div style="width: 1380px; height: 35px; margin-top: 15px;">
			<div style="width: 200px; float: left; margin-left: 10px">
				${dataCount}개(${page}/${total_page} 페이지)
			</div>
	<%-- 	<div class="wrapper" >
		<div class="btn btn--border btn--primary btn--animated">등록하기</div>
		 onclick="locaion.href='<%=cp%>/admin/menu2/academySchedule/created';" 
		</div> --%>
			<div style="float: right; text-align: center;">
				<form action="searchForm" action="<%=cp%>/admin/menu2/academySchedule/academylist" method="post">
					<select name="searchKey" class="selectField">
						<option value="academyName">강의명</option>
						<option value="roomName">강의실명</option>
						<option value="startDate">강의시작일</option>
						<option value="instName">강사명</option>
					</select> <input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="width: 60px;">검색</button>
				</form>
			</div>
		</div>
		<div style="clear: both; margin-top: 5px;">
			<table style="width: 1380px; margin: 0px; border-spacing: 0px; border-collapse: collapse;">
				<thead style="background-color: #efefef;">
					<tr style="height: 30px;">
						<th style="width: 100px;">번호</th>
						<th style="width: 200px;">강의명</th>
						<th style="width: 150px;">강의실</th>
						<th style="width: 130px;">강의시작일</th>
						<th style="width: 130px;">강의마감일</th>
						<th style="width: 100px;">강의시작시간</th>
						<th style="width: 100px;">강의종료시간</th>
						<th style="width: 100px;">강의요일</th>
						<th style="width: 130px;">수강료</th>
						<th style="width: 100px;">강사명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr class="academylist" align="center" style="border-bottom: 1px solid #cccccc; height:40px;"
							onclick="location.href='<%=cp%>/admin/menu2/academySchedule/article?&page=${page}&listNum=${dto.listNum}'">
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
	<table style="width:100%; margin:10px auto; border-spacing:0px">
		<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/academySchedule/academylist';">새로고침</button>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/academySchedule/created';">등록하기</button>
				</td>
		</tr>
	</table>
		</div>
	</c:if>
	
	<div class="paging"
		style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 강의가 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>