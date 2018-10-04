<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.exhibit-article {
	margin: 50px auto;
	width: 850px; height: 740px;
	clear: both;
	border: 1px solid #333333; border-radius: 50px;
}
.exhibit-article-image{
	margin: 20px 320px;
}
.exhibit-table {
	width: 700px;
	margin: 10px auto;
	border-spacing: 0px;
	border-collapse: collapse;
}
.exhibit-table thead tr {
	height: 30px;
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
}
.exhibit-table td {
	height: 30px;
	text-align: center;
}


/* 버튼 css */
.myButt {
	margin: 20px auto;
	width: 100px; height: 40px;
	outline: none;
	border: none;
	display: block;
	cursor: pointer;
	background-color: transparent;
	position: relative;
	border: 1px solid #072659;
	border-radius: 7px;
	transition: all 0.5s ease;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
}
.one {
  border-color: #072659;
  overflow: hidden;
  color: #ffffff;
  background-color: #072659;
}
.one .insider {
  background-color: #ffffff;
  width: 100%;
  height: 20px;
  position: absolute;
  left: -135px;
  transform: rotateZ(45deg);
  -webkit-transform: rotateZ(45deg);
  -moz-transform: rotateZ(45deg);
  -o-transform: rotateZ(45deg);
  -ms-transform: rotateZ(45deg);
}
.one:hover {
	background-color: #ffffff;
	border-color: #072659;
	color: #072659;
	font-weight: 600;
	cursor: pointer;
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	transform: scale(1.1);
	text-decoration: none;
}
.one:hover .insider {
  transition: all 0.3s ease;
  -webkit-transition: all 0.3s ease;
  -moz-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  -ms-transition: all 0.3s ease;
  left: 135px;
}
</style>
<div class="body-right" style="width: 1380px; height: 800px; margin: 0;">
	<div class="exhibit-article">
		<div style="float: right; margin: 25px 40px 20px 600px;">
			전시번호  No.${dto.exhibitNum}
		</div>
		<div class="exhibit-article-image">
			<img src="https://cdn.pixabay.com/photo/2015/02/02/15/28/bar-621033_960_720.jpg" style="width: 220px; height: 220px; border-radius: 110px;">
		</div>
		<table class="exhibit-table">
			<tr>
				<td style="text-align: center; font-size: 20pt; margin: auto;">${dto.exhibitName}</td>
			</tr>
		</table>
		<br>
		<table class="exhibit-table">
			<thead>
				<tr>
					<th>전시명</th>
					<th>전시일</th>
					<th>주최</th>
					<th>주관</th>
					<th>전시장</th>
				</tr>
			</thead>
			<tr>
				<td>${dto.exhibitName}</td>
				<td>${dto.exhibitStart} ~ ${dto.exhibitEnd}</td>
				<td>${dto.host}</td>
				<td>${dto.supervise}</td>
				<td>${dto.hallName}</td>
			</tr>
		</table>
		
		<button type="button" class="myButt one" onclick="javascript:location.href='<%=cp%>/admin/sales/exhibit/salesList';">
			<div class='insider'></div>
			목록으로
		</button>
	</div>
</div>