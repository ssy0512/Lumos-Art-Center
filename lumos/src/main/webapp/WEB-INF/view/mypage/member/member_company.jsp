<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">

var memberEmail = "${companyChargeDTO.chargeEmail}";
	
function memberOk() {
	var f = document.memberForm;
	var str;

    
 // 담당자
    str = f.chargeName.value;
	str = str.trim();
	if(!str) {
		alert("담당자명을 입력하세요. ");
		f.chargeName.focus();
		return;
	}
	
	
	var check_id="chkChnagePwd";
	var chk = $("input:checkbox[id='"+ check_id + "']").is(":checked"); 
	chkpwd = 0;
	
	if(chk == true)
		chkpwd = 1;
	
	if(chk == true)
	{
		str = f.chargePwd.value;
		str = str.trim();
		if(!str) {
			alert("패스워드를 입력하세요. ");
			f.chargePwd.focus();
			return;
		}
		if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
			alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
			f.chargePwd.focus();
			return;
		}
		f.chargePwd.value = str;
	
		if(str!= f.chargePwdCheck.value) {
	        alert("패스워드가 일치하지 않습니다. ");
	        f.chargePwdCheck.focus();
	        return;
		}
	}
	
	str = f.chargeTel.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.chargeTel.focus();
        return;
    }
    
    
	str = f.email1.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }
    
	//
	
	f.chargeEmail.value = f.email1.value + "@" + f.email2.value;
	
	f.action = "<%=cp%>/mypage/member/member_company?changepwd=" + chkpwd;
    f.submit();
}

function changeEmail() {
    var f = document.memberForm;
	    
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}


function checkPhoneNumber() {
  	var x = document.getElementById("chargeTel");
  	x.value = x.value.replace(/[^0-9]/g, '');
  	var tmp = "";

  	if (x.value.length > 3 && x.value.length <= 7) {
  		tmp += x.value.substr(0, 3);
  		tmp += '-';
  		tmp += x.value.substr(3);
  		x.value = tmp;
  	} else if (x.value.length > 7) {
  		tmp += x.value.substr(0, 3);
  		tmp += '-';
  		tmp += x.value.substr(3, 4);
  		tmp += '-';
  		tmp += x.value.substr(7);
  		x.value = tmp;
  	}
  }
  
  
function checkChangePwd()
{
	var check_id="chkChnagePwd";
	var chk = $("input:checkbox[id='"+ check_id + "']").is(":checked"); 

	if(chk == true)
	{
		$("#chargePwd").prop("readonly", false);
		$("#chargePwdCheck").prop("readonly", false);
	}
	else
	{
		$("#chargePwd").prop("readonly", true);
		$("#chargePwdCheck").prop("readonly", true);
	}
}



function initForm()
{
	var emailArray = memberEmail.split('@');
	$("#email1").val(emailArray[0]);
	$("#email2").val(emailArray[1]);
		
	$("#selectEmail").val(emailArray[1]).attr("selected", "selected");
}

$(document).ready(function(){

	initForm();
	
});


</script>

