<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/academystyle.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/academylayout.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>

<style type="text/css">

.imgLayout {
    height: 100%;
    margin: 30px 30px 30px 30px;
    background-color: #fff;
}

.ui-widget-header {
	    color: #222;
    font-weight: bold;
}

</style>

<script type="text/javascript">

$(function () {
	$("#apply").click(function() {
		$("from[name=applyForm]").each(function() {
			this.reset();
		});
		
		$("#dlgmode").val("insert");
		$("#btnProductSendOk").text("등록하기");
		$("#btnProductSendCancel").text("등록취소");
		
		$('#apply-dialog').dialog({
			  modal: true,
			  height: 500,
			  width: 600,
			  title: '수강신청결제',
			  close: function(event, ui) {
			  }
		});
	});
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


<div class="body-content-container-a">
     <div class="body-academy-title">
         <span class="academy-title">수강결제 정보</span>
     </div>  
     
     <div class="imgLayout" style="width: 1020px; height: 400px; border-bottom: 1px solid darkgrey;">
     	<div>
     		<img src="<%=cp%>/resource/images/france.jpg" width="240" border="0">
     		
     		<table style="width:700px; float: right;">
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				수강자
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">${sessionScope.member.userName}</td>
     			</tr>
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				강의명
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">${dto.academyName}</td>
     			</tr>
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				강의 요일.시간 
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">(${dto.lectureDay}) ${dto.startTime}~${dto.endTime}</td>
     			</tr>
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				강의 시작일 
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">${dto.startDate}</td>
     			</tr>
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				수강료
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">
       			  <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</td>
     			</tr>
     			<tr>
     			  <td colspan="2" width="150px" height="50px">
     				<p style="padding: 20px 0px 10px; font-size: 20px; text-align: center;">
	                   <button type="button" class="btn-Count" id="apply">결&nbsp;&nbsp;&nbsp;제</button>
	                </p>
       			  </td>
     			</tr>
			</table>
        </div> 
        	<div style="width: 240px; padding: 10px 20px 50px 0px; float: none;">	
            	<p style="font-size: 20px; font-weight: bold; padding-top: 10px;">
                	${dto.academyName}
                </p>
            </div>
            
            <div class="academy_desc3" style="width: 320px; padding: 10px 20px 20px 0px; float: none; margin: 0px;">
            	<table>
            		<tr>
            			<td class="font12" width="200px">강사</td>
            			<td class="font12" style="width: 550px; font-weight: 600; text-decoration: none;">| &nbsp;${dto.instName}</td>
            		</tr>
            		<tr>
            			<td class="font12" width="200px">요일.시간</td>
            			<td class="font12" style="width: 550px; font-weight: 600; text-decoration: none;">| &nbsp;(${dto.lectureDay}) ${dto.startTime}~${dto.endTime}</td>
            		</tr>	
            		<tr>
            			<td class="font12" width="200px">수강기간</td>
            			<td class="font12" style="width: 550px; font-weight: 600; text-decoration: none;">| &nbsp;${dto.startDate}(${dto.lectureDay})~${dto.endDate}(${dto.lectureDay})</td>
            		</tr>
            		<tr>
            			<td class="font12" width="200px">장소</td>
            			<td class="font12" style="width: 550px; font-weight: 600; text-decoration: none;">| &nbsp;${dto.position} | ${dto.roomName}</td>
            		</tr>
            	</table>	
            </div>
            <div>
        </div> 
     </div>
</div>
<div style="width:1020px; height: 300px; margin: 20px auto;">
	<div class="body-academy-title" style="width: 240px;">
		<span>결제 전 유의사항</span>
	</div> 
	<table style="width:666px; float: right;">
		<tr>
			<td width="150px" height="50px" style="background-color: #999;">
				<p style="font-size: 15px; color:#ffffff; font-weight: bold; text-align: center;">
           				구분
				</p>
			</td>
			<td width="150px" height="50px" style="background-color: #999;">
				<p style="font-size: 15px; color:#ffffff; font-weight: bold; text-align: center;">
           				환불 수수료
				</p>
			</td>
			<td width="150px" height="50px" style="background-color: #999;">
				<p style="font-size: 15px; color:#ffffff; font-weight: bold; text-align: center;">
           				비고
				</p>
			</td>
		</tr>
		<tr>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				개강 전
				</p>
			</td>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				-
				</p>
			</td>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				100% 환불
				</p>
			</td>
		</tr>
		<tr>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				개강일 ~ 6주차
				</p>
			</td>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				회당 수수료 차감
				</p>
			</td>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				수강료 / 수업일수 = 1회 수수료
				</p>
			</td>
		</tr>
	</table>
	
	 <%//대화창 body %>
     <div id="apply-dialog" class="ui-widget-header" style="display: none; height: 420px;">
		<form name="applyForm" method="post">
			<table style="width: 560px; height:100px; border-spacing: 0px; border-collapse: collapse;">
			  <tr>
			  	 <td colspan="4" width="100px" height="50px" align="right" 
			  	 					style="font-size: 15px; font-weight: 500; color: #3185ce; padding-right: 15px;">
			          <b>|</b> 신용카드 카드선택/인증
			     </td>
			  </tr>
			  <tr>   
			  	 <td colspan="1" class="apply-td-left" width="150px" height="50px" align="right" style="border-top: 2px solid #434343;">
			           상품
			     </td>
			     <td colspan="3" width="400px" align="left" style="padding-left: 15px; border-top: 2px solid #434343; border-bottom: 2px solid #ccc;">
			      		<label style="font-weight: 600; font-size: 12px;">${dto.academyName}</label>
			     </td>
			  </tr>
			  <tr>
			      <td colspan="1" class="apply-td-left" width="100px" height="50px" align="right" style="border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">상품금액</label>
			      </td>
			      <td colspan="3" width="360px" align="left" style="padding-left: 15px; border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			      		<label style="font-weight: 600; font-size: 12px;">
						<fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</label>
			      </td>
			  </tr>
			  <tr>
			  	 <td colspan="4" width="100px" height="40px" align="left" 
			  	 					style="font-size: 12px; font-weight: 500; padding-left: 15px; padding-top: 20px;">
			      		<input type="radio" id="c1" name="cardCom" value="신한카드"><label for="c1" style="padding-right: 25px;"> 신한카드</label>
			      		<input type="radio" id="c2" name="cardCom" value="삼성카드"><label for="c2" style="padding-right: 25px;"> 삼성카드</label> 
			      		<input type="radio" id="c3" name="cardCom" value="롯데카드"><label for="c3" style="padding-right: 25px;"> 롯데카드</label> 
			      		<input type="radio" id="c4" name="cardCom" value="KB카드"><label for="c4" style="padding-right: 25px;"> KB카드</label> 
						<input type="radio" id="c4" name="cardCom" value="우리카드"><label for="c4" style="padding-right: 25px;"> 우리카드</label>
						<span style="padding-left: 15px;"></span> 
						<select name="card">
						    <option value="">그 외의 카드</option>
						    <option value="비씨카드">비씨카드</option>
						    <option value="하나카드">하나카드</option>
						    <option value="NH카드">NH카드</option>
						    <option value="저축은행">저축은행</option>
						    <option value="카카오뱅크">카카오뱅크</option>
						</select>   
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
			            - <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			     	<span style="padding-left: 20px;">	
			     		<select name="month">
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
			            <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 30px; height: 25px;">
			            / <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 30px; height: 25px;">
			       </td>
			       <td class="apply-td-left" width="120px" height="50px" align="right" style="border-bottom: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">CVC</label>
			       </td>
			       <td width="200px" align="left" style="padding-left: 15px; border-bottom: 2px solid #434343;">
			            <input type="text" name="product" id="form-cardNum" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			       </td>      
			  </tr>
			  <tr>
			  		<td colspan="4" width="350px" height="100px" align="center"> 
			  			<button type="button" class="btn-Count" style="width: 100px; font-size: 13px;" id="apply" onclick="sendOk();">결&nbsp;&nbsp;&nbsp;제</button>
			  			<button type="button" class="btn-Count" style="width: 100px; font-size: 13px; padding-left: 15px;" id="apply">취&nbsp;&nbsp;&nbsp;소</button>
			  		</td>
			  </tr>    
			</table>
		</form>
    </div>
	
</div>