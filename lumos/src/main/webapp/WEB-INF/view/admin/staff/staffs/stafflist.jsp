<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>


.stafflist-tr td{
	height: 35px;
}

.stafflist-tr:hover{
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
		<div style="width: 1380px; height: 35px; margin-top: 15px;">
			<div style="width: 200px; float: left; margin-left: 10px">
				${dataCount}개(${page}/${total_page} 페이지)
				<a href="<%=cp%>/admin/staff/staffs/excel">엑셀 다운로드</a>
			</div>

			<div style="float: right; text-align: center;">
				<form action="searchForm" action="<%=cp%>/admin/staff/staffs/stafflist" method="post">
					<select name="searchKey" class="selectField">
						<option value="staffNum">사번</option>
						<option value="staffName">사원명</option>
						<option value="department">소속부서</option>
						<option value="birth">생년월일</option>
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
						<th style="width: 230px;">사번</th>
						<th style="width: 150px;">사원명</th>
						<th style="width: 150px;">생년월일</th>
						<th style="width: 150px;">소속부서</th>
						<th style="width: 100px;">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr class="stafflist" align="center" style="border-bottom: 1px solid #cccccc; height:40px;"
							onclick="location.href='<%=cp%>/admin/staff/staffs/article?&page=${page}&listNum=${dto.listNum}'">
							<td>${dto.listNum}</td>
							<td>${dto.staffNum}</td>
							<td>${dto.staffName}</td>
							<td>${dto.birth}</td>
							<td>${dto.department}</td>
							<td>${dto.tel}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<table style="width:100%; margin:10px auto; border-spacing:0px">
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
	
	
	<div class="paging"
		style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 직원이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>