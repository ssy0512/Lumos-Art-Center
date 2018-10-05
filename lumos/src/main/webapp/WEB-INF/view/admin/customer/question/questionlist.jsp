<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.question-top {
	width: 1380px; height: 50px; margin-top: 40px;
}
.question-top-page {
	float: left; margin: 10px 0 0 7px;
	font-size: 12pt;
}
.question-top-search {
	align-content: center; text-align: right;
}
.questionlist-table {
	width: 1380px; margin: 0px;
	border-spacing: 0px;
	border-collapse: collapse;
	overflow: hidden;
}
.questionlist-table thead tr {
	height: 41px;
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
}
.questionlist-table tbody tr {
	height: 41px;
	border-bottom: 1px solid #cccccc;
	text-align: center;
}
.questionlist-table tr:hover {
	cursor: pointer;
}
.question-top-layout {
	float: right;
}
.question-top-layout button, .btn {
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
		<div class="question-top">
			<div class="question-top-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>

			<div class="question-top-search">
				<form action="searchForm" action="<%=cp%>/admin/customer/question/questionlist" method="post" style="align:right;">
					<select name="searchKey" class="selectField">
						<option value="title">제목</option>
						<option value="userName">작성자</option>
						<option value="created">등록일</option>
					</select>
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="margin: 5px">&nbsp;검색&nbsp;</button>
					
				<%-- 	<div class="company-top-layout">
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyList';">
							<img src="<%=cp%>/resource/images/lumos/membershipListBtn.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;목록형&nbsp;&nbsp;
						</button>
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyListCards';">
							<img src="<%=cp%>/resource/images/lumos/membershipCards.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;앨범형&nbsp;&nbsp;
						</button>
					</div> --%>
				</form>
			</div>
		</div>
		
		<div style="clear: both; margin-top: 20px; font-size: 12pt;">
			<table class="questionlist-table">
				<thead>
					<tr>
						<th style="width: 90px;">글번호</th>
						<th style="width: 150px;">카테고리</th>
						<th style="width: 300px;">글제목</th>
						<th style="width: 150px;">작성자</th>
						<th style="width: 150px;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr
							onclick="location.href='<%=cp%>/customerCenter/questions/article?&page=${page}&postNum=${dto.postNum}';">
							<td>${dto.listNum}</td>
							<td>${dto.qCategoryName}</td>
							 <td align="left" style="padding-left: 10px;width:150px;">
					           <c:forEach var="n" begin="1" end="${dto.depth}">
					               &nbsp;
					           </c:forEach>
					           <c:if test="${dto.depth!=0}">
					            <img src='<%=cp%>/resource/images/re.gif'>
					           </c:if>
           						<a style="margin-left:150px;" href="javascript:location.href='<%=cp%>/customerCenter/questions/article('${dto.postNum}', '${page}')';">${dto.title}</a>
     						 </td>
							<td>${dto.userName}</td>
							<td>${dto.created}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>

	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>