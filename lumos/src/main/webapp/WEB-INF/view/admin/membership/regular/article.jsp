<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
.regular-article {
	width: 850px; height: 650px; margin: 70px auto;
	border: 1px solid #333333; border-radius: 50px;
}
.regular-article-userInfo {
	width: 700px;
	clear: both;
	font-size: 12pt;
	text-align: center;
	margin: 20px auto;
}
.regular-article-userId {
	margin: 20px 0;
	text-align: center;
	font-size: 27pt;
	font-weight: 700;
	
}
.regular-article-userInfo tr th, tr td, .regular-article-id-Info thead tr th, tbody tr td {
	height: 40px;
}
.regular-article-id-Info {
	width: 700px;
	clear: both;
	font-size: 12pt;
	text-align: center;
	margin: 20px auto;
}

.myButt {
	width: 100px; height: 40px;
  outline: none;
  border: none;
  display: block;
  margin: 30px auto;
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

<script type="text/javascript">
function updateRegular() {
/* 	alert('updateeeeeeeeeee');
	alert('${sessionScope.member1.userId}');
	<c:if test="${sessionScope.member1.userId=='admin'}"> */
		var memberIndex = "${dto.memberIndex}";
		var page = "${page}";
		var query = "memberIndex="+memberIndex+"&page="+page;
		var url = "<%=cp%>/admin/membership/regular/update?" + query;
		
		location.href=url;
/* 	</c:if> */
	}

</script>

<div class="body-right" style="width: 1380px; height: 800px;">
	<!-- 메인 -->
	<div class="regular-article">
		<p style="clear: both; margin: 30px 35px 20px 700px; font-size: 12pt;">회원번호  No.${dto.memberIndex}</p>
		<p class="regular-article-userId">${dto.userId}</p>
		
			<table class="regular-article-userInfo">
				<thead>
					<tr>
						<th colspan="6" style="text-align: left; font-size: 15pt; border-bottom: 1px solid #072659">개인정보</th>
					</tr>
				</thead>
				<tr>
					<th>이름</th>
					<td>${dto.userName}</td>
					<th>생년월일</th>
					<td>${dto.birth}</td>
					<th>전화번호</th>
					<td>${dto.phone}</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${dto.zip}</td>
					<th>주소</th>
					<td colspan="3">${dto.address1}&nbsp;${dto.address2}</td>
				</tr>
			</table>
	
	<br><br><br><br>
	
		<table class="regular-article-id-Info">
			<thead>
				<tr>
					<th colspan="6" style="text-align: left; font-size: 15pt; border-bottom: 1px solid #072659">아이디정보</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>가입일</th>
					<td>${dto.createdDate}</td>
				</tr>
				<tr>
					<th>최근 정보 수정일</th>
					<td>${dto.modifyDate}</td>
				</tr>
				<tr>
					<th>마지막 로그인</th>
					<td>${dto.lastLoginDate}</td>
				</tr>
			</tbody>
		</table>
		
		<button type="button" class="myButt one" onclick="javascript:location.href='<%=cp%>/admin/membership/regular/regularList';">
			<div class='insider'></div>
			목록으로
		</button>
	</div>
</div>