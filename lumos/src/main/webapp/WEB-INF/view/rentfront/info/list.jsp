<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/rentfrontlayout.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/academystyle.css" type="text/css">

<div>
	<div class="main_photo half_photo" style=" height: 250px;">
			<h1 class="half_photo_title halfptop80">대관공고</h1>
	</div>
</div>
	<div id="tab-contents" style="clear: both; margin: 100px;">
	  <p style="font-size: 18px; font-weight: 600; margin: 40px;">대관공고</p>

		<table class="rent_table" style="width: 100%; height: 160px;text-align: center; border: 1px solid #eee;">
			<tr style="font-weight: 500; background: #eee;">
				<th scope="col">장소</th>
				<th scope="col">구분</th>
				<th scope="col">일정</th>
				<th scope="col" width="150px;">참고</th>
			</tr>
			<tr>
				<th rowspan="2" scope="row">A</th>
				<td>정기대관</td>
				<td>공고중인 일정이 없습니다.</td>
				<td>
					<button type="button" class="list-ing" style="width: 100px; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/';">신청하기</button>
				</td>
			</tr>
			<tr>
				<td>수시대관</td>
				<td>공고중인 일정이 없습니다.</td>
				<td>------</td>
			</tr>
		</table>
	</div>
