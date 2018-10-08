<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/ticketingLayout.css" type="text/css">
<script type="text/javascript">
function check(){
	
}
</script>

<div class="body-container">
<form id="bookingForm" method="post" onsubmit="return check();">
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
					<td style="text-align:right;padding-right:9px;width:100px;">${array[0] }원</td>
					<td style="text-align:center;width:100px;">
						<select name="tcnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="r-0">0매</option>
			                  <c:forEach var="i" begin="1" end="${rcnt}" step="1">
			                  	<option value="r-${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
				<tr style="height:31px;">
					<td style="width:110px;text-align:center;background: #f7f7f7;">기본할인</td>
					<td style="padding-left:9px;">장애인/국가유공자 할인 50%</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${rprice}원</td>
					<td style="text-align:center;width:100px;">
						<select name="salercnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="r-0">0매</option>
			                  <c:forEach var="i" begin="1" end="${rcnt}" step="1">
			                  	<option value="r-sale-${i}">${i}매</option>
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
					<td style="text-align:right;padding-right:9px;width:100px;">${array[1] }원</td>
					<td style="text-align:center;width:100px;">
						<select name="tscnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="s-0">0매</option>
			                  <c:forEach var="i" begin="1" end="${scnt}" step="1">
			                  	<option value="s-${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
				<tr style="height:31px;">
					<td style="width:110px;height:28px;text-align:center;background: #f7f7f7;">기본할인</td>
					<td style="padding-left:9px;">장애인/국가유공자 할인 50%</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${sprice}원</td>
					<td style="text-align:center;width:100px;">
						<select name="slaescnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="s-0">0매</option>
			                  <c:forEach var="i" begin="1" end="${scnt}" step="1">
			                  	<option value="s-sale-${i}">${i}매</option>
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
					<td style="text-align:right;padding-right:9px;width:100px;">${array[2] }원</td>
					<td style="text-align:center;width:100px;">
						<select name="tacnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="a-0">0매</option>
			                  <c:forEach var="i" begin="1" end="${acnt}" step="1">
			                  	<option value="a-${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
				<tr style="height:31px;">
					<td style="width:110px;height:28px;text-align:center;background: #f7f7f7;">기본할인</td>
					<td style="padding-left:9px;">장애인/국가유공자 할인 50%</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${aprice }원</td>
					<td style="text-align:center;width:100px;">
						<select name="tcnt" class="selectField" style="height:28px;width: 60px;">
			                  <option value="a-0">0매</option>
			                  <c:forEach var="i" begin="1" end="${acnt}" step="1">
			                  	<option value="a-sale-${i}">${i}매</option>
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
				<input type="radio">신용카드
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
</form>
</div>