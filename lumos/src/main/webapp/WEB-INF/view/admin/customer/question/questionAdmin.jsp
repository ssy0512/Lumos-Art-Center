<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- 1:1 문의 관리자 단 리스트 -->
<style type="text/css">
.table th, .table td{
	font-weight: normal;
	border-top: 1px solid black;
}
.table thead tr th{
	border-bottom: 1px solid #ccc;
}
.table thead tr{
	border: #d5d5d5 solid 1px;
	background: #83c6fc; 
}
.table td{
	border-bottom: #d5d5d5 solid 1px;
	test-align:center;
}
.table td a{
	color: #000;
}
.centered{
	width:900px;
	margin:0px auto;
}
</style>
<script type="text/javascript">
function searchCategory(){
	var f=document.searchCagegoryForm;
	f.submit;
}
</script>

<div class="body-container" style="width:990px;">
	<div class="body-title h3">
		<h3><span class="glyphicon glyphicon-question-sign"></span>1:1 문의 목록</h3>
	</div>
	
	<div>
	<c:if test="${dataCount!=0}">
		<div style="clear:both; height:30px; line-height:30px;">
			<div style="float: right;">${dataCount}개 (${page}/${total_page}페이지)</div>
			<div style="float:left;">&nbsp;</div>
		</div>
			
			<div class="centered" style="postion:absolute;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="text-center" style="width:70px;">글번호</th>
							<th class="text-center" style="width:150px;">카테고리</th>
							<th class="text-center" style="width:250px;">제목</th>
							<th class="text-center" style="width:150px;">작성자</th>
							<th class="text-center" style="width:100px;">작성일</th>
							<th class="text-center" style="width:100 px;">답변하기</th>
						</tr>
					</thead>
					<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td class="text-center">${dto.listNum}</td>
						<td class="text-center">${dto.qCategoryName}</td>
						<td>
							<c:forEach var="n" begin="1" end="${dto.depth}">
								&nbsp;&nbsp;
							</c:forEach>
							<c:if test="${dto.depth!=0}">
								<img src='<%=cp%>/resource/images/re.gif'>
							</c:if>
								<a href='${articleUrl}&postNum=${dto.postNum}'>${dto.title}</a>
						</td>
						<td class="text-center">${dto.userName}</td>
						<td class="text-center">${dto.created}</td>								<!-- href 달라질 수 있음.  -->
						<td><button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/customer/question/reply?postNum=${dto.postNum}&page=${page}';"></button>답변</td>
					</tr>
				</c:forEach>
					</tbody>
				</table>
			</div>
	</c:if>
	
		<div class="paging" style="text-align:center; min-height: 50px; line-height:50px;">
			<c:if test="${dataCount==0}">
			등록된 문의글이 없습니다.
			</c:if>
			<c:if test="${dataCount!=0}">
				${paging}
			</c:if>
		</div>
		
		<div style="clear:both;">
			<div style="float:left; width:20%; min-width:85px;">
				<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/admin/customer/question/questionAdmin';">새로고침</button>
			</div>
			<div style="float: left; width: 60%; text-align:center;">
				<form name="searchCategory" action="<%=cp%>/admin/customer/question/questionAdmin" method="post" class="form-inline">
					<select class="form-control input-sm" name="searchKey">
						<option value="all">제목+내용</option>
							  <option value="qcategory">카테고리명</option>
						      <option value="title">제목</option>
						      <option value="userName">작성자</option>
						      <option value="content">내용</option>
						      <option value="created">등록일</option>
					</select>
					<input type="text" class="form-control input-sm input-search" name="searchValue">
					<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchCategory();"><span class="glyphicon glyphicon-search"></span>검색</button>
				</form>
			</div>
		</div>
	</div>
</div>