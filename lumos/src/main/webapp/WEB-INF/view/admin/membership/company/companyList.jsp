<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.top {
	margin-top: 15px;
}
.company-top {
	width: 1380px; height: 50px; margin-top: 40px;
}
.company-top-page {
	float: left; margin: 10px 0 0 7px;
	font-size: 12pt;
}
.company-top-search {
	align-content: center; text-align: center;
}
.companyList-table {
	width: 1380px; margin: 0px;
	border-spacing: 0px;
	border-collapse: collapse;
	overflow: hidden;
}
.companyList-table thead tr {
	height: 41px;
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
}
.companyList-table tbody tr {
	height: 41px;
	border-bottom: 1px solid #cccccc;
	text-align: center;
}
.companyList-table tr:hover {
	cursor: pointer;
}
.company-top-layout {
	float: right;
}
.company-top-layout button, .btn {
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
		<div class="top">
			<img src="<%=cp %>/resource/images/lumos/adminMemCompany.png">
		</div>
		<div style="clear: both; margin-top: 20px; font-size: 12pt;">
			<table class="companyList-table">
				<thead>
					<tr>
						<th style="width: 90px;">회원번호</th>
						<th style="width: 150px;">회사명</th>
						<th style="width: 150px;">사업자번호</th>
						<th style="width: 150px;">담당자 아이디</th>
						<th style="width: 150px;">담당자명</th>
						<th style="width: 150px;">팩스</th>
						<th style="width: 300px;">기본주소</th>
						<th style="width: 240px;">상세주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr
							onclick="location.href='<%=cp%>/admin/membership/company/article?&page=${page}&companyIndex=${dto.companyIndex}';">
							<td>${dto.companyIndex}</td>
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
		
		<div class="company-top">
			<div class="company-top-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>

			<div class="company-top-search">
				<form action="searchForm" action="<%=cp%>/admin/membership/company/companyList" method="post">
					<select name="searchKey" class="selectField">
						<option value="companyIndex">회원번호</option>
						<option value="companyName">회사명</option>
						<option value="repname">대표명</option>
					</select>
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="margin: 5px">&nbsp;검색&nbsp;</button>
					
					<div class="company-top-layout">
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyList';">
							<img src="<%=cp%>/resource/images/lumos/membershipListBtn.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;목록형&nbsp;&nbsp;
						</button>
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyListCards';">
							<img src="<%=cp%>/resource/images/lumos/membershipCards.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;앨범형&nbsp;&nbsp;
						</button>
					</div>
				</form>
			</div>
		</div>
	</c:if>

	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>