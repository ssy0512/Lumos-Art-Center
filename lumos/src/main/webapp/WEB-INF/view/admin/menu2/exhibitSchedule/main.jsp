<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.print.min.css" media='print' type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/scheduler/scheduler.min.css" type="text/css">

<style type="text/css">
.ui-widget-header {
	background:none;
	border:none;
	height:35px;
	line-height:35px;
	border-bottom: 1px solid #ccc;
	border-radius: 0px;
}

.ui-widget-content{
	border-color: #ccc;
}

#calendar{
	max-width: 1040px;
	margin: 20px auto 20px;
}

#schLoading {
	display:none;
	position: absolute;
	top:10px;
	right:10px;
}
</style>	


<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/scheduler/scheduler.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/locale-all.js"></script>


<script type="text/javascript">
var calendar=null;

$(function(){
	calendar=$('#calendar').fullCalendar({
		edirable:true,
		selectable:true,
		selectHelper:true,
		locale:'ko',
		aspectRatio:1.8,
		scrollTime: '09:00',
		header:{
			left: 'today prev,next',
			center:'title',
			right:'timelineDay,timelineThreeDays,agendaWeek,month,list'
		},
		defaultView:'month',
		views:{
			timelineThreeDays:{
				type:'timeline',
				duration:{days:3}
			}
		},
		resourceGroupField:'groupName', //json값
		resources:{
			url:'<%=cp%>/admin/menu2/exhibitSchedule/resources',
			type:'post',
			error:function(){
				console.log("ERROR");
			}
		},
		events:function(start,end,timezone,callback){
			var startDay = start.format("YYYY-MM-DD");
			var endDay=end.format("YYYY-MM-DD");
			var url='<%=cp%>/admin/menu2/exhibitSchedule/events';
			var query="start="+startDay+"&end="+endDay;
			
			$.ajax({
				url:url,
				type:"post",
				data:query,
				dataType:'json',
				success:function(data,text,request){
					callback(data);
				}
				
			});
		},
		select:function(start,end,jsEvent,view,resource){
			insertForm(start,end,resource);
		},
		eventClick:function(calEvent,jsEvent,view){
			articleForm(calEvent);
		},
		eventDrop:function(event,dayDelta,minuteDelta,revertFunc,jsEvent,ui,view){
			updateDrag(event);
		},
		eventResize:function(event,dayDelta,minuteDelta,revertFunc){
			updateDrag(event);
		},
		schedulerLicenseKey:'CC-Attribution-NonCommercial-NoDerivatives'
	});
});

function insertForm(start,end,resource){
	var groupNum="";
	var resourceNum="";
	
	if(resource){
		resourceNum=resource.id;
		var url="<%=cp%>/admin/menu2/exhibitSchedule/readHallList";
		var query="resourceNum="+resourceNum;
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data){
				var state=data.state;
				if(state=="false"){
					return;
				}
				groupNum=data.dto.groupNum;//jsondto의 값. 
			}
		,error:function(e){
			console.log(e.responseText);
		}
		});
	}
	var dlg=$("#resourceModal").dialog({
		autoOpen:false,
		modal:true,
		buttons:{
			" 등록 " :function(){
				insertOk();
			},
			" 취소 " :function(){
				$(this).dialog("close");
			}
		},
		height: 800,
		width:600,
		title: "전시 일정 등록",
		close:function(event,ui){
			
		}
	});
	$('#resourceModal').load("<%=cp%>/admin/menu2/exhibitSchedule/inputForm",function(){
		var startDay="", startTime="";
		var endDay="", endTime="";
		startDay=start.format("YYYY-MM-DD");
		startTime=start.format("HH:mm");
		
		$("input[name='startDay']").val(startDay);
		
		if(start.hasTime()){
			$("#startTime").show();
			$("#endTime").show();
			
			$("#input[name='startTime']").val(startTime);
			if(start.format()!=end.format()){
				endDay=end.format("YYYY-MM-DD");
				endTime=end.format("HH:mm");
				
				$("input[name='endDay']").val(endDay);
				$("input[name='endTime']").val(endTime);
			}
		}
		changeGroup(groupNum,resourceNum);
		//changeGroup(locationNum,hallNum);
		dlg.dialog("open");
	});
	
}