<br/>
<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span>&nbsp;기업 정보 관리;</h3>
    </div>
    
        <div>
			<form name="memberForm" method="post">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">기업명</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="companyName" id="companyName" value="${companyDTO.companyName}"
                         onchange="" style="width: 95%;"
                         ${mode=="update" ? "readonly='readonly' ":""}
                         maxlength="15" class="boxTF" placeholder="기업명" readonly="readonly">
			        </p>
			        <!--
			        <p class="help-block">아이디는 5~20자 이내이며, 첫글자는 영문자로 시작해야 합니다.</p>
			        -->
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">대표자명</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="repName" id="repName" value="${companyDTO.repName}"
                         onchange="" style="width: 95%;"
                         ${mode=="update" ? "readonly='readonly' ":""}
                         maxlength="15" class="boxTF" placeholder="대표자명" readonly="readonly">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">대표 전화번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="repNumber" id="repNumber" value="${companyDTO.repNumber}"
                         onchange="" style="width: 95%;"
                         ${mode=="update" ? "readonly='readonly' ":""}
                         maxlength="15" class="boxTF" placeholder="대표 전화번호" readonly="readonly">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">FAX</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="fax" id="fax" value="${companyDTO.fax}"
                         onchange="" style="width: 95%;"
                         ${mode=="update" ? "readonly='readonly' ":""}
                         maxlength="15" class="boxTF" placeholder="FAX" readonly="readonly">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">사업자번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="businessNumber" id="businessNumber" value="${companyDTO.businessNumber}"
                         onchange="" style="width: 95%;"
                         ${mode=="update" ? "readonly='readonly' ":""}
                         maxlength="15" class="boxTF" placeholder="사업자번호" readonly="readonly">
			        </p>
			      </td>
			  </tr>
			
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">우편번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="businessPost" id="businessPost" value="${companyDTO.businessPost}"
			                       class="boxTF" readonly="readonly">
			            <!-- 
			            <button type="button" class="btn" onclick="daumPostcode();">우편번호</button>          
			            -->
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">주소</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="address1" id="address1"  value="${companyDTO.address1}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="기본 주소" readonly="readonly">
			        </p>
			        <p style="margin-bottom: 5px;">
			            <input type="text" name="address2" id="address2" value="${companyDTO.address2}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="나머지 주소" readonly="readonly">
			        </p>
			      </td>
			  </tr>
			  
			  </table>
			  
			  <br/>
			  
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			  
			  
			  
			  <tr>
			  
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">담당자명</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="chargeName" id="chargeName" value="${companyChargeDTO.chargeName}"
                         onchange="" style="width: 95%;"
                         ${mode=="update" ? "readonly='readonly' ":""}
                         maxlength="15" class="boxTF" placeholder="담당자명">
			        </p>
			      </td>
			  </tr>
			  
			 
			 
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">전화번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            
			            <input type="text" name="chargeTel" id="chargeTel" onkeyup="checkPhoneNumber()" value="${companyChargeDTO.chargeTel}" class="boxTF" maxlength="13">
			      
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">이메일</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <select name="selectEmail" id="selectEmail" onchange="changeEmail();" class="selectField">
			                <option value="">선 택</option>
			                <option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
			                <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
			                <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
			                <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
			                <option value="direct">직접입력</option>
			            </select>
			            <input type="text" name="email1" id="email1" value="${dto.email1}" size="13" maxlength="30"  class="boxTF">
			            @ 
			            <input type="text" name="email2" id="email2" value="${dto.email2}" size="13" maxlength="30"  class="boxTF" readonly="readonly">
						<input type="hidden" name="chargeEmail" value="${dto.chargeEmail}" size="13" maxlength="30"  class="boxTF" readonly="readonly">
			        </p>
			      </td>
			     
			  </tr>
			  
			  
			 
			
			</table>
			
			<br/>
			  
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			  
			  
			   <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
		  
		  		<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">패스워드 변경</label>
			      </td>

			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 5px; margin-bottom: 10px;">
			            <input type="checkbox" name="chkChnagePwd" id="chkChnagePwd" value="1" onchange="checkChangePwd()"> 변경
			        </p>
			      </td>
			      
			  
			<tr>
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">패스워드</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="password" name="chargePwd" id="chargePwd" maxlength="15" class="boxTF"
			                       style="width:95%;" placeholder="패스워드" readonly="readonly">
			        </p>
			        <p class="help-block">패스워드는 5~10자 이내이며, 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</p>
			      </td>
			  </tr>
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">패스워드 확인</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="password" name="chargePwdCheck" id="chargePwdCheck" maxlength="15" class="boxTF"
			                       style="width: 95%;" placeholder="패스워드 확인" readonly="readonly">
			        </p>
			        <p class="help-block">패스워드를 한번 더 입력해주세요.</p>
			      </td>
			  </tr>
			
			
			  
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" name="sendButton" class="btn" onclick="memberOk();">회원 정보 수정</button>
			      </td>
			    </tr>
			    <tr height="30">
			        <td align="center" style="color: blue;">${message}</td>
			    </tr>
			  </table>
			</form>
        </div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('businessPost').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>
</div>
