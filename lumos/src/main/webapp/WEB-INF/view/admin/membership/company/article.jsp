<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.company-article {
	margin: 50px auto;
	width: 850px; height: 740px;
	clear: both;
	border: 1px solid #333333; border-radius: 50px;
}
.company-table {
	margin: auto;
	clear: both;
	text-align: left;
}
.company-table tr th, td{
	height: 33px;
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
<div class="body-right" style="width: 1380px; height: 800px;">
	<div class="company-article">
		<div style="float: right; margin: 25px 40px 20px 600px;">
			회원번호  No.${dto.companyIndex}
		</div>
		<table class="company-table" style="width: 700px;">
			<tr>
				<td style="text-align: center; font-size: 20pt; margin: auto;">${dto.companyName}</td>
			</tr>
		</table>
		<br>
		<table class="company-table" style="width: 700px;">
			<tr>
				<td colspan="5" style="text-align: left; font-size: 15pt; border-bottom: 1px solid #072659">기업정보</td>
			</tr>
			<tr>
				<th style="width: 100px;">대표</th>
				<td style="width: 200px;">${dto.repname}</td>
				<th style="width: 150px;">사업자번호</th>
				<td>${dto.businessNumber}</td>
			</tr>
		</table>
		<table class="company-table" style="width: 700px;">
			<tr>
				<th style="width: 100px;">연락처</th>
				<td style="width: 200px;">${dto.repnumber}</td>
				<th style="width: 150px;">팩스</th>
				<td>${dto.fax}</td>
			</tr>
		</table>
		<table class="company-table" style="width: 700px;">
			<tr>
				<th style="width: 100px;">주소</th>
				<td>${dto.address1}&nbsp;${dto.address2}&nbsp;(${dto.businessPost})</td>
			</tr>
		</table>
		<br><br>
		<table class="company-table" style="width: 700px;">
			<tr>
				<td colspan="4" style="text-align: left; font-size: 15pt; border-bottom: 1px solid #072659">담당자정보</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${dto.chargeId}</td>
				<th>이름</th>
				<td>${dto.chargeName}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${dto.chargeTel}</td>
				<th>이메일</th>
				<td>${dto.chargeEmail}</td>
			</tr>
		</table>
	
		<button type="button" class="myButt one" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyList';">
			<div class='insider'></div>
			목록으로
		</button>
	</div>
</div>
