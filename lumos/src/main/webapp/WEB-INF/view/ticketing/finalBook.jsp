<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/ticketingLayout.css" type="text/css">
<script type="text/javascript">

</script>
<div class="body-container">
<form name="finalForm" method="post">
<div>
	<h3 class="title">예매할 공연정보</h3>
	<table class="price-table">
		<tr style="height:31px;border-bottom:1px solid #434343;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">관람일자</td>
			<td style="padding-left:15px;width:380px;">${dto.sessionDate }</td>
			<td style="text-align:center;width:130px;background: #f7f7f7;">관람시간</td>
			<td style="padding-left:15px;width:380px;">${dto.sessionTime }</td>
		</tr>
		<tr style="height:31px;border-bottom:1px solid #434343;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">좌석(<a style="color:#aa1717;">${total }</a>)</td>
			<td colspan="3" style="padding-left:15px;width:380px;">${bookedSeatNum }</td>
		</tr>
		<tr style="height:31px;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">티켓수령</td>
			<td colspan="3" style="padding-left:15px;">현장수령</td>
		</tr>
	</table>
	<h3 class="title">결제내역</h3>
	<table class="price-table">
		<tr style="height:31px;border-bottom:1px solid #434343;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">티켓금액</td>
			<td style="padding-left:15px;width:380px;">${totalPrice }</td>
			<td style="text-align:center;width:130px;background: #f7f7f7;">할인금액</td>
			<td style="padding-left:15px;width:380px;">${discount}</td>
		</tr>
		<tr style="height:31px;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">총 결제금액</td>
			<td colspan="3" style="padding-left:15px;color:red;font-weight:bold">${price}원</td>
		</tr>
	</table>
	<table class="price-table" style="margin-top:15px;">
		<tr style="height:50px;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">취소마감시간</td>
			<td style="padding-left:15px;width:380px;background: #f7f7f7;border-right:1px solid #434343;">${cancelTime }</td>
			<td style="text-align:center;width:130px;background: #f7f7f7;">취소수수료</td>
			<td style="padding-left:15px;width:300px;background: #f7f7f7;">티켓금액의 0~30%<br>(취소 시점에 따라 차등 수수료)</td>
			<td style="width:80px;background: #f7f7f7;"><button name="notice1">자세히</button></td>
		</tr>
	</table>
	<p style="margin-left: 15px;margin-top:15px;"><input type="checkbox" name="cancelAgree"><span style="margin-left: 15px;">취소수수료/취소기한을 확인하였으며, 이에 동의합니다.</span></p>
	<p style="margin-left: 15px;margin-top:5px;"><input type="checkbox" name="agree">
		<span style="margin-left: 15px;">제 3자 정보제공 내용에 동의합니다.
		<button name="notice2" style="margin-left: 25px;">자세히</button></span>
	</p>
	<div style="text-align:center;margin-top:15px;">
		<button type="button" class="adBtn" onclick="history.back();">
			이전단계
		</button>
		<button type="submit" class="adBtn">
			결제하기
		</button>
	</div>
</div>
</form>
</div>