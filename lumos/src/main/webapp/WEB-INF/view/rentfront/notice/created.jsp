<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

function change(sel) {
	var f = document.boardForm;
	var aca = $("#locationNum option:selected").val();
	alert(aca);
}

function check() {
	// 입력 내용
	var f = document.boardForm;
	var sel=$("select option:selected").val();
	// alert(sel);
	
	var str = f.title.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.title.focus();
        return false;
    }

    f.selected.value=sel;
    
    str = f.rentStart.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("대관 시작 기간을 입력해주세요. [YYYY-MM-DD]. ");
        f.eventStart.focus();
        return false;
    }
    str =f.rentEnd.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("대관 종료 기간을 입력해주세요.[YYYY-MM-DD]. ");
        f.eventEnd.focus();
        return false;
    }
	
    // 스마트에디터 입력 내용
	str = f.content.value;
    if(!str || str=="<p>&nbsp;</p>") {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action="<%=cp%>/rentfront/notice/${mode}";

    return true;
}   

$(function(){
	$("#rentStart").datepicker({showMonthAfterYear:true});
	$("#rentEnd").datepicker({showMonthAfterYear:true});
})

</script>

<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitArticle.css" type="text/css">

<%-- 포스터 + 상세정보 --%>
<form name="boardForm" method="post" onsubmit="return submitContents(this);">
<div class="exhibit_detail" style="min-height:300px;">
	<div class="wrap">
		<div class="pageTitleAndButton" style="width: 500px; float: left;">
			<span>대관 등록</span>
		</div>
		<div class="content right" style="width: 500px; height: 250px; min-height: 50px;">
			<table class="detail_inform">
				<tbody>
					<tr style="height:40px">
						<th>제목</th>
						<td><input type="text" name="title" id="title" value="${dto.title}" class="boxTF" style="width:341px"></td>						
					</tr>
					<tr style="height:40px">
						<th>기간</th>
						<td>
							<input type="text" name="rentStart" id="rentStart" class="boxTF" readonly="readonly" value="${dto.rentStart}"> ~ 
							<input type="text" name="rentEnd" id="rentEnd" class="boxTF" readonly="readonly" value="${dto.rentEnd}">
						</td>						
					</tr>
					<tr style="height:40px">
						<th>대관장소</th>
						<td>
							<select id="locationNum" name="locationNum" class="boxTF" onchange="change(this)">
								<option value="concert" <c:if test="${dto.selectOption=='concert'}">selected="selected"</c:if>>공연장</option>
						    	<option value="exhibit" <c:if test="${dto.selectOption=='exhibit'}">selected="selected"</c:if>>전시장</option>
							</select>
							<input type="hidden" name="selected" value="">
						</td>
					</tr>
					<tr style="height:40px">
						<th>장소이름</th>
						<td>
						<select id="hallNum" name="concert" class="boxTF">
						<c:if test="${value==concert}">
							<c:forEach var="pList" items="${pList}" varStatus="status">
								<option class="concert" value="${pList.hallNum}">${pList.hallName}</option>
							</c:forEach>
						</c:if>
						<c:if test="${value==exhibit}">
						    <c:forEach var="pList2" items="${pList2}" varStatus="status">
						    	<option class="exhibit" value="${pList2.hallNum}">${pList2.hallName}</option>
							</c:forEach>
						</c:if>	
						</select>	
							<input type="hidden" name="selected" value="">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div style="width: 1020px;    margin: 0 auto; min-height: 620px;">
	
	    <textarea name="content" id="content" style="width: 95%; height: 500px;">${dto.content}</textarea> <br>
	    <div class="eBtnDiv" style="padding: 15px 0px 50px;">
		    <button type="submit" class="eBtn" style="margin-right: 5px;'">${mode=='update'?'수정완료':'등록하기'}</button>
			<button type="reset" class="eBtn" style="margin-right: 5px;'">다시입력</button>
			<button type="button" class="eBtn" onclick="javascript:location.href='<%=cp%>/rentfront/main';">${mode=='update'?'수정취소':'등록취소'}</button>
			
			 <c:if test="${mode=='update'}">
		         <input type="hidden" name="rentConcertNum" value="${dto.rentConcertNum}">
		         <input type="hidden" name="exhibitNum" value="${dto.exhibitNum}">
			</c:if>
			        
	    </div>
</div>
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
		}
	}, //boolean
	fOnAppLoad : function(){
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>

