<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/ticketingLayout.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/academystyle.css" type="text/css">
<script type="text/javascript">
$(function () {
	/* modal 결제창 */
	$("#bookBtn").click(function() {
		var f = document.finalbookForm;
		var chk1=f.cancelAgree.checked;
	    if(!chk1) {
	        alert("취소수수료/취소기한 동의에 체크해주세요.");
	        return;
	    }
	    var chk2=f.agree.checked;
	    if(!chk2) {
	        alert("제 3자 정보제공 내용 동의에 체크해주세요.");
	        return;
	    }
	    
		$("from[name=applyForm]").each(function() {
			this.reset();
		});
		
		$("#dlgmode").val("insert");
		
		$('#apply-dialog').dialog({
			  modal: true,
			  height: 540,
			  width: 600,
			  title: '공연 결제',
			  close: function(event, ui) {
			  }
		});
	});	
	
	$("#close").madal("hide");
});

function sendOk() {
    var f = document.boardForm;
    
	var $product=$("#form-cardNum").val();
    if(! $product) {
        alert("제목을 입력하세요. ");
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
    
	f.action="<%=cp%>";

    f.submit();
}

</script>
<div class="body-container">
<form name="finalbookForm" method="post">
<div>
	<h3 class="title">예매할 공연정보</h3>
	<table class="price-table">
		<tr style="height:31px;border-bottom:1px solid #434343;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">공연명</td>
			<td style="padding-left:15px;width:380px;">${dto.concertName }</td>
			<td style="text-align:center;width:130px;">&nbsp;</td>
			<td style="text-align:center;width:380px;">&nbsp;</td>
		</tr>
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
			<td style="padding-left:15px;width:380px;"><fmt:formatNumber value="${totalPrice }" type="number"/>원</td>
			<td style="text-align:center;width:130px;background: #f7f7f7;">할인금액</td>
			<td style="padding-left:15px;width:380px;"><fmt:formatNumber value="${discount }" type="number"/>원</td>
		</tr>
		<tr style="height:31px;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">총 결제금액</td>
			<td colspan="3" style="padding-left:15px;color:red;font-weight:bold"><fmt:formatNumber value="${price }" type="number"/>원</td>
		</tr>
	</table>
	<table class="price-table" style="margin-top:15px;">
		<tr style="height:50px;">
			<td style="text-align:center;width:130px;background: #f7f7f7;">취소마감시간</td>
			<td style="padding-left:15px;width:380px;background: #f7f7f7;border-right:1px solid #434343;color:red;">${cancelTime }까지</td>
			<td style="text-align:center;width:130px;background: #f7f7f7;">취소수수료</td>
			<td style="padding-left:15px;width:300px;background: #f7f7f7;">티켓금액의 0~30%<br>(취소 시점에 따라 차등 수수료)</td>
			<td style="width:80px;background: #f7f7f7;"><button name="notice1" class="btn">자세히</button></td>
		</tr>
	</table>
	<p style="margin-left: 15px;margin-top:15px;"><input type="checkbox" name="cancelAgree">
	<span style="margin-left: 15px;">취소수수료/취소기한을 확인하였으며, 이에 동의합니다.</span></p>
	<p style="margin-left: 15px;line-height: 32px;"><input type="checkbox" name="agree">
		<span style="margin-left: 15px;">제 3자 정보제공 내용에 동의합니다.</span>
		<button name="notice2" style="margin-left: 25px;" class="btn">자세히</button>
	</p>
	<div style="text-align:center;margin-top:15px;">
		<button type="button" class="adBtn" onclick="history.back();">
			이전단계
		</button>
		<button type="button" class="adBtn" id="bookBtn">
			결제하기
		</button>
	</div>
</div>
</form>
</div>

    <div id="apply-dialog" class="ui-widget-header" style="display: none;">
		<form name="applyForm" method="post">
			<table style="width: 560px; height:100px; border-spacing: 0px; border-collapse: collapse;">
			  <tr>
			  	 <td colspan="5" width="100px" height="50px" align="right" 
			  	 					style="font-size: 15px; font-weight: 500; color: #3185ce; padding-right: 15px;">
			          <b>|</b> 신용카드 카드선택/인증
			     </td>
			  </tr>
			  <tr>   
			  	 <td colspan="1" class="apply-td-left" width="150px" height="50px" align="right" style="border-top: 2px solid #434343;">
			           상품
			     </td>
			     <td colspan="4" width="400px" align="left" style="padding-left: 15px; border-top: 2px solid #434343; border-bottom: 2px solid #ccc;">
			      		<label style="font-weight: 600; font-size: 12px;">${dto.concertName}</label>
			     </td>
			  </tr>
			  <tr>
			      <td colspan="1" class="apply-td-left" width="100px" height="50px" align="right" style="border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">상품금액</label>
			      </td>
			      <td colspan="4" width="360px" align="left" style="padding-left: 15px; border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			      		<label style="font-weight: 600; font-size: 12px;">
						<fmt:formatNumber value="${price}" pattern="#,###"/>원</label>
			      </td>
			  </tr>
			  <tr>
			  	 <td colspan="5" width="100px" height="40px" align="left" 
			  	 		style="font-size: 12px; font-weight: 500; padding-left: 15px; padding-top: 20px;    line-height: 25px;">
			  	 		<div style="float:left;">
			      		<input type="radio" id="c1" name="cardCom" value="신한카드"><label for="c1" style="padding-right: 20px;"> 신한카드</label>
			      		<input type="radio" id="c2" name="cardCom" value="삼성카드"><label for="c2" style="padding-right: 20px;"> 삼성카드</label> 
			      		<input type="radio" id="c3" name="cardCom" value="롯데카드"><label for="c3" style="padding-right: 20px;"> 롯데카드</label> 
			      		<input type="radio" id="c4" name="cardCom" value="KB카드"><label for="c4" style="padding-right: 20px;"> KB카드</label> 
						<input type="radio" id="c4" name="cardCom" value="우리카드"><label for="c4" style="padding-right: 20px;"> 우리카드</label>
						</div>
						<div style="float:left;">
						<select name="card" class="selectField">
						    <option value="">그 외의 카드</option>
						    <option value="비씨카드">비씨카드</option>
						    <option value="하나카드">하나카드</option>
						    <option value="NH카드">NH카드</option>
						    <option value="저축은행">저축은행</option>
						    <option value="카카오뱅크">카카오뱅크</option>
						</select> 
						</div>
			     </td>
			  </tr>
			  <tr>
			  </table>
			  <table style="width: 560px; margin: 22px 0px; border-spacing: 0px; border-collapse: collapse;">
			  	<tr>
			      <td colspan="1" class="apply-td-left" width="10px" height="50px" align="right" style="border-top: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">카드번호</label>
			      </td>
			      <td colspan="3" width="200px" align="left" style="padding-left: 15px; border-top: 2px solid #434343;">
			            <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="password" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="password" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			     	<span style="padding-left: 10px;">	
			     		<select name="month" class="selectField">
						    <option value="">할부개월</option>
						    <option value="2개월">2개월</option>
						    <option value="4개월">4개월</option>
						    <option value="6개월">6개월</option>
						    <option value="12개월">12개월</option>
						    <option value="24개월">24개월</option>
						</select>
					</span>	
			      </td>
			  </tr>
			  <tr>
			       <td class="apply-td-left" width="120px" height="50px" align="right" style="border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">유효기간</label>
			       </td>
			       <td width="140px" align="left" style="padding-left: 15px; border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			            <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 35px; height: 25px;" placeholder="YY">
			            / <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 35px; height: 25px;" placeholder="MM">
			       </td>
			       <td class="apply-td-left" width="120px" height="50px" align="right" style="border-bottom: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">CVC</label>
			       </td>
			       <td width="200px" align="left" style="padding-left: 15px; border-bottom: 2px solid #434343;">
			            <input type="password" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			       </td>      
			  </tr>
			  <tr>
			  		<td colspan="4" width="350px" height="100px" align="center"> 
			  			<button type="button" class="btn-Count" style="width: 100px; font-size: 13px;" onclick="sendOk();">결&nbsp;&nbsp;&nbsp;제</button>
			  			<button type="button" class="btn-Count" style="width: 100px; font-size: 13px; padding-left: 15px;" id="close">취&nbsp;&nbsp;&nbsp;소</button>
			  		</td>
			  </tr>    
			</table>
		</form>
    </div>