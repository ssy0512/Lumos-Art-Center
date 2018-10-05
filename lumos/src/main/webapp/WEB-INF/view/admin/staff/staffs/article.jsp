<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
.staff-article {
	width: 850px; height: 650px; margin: 70px auto;
	border: 1px solid #333333; border-radius: 50px;
}
.staff-article-userInfo {
	width: 700px;
	clear: both;
	font-size: 12pt;
	text-align: center;
	margin: 20px auto;
}
.staff-article-userId {
	margin: 20px 0;
	text-align: center;
	font-size: 27pt;
	font-weight: 700;
	
}
.staff-article-userInfo tr th, tr td, .staff-article-id-Info thead tr th, tbody tr td {
	height: 40px;
}
.staff-article-id-Info {
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
.staff-article-image {
	margin: 20px 320px;
}
</style>

<script type="text/javascript">
function updateRegular() {
		var staffNum = "${dto.staffNum}";
		var page = "${page}";
		var query = "staffNum="+staffNum+"&page="+page;
		var url = "<%=cp%>/admin/staff/staffs/update?" + query;
		
		location.href=url;
	}

</script>

<div class="body-right" style="width: 1380px; height: 800px;">
	<!-- 메인 -->
	<div class="staff-article">
		<p style="clear: both; margin: 30px 35px 20px 700px; font-size: 12pt;">사번  No.${dto.staffNum}</p>
		<p class="staff-article-userId">${dto.staffName}</p>
		<div class="staff-article-image">
			<img src="<%=cp%>/uploads/image/${dto.staffImage}" style="width: 220px; height: 220px; border-radius: 110px;">
		</div>
			<table class="staff-article-userInfo">
				<thead>
					<tr>
						<th colspan="6" style="text-align: left; font-size: 15pt; border-bottom: 1px solid #072659">사원정보</th>
					</tr>
				</thead>
				<tr>
					<%-- <th>이름</th>
					<td>${dto.userName}</td> --%>
					<th>생년월일</th>
					<td>${dto.birth}</td>
					<th>전화번호</th>
					<td>${dto.tel}</td>
				</tr>
				<tr>
					<th>소속부서</th>
					<td>${dto.department}</td>
					 <th>이메일</th>
					<td>${dto.email}</td>
				</tr>
			</table>
	<br>
	
		
		<button type="button" class="myButt one" onclick="javascript:location.href='<%=cp%>/admin/staff/staffs/stafflist';">
			<div class='insider'></div>
			목록으로
		</button>
	</div>
</div>