function changeGroup(groupNum,resourceNum){
	if(groupNum==undefined||groupNum==""){
		groupNum=$("form[name=schedulerForm] select [name=groupNum]").val();
	}
	if(groupNum==undefined||groupNum==""){
		return;
	}
	var url="<%=cp%>/admin/menu2/exhibitSchedule/listHall";
	var query="groupNum="+groupNum;
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			$("select[name=resourceNum] option").each(function() {$("select [name=resourceNum] option:eq(0)").remove();});
			for(var idx=0; idx<data.list.length; idx++){
				var num=data.list[idx].resourceNum;
				var name=data.list[idx].resourceName;
				
				$("select[name=resourceNum]").append("<option value='"+num+"'>"+name+"</option>");//exhibitNum, exhibitName
			}
			$("select[name=groupNum]").val(groupNum);
			if(resourceNum!=undefined && resourceNum!="")
				$("select [name=resourceNum]").val(resourceNum);
			
		}
	,error:function(e){
		console.log(e.responseText);
	}
	});
}
function insertOk(){
	if(! validCheck())
		return;
	
	var query=$("form[name=schedulerForm]").serialize();
	var url="<%=cp%>/admin/menu2/exhibitSchedule/schedulerInsert";
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			var state=data.state;
			if(state=="true"){
				calendar.fullCalendar("refetchEvents");
			}
		}
	,error:function(e){
		console.log(e.responseText);
	}
	});
	$("#resourceModal").dialog("close");
}

function validCheck(){
	var groupNum=$.trim($("select[name='groupNum']").val());
	var resourceNum=$.trim($("select[name='resourceNum']").val());
	var title=$.trim($("input[name='title']").val());
	var startDay=$.trim($("input[name='startDay']").val());
	var endDay=$.trim($("input[name='endDay']").val());
	var startTime=$.trim($("input[name='startTime']").val());
	var endTime=$.trim($("input[name='endTime']").val());
	var exhallLocate=$.trim($("input[name='exhallLocate']").val());
	/*
	주관, 주최 등등. 
	*/
	
	if(! groupNum) {
		alert("장소를 선택 하세요.");
		$("select[name='groupNum']").focus();
		return false;
	}
	if(! resourceNum){
		alert("홀을 선택해 주세요.");
		$("select[name='resourceNum']").focus();
		return false;
	}
	if(! title){
		alert("전시명을 입력 하세요.");
		$("select[name='title']").focus();
		return false;
	}
	 if(! /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/.test(startDay)){
		alert("날짜를 정확히 입력 하세요 [yyyy-mm-dd] ");
		$("input[name='startDay']").focus();
		return false;
	}
		 
	 if(endDay!="" && ! /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/.test(endDay)){
		alert("날짜를 정확히 입력 하세요 [yyyy-mm-dd] ");
		$("input[name='endDay']").focus();
		return false;
	 }
	 if(startTime!="" && ! /[0-2][0-9]:[0-5][0-9]/.test(startTime)){
		alert("시간을 정확히 입력 하세요 [hh:mm] ");
		$("input[name='startTime']").focus();
		return false;
	 }
		 
	if(endTime!="" && ! /[0-2][0-9]:[0-5][0-9]/.test(endTime)){
		alert("시간을 정확히 입력 하세요 [hh:mm] ");
		$("input[name='endTime']").focus();
		return false;
	}
	if(! exhallLocate){
		alert("상세를 입력 하세요.");
		$("select[name='exhallLocate']").focus();
		return false;
	}
	/*
	더 많은 제약조건이 들어가야함 ㅠㅠ.... 
	*/
}
//상세
function articleForm(calEvent){
	var concertNum=calEvent.id;
	var hallNum=calEvent.resourceId;
	var start=calEvent.start.format();
	var end="";
	if(calEvent.end!=null)
		end=calEvent.end.format();
	var hallName=calEvent.resourceName;
	var locationNum=calEvent.groupNum;
	var kind=calEvent.groupName;
	var userId=calEvent.userid;
	var userName=calEvent.userName;
	var exhibitStart=calEvent.startDay;
	var admitStart=calEvent.startTime;
	if(startTime!=null)
		startTime=startTime.substr(0,5);
	else 
		startTime="";
	var exhibitEnd=calEvent.endDay;
	var admitEnd=calEvent.endTime;
	var exhallLocate=calEvent.exhallLocate;
	if(endTime!=null){
		endTime=endTime.substr(0,5);
	}else {
		if(startDay!=endDay)
			endDay=calEvent.end.add("-1","days").format("YYYY-MM-DD");
		endTime="";
	}
	var dlg=$("#resourceModal").dialog({
		autoOpen:false,
		modal:true,
		buttons:{
			" 수정 ":function(){
				updateForm(exhibitNum,locationNum,hallNum,exhibitName,exhibitStart,exhibitEnd, admitStart,admitEnd);
			},
			" 삭제 ":function(){
				deleteOk(exhibitNum);
			},
			" 닫기 ":function(){
				$(this).dialog("close");
			}
		},
		height:700,
		width: 600,
		title:"일정 상세",
		close:function(event,ui){
		}
	});
	
	$('#resourceModal').load("<%=cp%>/admin/menu2/exhibitSchedule/articleForm",function(){
		$("#schkind").html(kind);
		$("#schhall").html(hallName);
		$("#schexhibit").html(exhibitName);
		$("#schUserName").html(userName);
		$("#schStartDay").html(exhibitStart);
		$("#schEndDay").html(exhibitEnd);
		$("#schexhallLocate").html(exhallLocate);
		//더 있을것....
		
		dlg.dialog("open");
	});
} 

