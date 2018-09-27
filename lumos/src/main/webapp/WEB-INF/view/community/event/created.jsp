<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function check() {
	// 입력 내용
	  var f = document.boardForm;
	var sel=$("select option:selected").val();
	
	var str = f.title.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.title.focus();
        return;
    }

    f.selected.value=sel;
    
    str = f.eventStart.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("이벤트 시작 기간을 제대로 입력해주세요[YYYY-MM-DD]. ");
        f.eventStart.focus();
        return;
    }
    str =f.eventEnd.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("이벤트 종료 기간을 제대로 입력해주세요[YYYY-MM-DD]. ");
        f.eventEnd.focus();
        return;
    }
    if(f.startDate.value > f.endDate.value){
    	alert("시작 기간은 종료 기간보다 늦을 수 없습니다.");
    	return;
    }
    str = f.eventWin.value;
    str = str.trim();
    if(!str || !isValidDateFormat(str)){
    	 alert("날짜를 제대로 입력해주세요[YYYY-MM-DD]. ");
         f.eventWin.focus();
         return;
    }
	
    // 스마트에디터 입력 내용
  
	str = f.content.value;
    if(!str || str=="<p>&nbsp;</p>") {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action="<%=cp%>/admin/community/event/${mode}";

    return true;
}

$(function(){
	$("#eventStart").datepicker({showMonthAfterYear:true});
	$("#eventEnd").datepicker({showMonthAfterYear:true});
	$("#eventWin").datepicker({showMonthAfterYear:true});
})
</script>

<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitArticle.css" type="text/css">


<%-- 포스터 + 상세정보 --%>
<form name="boardForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data">
<div class="exhibit_detail" style="min-height:450px;">
	<div class="wrap">
		<div class="pageTitleAndButton">
			<span>이벤트 등록</span>
		</div>
		<div class="poster left">
			<c:if test="${not empty dto.originalFilename }">
				<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/${dto.originalFilename}">
			</c:if>
			<c:if test="${empty dto.originalFilename }">
				<img class="list_image_crop" src="<%=cp %>/resource/images/lumos/noposter.png" >
			</c:if>
		</div>
		<div class="content right" style="min-height:350px;">
			<table class="detail_inform">
				<tbody>
					<tr style="height:40px">
						<th>제목</th>
						<td><input type="text" name="title" id="title" value="${dto.title}" class="boxTF" style="width:341px"></td>						
					</tr>
					<tr style="height:40px">
						<th>기간</th>
						<td>
							<input type="text" name="eventStart" id="eventStart" class="boxTF" readonly="readonly" value="${dto.eventStart}">~
							<input type="text" name="eventEnd" id="eventEnd" class="boxTF" readonly="readonly" value="${dto.eventEnd}">
						</td>						
					</tr>
					<tr style="height:40px">
						<th>당첨자 발표</th>
						<td><input type="text" name="eventWin" id="eventWin" readonly="readonly" value="${dto.eventWin}" class="boxTF"></td>						
					</tr>
					<tr style="height:40px">
						<th>이벤트 방식</th>
						<td>
							<select name="choose" class="boxTF">
								<option value="reply" <c:if test="${dto.selectOption}">selected="selected"</c:if>>댓글 이벤트</option>
						    	<option value="review" <c:if test="${dto.selectOption}">selected="selected"</c:if>>리뷰 이벤트</option>
							</select>
							<input type="hidden"  name="selected" value="">
						</td>
					</tr>
					<tr style="height:40px">
						<th>이벤트 이미지</th>
						<td> <input type="file" name="upload" class="boxTF" style="border:none;"></td>						
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div style="width: 1020px;    margin: 0 auto; min-height: 620px;">
	
	    <textarea name="content" id="content" style="width: 95%; height: 500px;">${dto.content}</textarea> <br>
	    <div class="eBtnDiv">
		    <button type="submit" class="eBtn" style="margin-right: 5px;'">${mode=='update'?'수정완료':'등록하기'}</button>
			<button type="reset" class="eBtn" style="margin-right: 5px;'">다시입력</button>
			<button type="button" class="eBtn" onclick="javascript:location.href='<%=cp%>/community/event/eventTab';">${mode=='update'?'수정취소':'등록취소'}</button>
			
			 <c:if test="${mode=='update'}">
			         <input type="hidden" name="num" value="${dto.eventNum}">
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