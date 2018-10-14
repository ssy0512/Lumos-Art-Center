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
	/* modal ����â */
	$("#bookBtn").click(function() {
		$('#apply-dialog').dialog({
			  modal: true,
			  height: 540,
			  width: 600,
			  title: '���� ����',
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
				������ ���� ����
			</h1>
	<table class="detail_inform" style="width: 100%;">
		<tr>
			<td>���ø�</td>
			<td>${dto.exhibitName}</td>
		</tr>
		<tr>
			<td>�����Ⱓ</td>
			<td>${dto.exhibitStart}~${dto.exhibitEnd}</td>
		</tr>
		<tr>
			<td>�ο�</td>
			<td>${customers}</td>
		</tr>
		<tr>
			<td>Ƽ�� �ݾ�</td>
			<td>${total}</td>
		</tr>
		<tr>
			<td>���� �ݾ�</td>
			<td>${discount}</td>
		</tr>
		<tr>
			<td>���� ���� �ݾ�</td>
			<td>${total-discount}</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
			<div style="width: 150px; margin: 0 auto;">
				<button id="bookBtn">�����ϱ�</button></div>
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
			          <b>|</b> �ſ�ī�� ī�弱��/����
			     </td>
			  </tr>
			  <tr>   
			  	 <td colspan="1" class="apply-td-left" width="150px" height="50px" align="right" style="border-top: 2px solid #434343;">
			           ��ǰ
			     </td>
			     <td colspan="4" width="400px" align="left" style="padding-left: 15px; border-top: 2px solid #434343; border-bottom: 2px solid #ccc;">
			      		<label style="font-weight: 600; font-size: 12px;">${dto.exhibitName}</label>
			     </td>
			  </tr>
			  <tr>
			      <td colspan="1" class="apply-td-left" width="100px" height="50px" align="right" style="border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">��ǰ�ݾ�</label>
			      </td>
			      <td colspan="4" width="360px" align="left" style="padding-left: 15px; border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			      		<label style="font-weight: 600; font-size: 12px;" id="totalPrice">
						<fmt:formatNumber value="${total-discount}" pattern="#,###"/>��</label>
			      </td>
			  </tr>
			  <tr>
			  	 <td colspan="5" width="100px" height="40px" align="left" 
			  	 		style="font-size: 12px; font-weight: 500; padding-left: 15px; padding-top: 20px;    line-height: 25px;">
			  	 		<div style="float:left;">
			      		<input type="radio" id="c1" name="cardCom1" value="����ī��"><label for="c1" style="padding-right: 20px;"> ����ī��</label>
			      		<input type="radio" id="c2" name="cardCom2" value="�Ｚī��"><label for="c2" style="padding-right: 20px;"> �Ｚī��</label> 
			      		<input type="radio" id="c3" name="cardCom3" value="�Ե�ī��"><label for="c3" style="padding-right: 20px;"> �Ե�ī��</label> 
			      		<input type="radio" id="c4" name="cardCom4" value="KBī��"><label for="c4" style="padding-right: 20px;"> KBī��</label> 
						<input type="radio" id="c5" name="cardCom5" value="�츮ī��"><label for="c4" style="padding-right: 20px;"> �츮ī��</label>
						</div>
						<div style="float:left;">
						<select name="card" id="card" class="selectField">
						    <option value="">�� ���� ī��</option>
						    <option value="��ī��">��ī��</option>
						    <option value="�ϳ�ī��">�ϳ�ī��</option>
						    <option value="NHī��">NHī��</option>
						    <option value="��������">��������</option>
						    <option value="īī����ũ">īī����ũ</option>
						</select> 
						</div>
			     </td>
			  </tr>
			  <tr>
			  </table>
			  <table style="width: 560px; margin: 22px 0px; border-spacing: 0px; border-collapse: collapse;">
			  	<tr>
			      <td colspan="1" class="apply-td-left" width="10px" height="50px" align="right" style="border-top: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">ī���ȣ</label>
			      </td>
			      <td colspan="3" width="200px" align="left" style="padding-left: 15px; border-top: 2px solid #434343;">
			            <input type="text" name="product1" id="form-cardNum1" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="password" name="product2" id="form-cardNum2" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="password" name="product3" id="form-cardNum3" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			            - <input type="text" name="product4" id="form-cardNum4" maxlength="100" class="applyTF" style="width: 65px; height: 25px;">
			     	<span style="padding-left: 10px;">	
			     		<select name="month" class="selectField">
						    <option value="">�Һΰ���</option>
						    <option value="2����">2����</option>
						    <option value="4����">4����</option>
						    <option value="6����">6����</option>
						    <option value="12����">12����</option>
						    <option value="24����">24����</option>
						</select>
					</span>	
			      </td>
			  </tr>
			  <tr>
			       <td class="apply-td-left" width="120px" height="50px" align="right" style="border-top: 2px solid #ccc; border-bottom: 2px solid #434343;">
			            <label style="font-weight: 600; font-size: 12px;">��ȿ�Ⱓ</label>
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
			  			<button type="button" class="btn-Count" style="width: 100px; font-size: 13px;" onclick="location.href='<%=cp %>/exhibit/book/finish'">��&nbsp;&nbsp;&nbsp;��</button>
			  			<button type="button" class="btn-Count" style="width: 100px; font-size: 13px; padding-left: 15px;" id="close">��&nbsp;&nbsp;&nbsp;��</button>
			  		</td>
			  </tr>    
			</table>
		</form>
    </div>