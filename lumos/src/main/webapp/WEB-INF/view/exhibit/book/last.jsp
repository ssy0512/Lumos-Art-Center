<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitBookForm.css" type="text/css">
<script type="text/javascript">
$(function () {
	/* modal 결제창 */
	$("#bookBtn").click(function() {
		$('#apply-dialog').dialog({
			  modal: true,
			  height: 540,
			  width: 600,
			  title: '전시 결제',
			  close: function(event, ui) {
			  }
		});
		
	$("#close").modal("hide");
	});	
});


</script>
<div style="width: 740px;margin: 0 auto;">
			<h1 class="title" style="margin-top: 30px;">
				<img src="<%=cp %>/resource/images/lumos/reviews_gray.png">
				예매할 전시 정보
			</h1>
	<table class="detail_inform" style="width: 100%;">
		<tr>
			<td>전시명</td>
			<td>${dto.exhibitName}</td>
		</tr>
		<tr>
			<td>관람기간</td>
			<td>${dto.exhibitStart}~${dto.exhibitEnd}</td>
		</tr>
		<tr>
			<td>인원</td>
			<td>${customers}</td>
		</tr>
		<tr>
			<td>티켓 금액</td>
			<td>${total}</td>
		</tr>
		<tr>
			<td>할인 금액</td>
			<td>${discount}</td>
		</tr>
		<tr>
			<td>결제 예정 금액</td>
			<td>${total-discount}</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
			<div style="width: 150px; margin: 0 auto;">
				<button id="bookBtn">결제하기</button></div>
			</td>
		</tr>
	</table>
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
			      		<label style="font-weight: 600; font-size: 12px;">${dto.exhibitName}</label>
			     </td>
			  </tr>
			  <tr>
			      <td colspan="1" class="apply-td-left" width="100px" height="50px" align="right" style="border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">상품금액</label>
			      </td>
			      <td colspan="4" width="360px" align="left" style="padding-left: 15px; border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			      		<label style="font-weight: 600; font-size: 12px;" id="totalPrice">
						<fmt:formatNumber value="${total-discount}" pattern="#,###"/>원</label>
			      </td>
			  </tr>
			  <tr>
			  	 <td colspan="5" width="100px" height="40px" align="left" 
			  	 		style="font-size: 12px; font-weight: 500; padding-left: 15px; padding-top: 20px;    line-height: 25px;">
			  	 		<div style="float:left;">
			      		<input type="radio" id="c1" name="cardCom1" value="신한카드"><label for="c1" style="padding-right: 20px;"> 신한카드</label>
			      		<input type="radio" id="c2" name="cardCom2" value="삼성카드"><label for="c2" style="padding-right: 20px;"> 삼성카드</label> 
			      		<input type="radio" id="c3" name="cardCom3" value="롯데카드"><label for="c3" style="padding-right: 20px;"> 롯데카드</label> 
			      		<input type="radio" id="c4" name="cardCom4" value="KB카드"><label for="c4" style="padding-right: 20px;"> KB카드</label> 
						<input type="radio" id="c5" name="cardCom5" value="우리카드"><label for="c4" style="padding-right: 20px;"> 우리카드</label>
						</div>
						<div style="float:left;">
						<select name="card" id="card" class="selectField">
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
			            <input type="text" name="product1" id="form-cardNum1" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="password" name="product2" id="form-cardNum2" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="password" name="product3" id="form-cardNum3" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="text" name="product4" id="form-cardNum4" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
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
			            <input type="text" name="product5" id="form-cardNum5" maxlength="100" class="applyTF" style="width: 35px; height: 25px;" placeholder="YY">
			            / <input type="text" name="product6" id="form-cardNum6" maxlength="100" class="applyTF" style="width: 35px; height: 25px;" placeholder="MM">
			       </td>
			       <td class="apply-td-left" width="120px" height="50px" align="right" style="border-bottom: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">CVC</label>
			       </td>
			       <td width="200px" align="left" style="padding-left: 15px; border-bottom: 2px solid #434343;">
			            <input type="password" name="product7" id="form-cardNum7" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			       </td>      
			  </tr>
			  <tr>
			  		<td colspan="4" width="350px" height="100px" align="center"> 
			  			<button type="button" class="btn-Count" style="width: 100px; font-size: 13px;" onclick="location.href='<%=cp %>/exhibit/book/finish'">결&nbsp;&nbsp;&nbsp;제</button>
			  			<button type="button" class="btn-Count" style="width: 100px; font-size: 13px; padding-left: 15px;" id="close">취&nbsp;&nbsp;&nbsp;소</button>
			  		</td>
			  </tr>    
			</table>
		</form>
    </div>