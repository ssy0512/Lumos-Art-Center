<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.company-table tr th {
	height: 35px;
	background-color: #e0e0e0;
}
</style>

<script type="text/javascript">
	function check() {
		var form = document.companyForm;
		
		var str = form.chargeName.value;
		if(!str) {
			form.chargeName.focus();
			return false;
		}
		
		str = form.chargeTel.value;
		if(!str) {
			form.chargeTel.focus();
			return false;
		}
		
		str = form.chargeEmail.value;
		if(!str) {
			form.chargeEmail.focus();
			return false;
		}
		return true;
	}
</script>

<div class="body-right" style="width: 1380px; height: 800px;">
	<div style="clear: both;">
		<div style="float: left;">
			<button type="button"
				onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyList';">
				뒤로가기</button>
		</div>
		<div
			style="height: 70px; background-color: #e8e8e8; text-align: center; margin-top: 30px;">
			기업회원 정보 수정</div>
	</div>

	<div style="clear: both;">
	<form name="companyForm" method="post" onsubmit="return check();" enctype="multipart/form-data">
		<table class="company-table" style="width: 1380px; clear: both; margin-top: 15px; text-align: center;">
			<tr>
				<th colspan="6" style="width: 5px; padding: 0 20px;">회사정보</th>
			</tr>
			<tr>
				<th>회원번호</th>
				<th>회사명</th>
				<th>사업자번호</th>
				<th>대표</th>
				<th>연락처</th>
				<th>팩스</th>
			</tr>
			<tr>
				<td>${dto.companyIndex}</td>
				<td>${dto.companyName}</td>
				<td>${dto.businessNumber}</td>
				<td>${dto.repname}</td>
				<td>${dto.repnumber}</td>
				<td>${dto.fax}</td>
			</tr>
		</table>
		<table class="company-table" style="width: 1380px; clear: both; text-align: center;">
			<tr>
				<th colspan="4" style="width: 5px; padding: 0 20px;">담당자정보</th>
			</tr>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
			</tr>
			<tr class="regular-article-table-tr" style="height: 30px;">
				<td>${dto.chargeId}</td>
				<td><input type="text" value="${dto.chargeName}"
					required="required"></td>
				<td><input type="text" value="${dto.chargeTel}"
					required="required"></td>
				<td><input type="text" value="${dto.chargeEmail}"
					required="required"></td>
			</tr>
		</table>
	</form>
	</div>
	<button type="submit" class="btn-ok"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
    <button type="button" class="btn-cancel" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyList';"> 취소 </button>
	
</div>
