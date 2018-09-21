<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>
.regular-article-table-tr td {
	padding: 5px 10px;
}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	var zip = data.roadAddress; // 도로명 주소 변수
            var address1 = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            	address1 += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
            	address1 += (address1 !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(address1 !== ''){
            	address1 = ' (' + address1 + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(zip !== ''){
            	zip += address1;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(zip);
            
            
            $("[name=zip]").val(data.zonecode);
            $("[name=addr1]").val(address1);
        }
    }).open();
}
</script>

<div class="body-right" style="width: 1380px; height: 800px;">
	<div style="clear: both;">
		<div style="float: left;">
			<button type="button" onclick="javascript:location.href='<%=cp%>/admin/membership/regular/regularList';">
				뒤로가기
			</button>
		</div>
		<div style="height: 70px; background-color: #e8e8e8; text-align: center; margin-top: 30px;">
			회원 정보 수정
		</div>
	</div>
	
	<!-- 메인 -->
	<table style="width: 1380px; clear: both; margin-top: 15px; text-align: center;">
		<thead>
			<tr style="height: 50px; background-color: #e0e0e0;">
				<th colspan="5">아이디 정보</th>
			</tr>
			<tr style="height: 30px; background-color: #e0e0e0;">
				<th>회원번호</th>
				<th>아이디</th>
				<th>최근 정보 수정일</th>
				<th>마지막 로그인</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<tr style="height: 30px;">
				<td>${dto.memberIndex}</td>
				<td>${dto.userId}</td>
				<td>${dto.modifyDate}</td>
				<td>${dto.lastLoginDate}</td>
				<td>${dto.createdDate}</td>
			</tr>
		</tbody>
	</table>
	<table style="width: 1380px; clear: both; text-align: center;">
		<thead>
			<tr style="height: 50px; background-color: #e0e0e0;">
				<th colspan="5">개인정보</th>
			</tr>
			<tr style="height: 30px; background-color: #e0e0e0;">
				<th style="width: 150px;">이름</th>
				<th style="width: 150px;">전화번호</th>
				<th style="width: 100px;">우편번호</th>
				<th>기본주소</th>
				<th>상세주소</th>
			</tr>
		</thead>
		<tbody>
			<tr class="regular-article-table-tr" style="height: 30px;">
				<td>
					<input type="text" value="${dto.userName}" required="required">
				</td>
				<td>
					<input type="text" value="${dto.phone}" required="required">
				</td>
				<td>
					<input class="form-control" id="zip" name="zip" type="text" value="${dto.zip}" readonly="readonly" placeholder="우편번호">
				</td>
				<td>
					<input class="form-control" id="addr1" name="addr1" type="text" value="${dto.address1}" readonly="readonly" placeholder="도로명 주소"
						style="width: 100%;">
				</td>
				<td>
					<input class="form-control" id="addr2" name="addr2" type="text" value="${dto.address2}" style="width: 100%;">
				</td>
			</tr>
		</tbody>
	</table>
	
<div class="form-group">                   
    <button type="button" class="btn btn-default" onclick="execPostCode();">
    	<i class="fa fa-search"></i>주소변경
    </button>                               
</div>
	
	
<%--<div>
		<button type="submit">수정완료</button>
	</div> --%>
</div>