function updateForm(exhibitNum,locationNum,hallNum,exhibitName,exhibitStart,exhibitEnd, admitStart,admitEnd){
	var dlg=$("#resourceModal").dialog({
	autoOpen:false,
	modal:true,
	buttons:{
		" 확인 ":function(){
			updateOk();
		},
		" 닫기 ":function(){
			$(this).dialog("close");
		}
	},
	height:700,
	width: 600,
	title:"일정 수정",
	close:function(event,ui){
	}
});
	$('#resourceModal').load("<%=cp%>/admin/menu2/exhibitSchedule/inputForm",function(){
		$("select[name='locationNum']").val(locationNum);
		$("input[name='exhibitName']").val(exhibitName);
		$("input[name='exhibitStart']").val(exhibitStart);
		$("input[name='exhibitEnd']").val(exhibitEnd);
		$("input[name='admitStart']").val(admitStart);
		$("input[name='admitEnd']").val(admitEnd);
		$("input[name='exhibitNum']").val(exhibitNum);
		$("input[name='exhallLocate']").val(exhallLocate);
		
		$("input[name='exhibitName']").focus();
		changeGroup(groupNum,resourceNum);
		dlg.dialog("open");
	});
}

function updateOk(){
	if(! validCheck())
		return;
	
	var query=$("form[name=schedulerForm]").serialize();
	var url="<%=cp%>/admin/menu2/exhibitSchedule/schedulerUpdate";
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			var state=data.state;
			if(state=="true"){
				calendar.fullCalendar('refetchEvents');
			}else{
				alert("게시글 수정 권한이 없습니다.");
			}
		}
	,error:function(e){
		console.log(e.responseText);
	}
	});
	$("#resourceModal").dialog("close");
}

function deleteOk(exhibitNum){
	if(confirm("등록된 일정을 삭제 하시겠습니까?")){
		$.post("<%=cp%>/admin/menu2/exhibitScheduler/schedulerDelete",{exhibitNum:exhibitNum},function(data){
			var state=data.state;
			if(state=="false"){
				alert("게시글을 삭제할 수 있는 권한이 없습니다.");
			}else {
				calendar.fullCalendar('removeEvents',exhibitNum);
			}
			
		},"json");
	}
	$("#resourceModal").dialog("close");
}

function updateDrag(calEvent) {
	var exhibitNum=calEvent.id;
	var hallNum=calEvent.resourceId;
	var exhibitStart=calEvent.start.format("YYYY-MM-DD");
	var exhibitStart="";
	if(calEvent.start.hasTime()) {
		admitStart=calEvent.start.format("HH:mm")+":00";
	}
	var exhibitEnd="";
	if(calEvent.end!=null) {
		exhibitEnd=calEvent.end.format("YYYY-MM-DD");
	} else {
		var end=moment(startDay);
    	end=end.add("1", "days");
    	exhibitEnd=end.format("YYYY-MM-DD");
	}
	var admitEnd="";
	if(calEvent.end!=null && calEvent.end.hasTime()) {
		admitEnd=calEvent.end.format("HH:mm")+":00";
	}
	
	var exhibitName=calEvent.title;
	var hallName=calEvent.resourceName;
	var locationNum=calEvent.groupNum;
	var kind=calEvent.groupName;
	var userId=calEvent.userId;
	var userName=calEvent.userName;
	var content=calEvent.content;
	
	var query="exhibitNum="+exhibitNum
        +"&locationNum="+locationNum
        +"&hallNum="+hallNum
        +"&exhibitName="+exhibitName
        +"&exhibitStart="+exhibitStart
        +"&admitStart="+admitStart
        +"&exhibitEnd="+exhibitEnd
        +"&admitEnd="+admitEnd
        +"&content="+content
	
	var url="<%=cp%>/admin/menu2/exhibitSchedule/schedulerUpdate";

	$.ajax({
      type:"POST"
      ,url:url
	  ,data:query
	  ,dataType:"json"
	  ,success:function(data) {
	      var state=data.state;
	      if(state=="false") {
	    	  alert("게시글을 수정할 수 있는 권한이 없습니다.");
	    	  calendar.fullCalendar('refetchEvents');
	      } else {
	    	  calendar.fullCalendar('refetchEvents');
	      }
      }
      ,error:function(e) {
          console.log(e.responseText);
       }
	});
}
</script>

<div class="body-container" style="width:1040 px;">
	<div class="body-title">
		<h3><span style="font-family:Webdings">2</span>전시 일정 등록</h3>
	</div>
	
	<div>
		<div id='schLoading'>loading</div>
		<div id='calendar'></div>
	</div>
</div>
<div id="resourceModal" style="display:none;"></div>