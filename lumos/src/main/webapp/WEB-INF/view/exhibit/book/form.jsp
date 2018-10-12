<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitBookForm.css" type="text/css">
<script type="text/javascript">
$(function(){ //���ڸ� �Է���� ��. 
	$(document).on("keyup", "input.form01", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/gi,"")); 
	}); 
	
	$(document).on("blur", "input.form01", function() { 
		var sum=0;
		$("input.form01").each(function () {
			sum+=$(this).val()*1;
		});
		$("#total").html(sum);
	}); 

	$("input").keypress(function(evt) {
			var fields = $("input:text");
			var index = fields.index(this);

			if (evt.keyCode == 13) {
				if (index > -1 && index < 5) {
					fields.eq(index + 1).focus();
				} else {
				}
				return false;
			}
		});
	});
	
	function asd() {
		if($("#total").html()!=0){
			$("#step1").css("display","none");
		}
		
		var sl="";
		var out="";
		$("input.form01").each(function () {
			if($(this).val()!=0&&$(this).val()!=""){
				sl+=$(this).attr("data-name");
				sl+=" "+$(this).val()+"��,"
			}
		});
		
		if(sl.length!=0){
			sl=sl.substring(0,sl.length-1);
			out+="<tr>";
			out+="<td class='selectList' colspan='4'>"+sl+" �����ϼ̽��ϴ�.</td>";
			out+="</tr>";			
			$("#second table").html(out);
		}
		
		out="";
		$("input.form01").each(function () {
			var total = $("#total").html()*1;
			var count = $(this);
			var price = $(this).attr("data-price");
			var level = $(this).attr("data-al");
			if($(this).val()!=0&&$(this).val()!=""){
				out+="					<tr>";
				out+="						<th width='70' class='head bb' rowspan='2'>"+$(this).attr("data-name")+"</th>";
				out+="						<td width='100'>�⺻��</td>";
				out+="						<td width='50' class='mn'>"+Number(price).toLocaleString('en')+"��</td>";
				out+="						<td width='50' class='box'>";
				out+="							<select id='"+level+"normalP' name='normalP' onchange='selP();'>";
					for(var i=0;i<=count.val();i++){
				out+="									<option value='"+i+"'>"+i+"��</option>";
					}
				out+="							</select>";
				out+="						</td>";
				out+="					</tr>";
				out+="					<tr class='bb'>";
				out+="						<td>����������/����� ���ΰ� (���� 50% ����)</td>";
				out+="						<td class='mn'>"+Number(price/2).toLocaleString('en')+"��</td>";
				out+="						<td class='box'>";
				out+="							<select id='"+level+"halfP' name='halfP' onchange='selP();'>";
				for(var i=0;i<=count.val();i++){
					out+="							<option value='"+i+"'>"+i+"��</option>";
				}
				out+="							</select>";
				out+="						</td>";
				out+="					</tr>";
			}
		});
		$("#second table").append(out);
	}
	
	function selP() {
		alert($(this).parent().parent().find("td select").eq(0).val());
		alert($(this).parent().parent().find("td select").eq(1).val());
	}
</script>

<div>
	<div class="wrap">
		<div class="titleDiv">
			<h1 class="title" style="margin-top: 60px;">
				<img src="<%=cp %>/resource/images/lumos/reviews_gray.png"> ����
				����
			</h1>
			<div class="poster left">
				<c:if test="${not empty dto.exProfileImage}">
					<img class="list_image_crop" src="<%=cp %>/uploads/image/${dto.exProfileImage}">
				</c:if>
				<c:if test="${empty dto.exProfileImage}">
					<img class="list_image_crop" src="<%=cp%>/resource/images/lumos/noposter.png">
				</c:if>
			</div>
			<div class="exInfo">
				<div class="content right">
					<h2>${dto.exhibitName}</h2>
					<table class="detail_inform">
						<tbody>
							<tr>
								<th>�Ⱓ</th>
								<td>${dto.exhibitStart}~${dto.exhibitEnd}</td>
							</tr>
							<tr>
								<th>�ð�</th>
								<td>${dto.admitStart}~${dto.admitEnd}</td>
							</tr>
							<tr>
								<th>���</th>
								<td>${dto.hallName}&nbsp;${dto.exHallLocate}</td>
							</tr>
							<tr>
								<th>�������</th>
								<td>${dto.ratingName}</td>
							</tr>
							<tr>
								<th>�帣</th>
								<td>${dto.genre}</td>
							</tr>
							<tr>
								<th>����</th>
								<td>${dto.exPriceString}</td>
							</tr>
							<tr>
								<th>����</th>
								<td>${dto.host}</td>
							</tr>
							<c:if test="${dto.host!='lac' && not empty dto.supervise}">
								<tr>
									<th>�ְ�</th>
									<td>${dto.supervise}</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			
			<div style="clear: both;height: 30px;display: block;"></div>
			<div id="step1">
				<h2 class="linet" style="font-weight: 300;">�ż� ����</h2>
				<table class="audt" style="width:100%;margin: 10px 0;">
					<tr>
						<c:forEach items="${audienceList}" var="al" varStatus="als">
							<th width="100">${al.audience}</th>
							<td>
								<input type="text" class="form01" style="width: 70px;" data-al="${al.audienceLevelNum}" data-name="${al.audience}" data-price="${al.exPrice}" 
								name="audience${al.audienceLevelNum}" id="audience-${al.audienceLevelNum}" value="" placeholder="0">
							��
							</td>
							
						<c:if test="${als.isLast()}">
							</tr>
							<tr>
								<td colspan="${als.count*2}" style="text-align: right; padding-right: 10px;">
									�� <span id="total">0</span>�� ����
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				
				<div style="clear: both;height: 30px;display: block;"></div>
				<button onclick="asd();">��������</button>
				

			</div>
			<div id="second">
				<h2 class="linet" style="font-weight: 300;">���� ����</h2>
				<table style="width: 100%;" class="pricetable">
				</table>
			</div>
			
			<div style="clear: both;height: 30px;display: block;"></div>
			
			<div class="war" style="clear: both;">
				<h2 style="font-weight: 300;">���ǻ���</h2>
				- ������ �ʿ��� ���� (�����, ���������� ��)�� ���� ���, �ش��� ������ ���� ���� �ڷḦ �����ؾ� �ϸ� �������� ���ι��� ��ŭ ������ �����ؾ� �մϴ�.<br>
- ���� ������ ���� ���� ��� �� �翹���ϴ� �����̹Ƿ� ȯ�Ұ� ������ �����ᰡ �ΰ��˴ϴ�. (������ �翹�� ������ ����Ǵ� �������θ� ���� �����մϴ�.)<br>
- ��Ҽ������ ��� ���� ���ڴ� ��ǰ���� �ٸ���, ������ �ϴ� My���������� Ȯ�����ֽñ� �ٶ��ϴ�.<br>
- �¿��� �̿� �� ���� �ֺ��� ����ü���� ������ ȥ������ ���������� ����� �� �ֽ��ϴ�. ������ ���߱����� �̿����ֽñ� �ٶ��ϴ�. ������ ȥ�� �� ���� �Ұ��� ���� ��������, Ƽ��ȯ�� �Ұ��մϴ�.<br>
			</div>
			
			<div style="clear: both;height: 50px;display: block;"></div>
		</div>
	</div>
</div>
