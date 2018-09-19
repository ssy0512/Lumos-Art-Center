<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
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
			
			<div style="width: 100px; float: left">&nbsp;</div>
			
			<div style="float: right; text-align: center;">
				<form action="searchForm" action="<%=cp%>/admin/membership/company/companyList" method="post">
					<select name="searchKey" class="selectField">
						<option value="companyIndex">회원번호</option>
						<option value="companyName">회사명</option>
						<option value="repname">대표명</option>
					</select> <input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="width: 60px;">검색</button>
				</form>
			</div>
		</div>
		
		
		
		<div style="clear: both; margin-top: 5px;">
			<table  style="width: 1380px; margin: 0px;">
				<thead
					style="background-color: #efefef; border-spacing: 0px; border-collapse: collapse;">
					<tr style="height: 30px;">
						<th style="width: 100px;">회원번호</th>
						<th style="width: 150px;">회사명</th>
						<th style="width: 100px;">사업자번호</th>
						<th style="width: 100px;">담당자 아이디</th>
						<th style="width: 150px;">담당자명</th>
						<th style="width: 150px;">팩스</th>
						<th style="width: 200px;">기본주소</th>
						<th style="width: 200px;">상세주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr align="center" style="border-bottom: 1px solid #cccccc">
							<td><a href="${articleUrl}&num=${dto.companyIndex}"></a>${dto.companyIndex}</td>
							<td>${dto.companyName}</td>
							<td>${dto.businessNumber}</td>
							<td>${dto.chargeId}</td>
							<td>${dto.chargeName}</td>
							<td>${dto.fax}</td>
							<td>${dto.address1}</td>
							<td>${dto.address2}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	<div class="paging"
		style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
	<div style="clear: both; width: 1380px;">
		
	</div>
</div>