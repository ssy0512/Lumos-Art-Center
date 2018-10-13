<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/ticketingLayout.css" type="text/css">
<script type="text/javascript">
function goCheck(){
	var f=document.bookingForm;
	
	var $rcnt="${rcnt}";
	var $scnt="${scnt}";
	var $acnt="${acnt}";
	var totalCount="${total}";
	
	var rcount=Number($("#trcnt").val())+Number($("#salercnt").val());
	var scount=Number($("#tscnt").val())+Number($("#salescnt").val());
	var acount=Number($("#tacnt").val())+Number($("#saleacnt").val());
	
	if(rcount!=$rcnt || scount!=$scnt || acount!=$acnt || (rcount+scount+acount)!=totalCount){
		alert("매수를 다시 선택해주세요.");
		return false;
	}
	
	<%-- 마일리지 정규식 --%>
	var regexp = /^[0-9]*$/;
	var $mil=$("input[name=mileage]").val();
	if( !regexp.test($mil) ) {
		alert("마일리지는 숫자만 입력 가능합니다.");
		return false;
	}
	var $totalMil=Number("${totalMileage}");
	$mil=Number($mil);
	if($mil > $totalMil){
		alert("보유 마일리지 이상 사용은 불가능합니다.");
		return false;
	}
	if($mil < 1000){
		alert("마일리지는 1000점부터 사용 가능합니다.");
		return false;
	}
	
	<%-- 라디오버튼 --%>
	if(!$('input:radio[name=card]').is(':checked')){
		alert("결제방식을 선택해주세요.");
		return false;
	}
	
	var num=$("input[name=sessionNum]").val();
	var hnum=$("input[name=hallNum]").val();

	f.action="<%=cp%>/ticketing/finalBook?sessionNum="+num+"&hallNum="+hnum;
	
	return true;
}
</script>

<div class="body-container">
<form name="bookingForm" method="post" onsubmit="return goCheck();">
	<h3 class="title">가격</h3>
	<c:if test="${rcnt!=0 }">
		<div>
			<p  class="count">
				<a style="font-weight:bold;">R석 | </a> 
				<span>좌석 ${rcnt }매를 선택하셨습니다.</span>
			</p>
			<table class="price-table">
				<tr style="border-bottom:1px solid #434343;height:31px;">
					<td style="width:110px;text-align:center;background: #f7f7f7;">기본가</td>
					<td style="padding-left:9px;">일반</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${array0 }원</td>
					<td style="text-align:center;width:100px;">
						<select id="trcnt" name="trcnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="0">0매</option>
			                  <c:forEach var="i" begin="1" end="${rcnt}" step="1">
			                  	<option value="${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
				<tr style="height:31px;">
					<td style="width:110px;text-align:center;background: #f7f7f7;">기본할인</td>
					<td style="padding-left:9px;">장애인/국가유공자 할인 50%</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${rprice}원</td>
					<td style="text-align:center;width:100px;">
						<select id="salercnt" name="salercnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="0">0매</option>
			                  <c:forEach var="i" begin="1" end="${rcnt}" step="1">
			                  	<option value="${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
	
	<c:if test="${scnt!=0 }">
		<div>
			<p  class="count">
				<a style="font-weight:bold;">S석 | </a> 
				<span>좌석 ${scnt }매를 선택하셨습니다.</span>
			</p>
			<table class="price-table">
				<tr style="border-bottom:1px solid #434343;height:31px;">
					<td style="width:110px;height:28px;text-align:center;background: #f7f7f7;">기본가</td>
					<td style="padding-left:9px;">일반</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${array1 }원</td>
					<td style="text-align:center;width:100px;">
						<select id="tscnt" name="tscnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="0">0매</option>
			                  <c:forEach var="i" begin="1" end="${scnt}" step="1">
			                  	<option value="${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
				<tr style="height:31px;">
					<td style="width:110px;height:28px;text-align:center;background: #f7f7f7;">기본할인</td>
					<td style="padding-left:9px;">장애인/국가유공자 할인 50%</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${sprice}원</td>
					<td style="text-align:center;width:100px;">
						<select id="salescnt" name="salescnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="0">0매</option>
			                  <c:forEach var="i" begin="1" end="${scnt}" step="1">
			                  	<option value="${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
	
	<c:if test="${acnt!=0 }">
		<div>
			<p class="count">
				<a style="font-weight:bold;">A석 | </a> 
				<span>좌석 ${acnt }매를 선택하셨습니다.</span>
			</p>
			<table class="price-table">
				<tr style="border-bottom:1px solid #434343;height:31px;">
					<td style="width:110px;height:28px;text-align:center;background: #f7f7f7;">기본가</td>
					<td style="padding-left:9px;">일반</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${array2 }원</td>
					<td style="text-align:center;width:100px;">
						<select id="tacnt" name="tacnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="0">0매</option>
			                  <c:forEach var="i" begin="1" end="${acnt}" step="1">
			                  	<option value="${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
				<tr style="height:31px;">
					<td style="width:110px;height:28px;text-align:center;background: #f7f7f7;">기본할인</td>
					<td style="padding-left:9px;">장애인/국가유공자 할인 50%</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${aprice }원</td>
					<td style="text-align:center;width:100px;">
						<select id="saleacnt" name="saleacnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="0">0매</option>
			                  <c:forEach var="i" begin="1" end="${acnt}" step="1">
			                  	<option value="${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
	
	<h3 class="title">마일리지 사용</h3>
	<table class="price-table">
		<tr style="height:31px;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">마일리지 사용</td>
			<td style="text-align:right;padding-right:15px;width:650px;"><input type="text" name="mileage"> P</td>
			<td style="text-align:center;background: #f7f7f7;">사용 가능한 마일리지 : ${totalMileage }P</td>
		</tr>
	</table>
	<h3 class="title">결제수단 선택</h3>
	<table class="price-table">
		<tr style="height:31px;">
			<td style="padding-left:20px;width:130px;background: #f7f7f7;">
				<input type="radio" name="card">신용카드
			</td>
		</tr>
	</table>

	<div style="text-align:center;margin-top:15px;">
		<button type="button" class="adBtn" onclick="history.back();">
			이전단계
		</button>
		<button type="submit" class="adBtn">
			다음단계
		</button>
	</div>
	<input type="hidden" name="sessionNum" value="${sessionNum }">
	<input type="hidden" name="hallNum" value="${hallNum }">
	<input type="hidden" name="array0" value="${array0}">
	<input type="hidden" name="array1" value="${array1}">
	<input type="hidden" name="array2" value="${array2}">
	<input type="hidden" name="bookedSeatNum" value="${bookedSeatNum}">
</form>
</div>