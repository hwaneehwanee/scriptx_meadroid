<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>

<%
 HashMap<String, String> map = (HashMap<String, String>)request.getAttribute("INVOICE_INFO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인쇄 테스트</title>
<script src="./js/jquery.min.js"></script>
<script src="./js/jsBarcode.code128.min.js"></script>
<style>
	
	#code128A_NV{
		width: 135px !important;
		height: 85px !important;
		float: left;
	}
	
	#code128C_NV{
		width: 160px !important;
		height: 35px !important;
	}
	
	#code128C{
		width: 145px !important;
		height: 75px !important;
	}
	
	/* 바코드 흰색배경 제거 */
	svg > rect {
		display: none;
	}
	
	
	/* 도착지코드 첫자리 밑줄 */
    .first_dlvClsfCd:after{
    	content: "";
        display: block;
        border-bottom: 1px solid;
        margin-top: -8px;
    } 
    
    
    /* 프린터시 처리 스타일 */
    @media print{
    	
    	.no-print{
    		display: none !important;
    	}
    
    }
    
	
</style>
<script type="text/javascript">
	
	function fn_onload()
	{
		//바코드생성
		fn_createBarcode();
		
		
		//상품정보 overflow 체크.
		if ($('#div_inner').height() >  $('#div_container').height()) {
		    //console.log("OVERFLOW!!");
		    
		    var containerHeight = $('#div_container').height();
		    var innerHeight = $('#div_inner').height();
		    
		    //상품정보
		    var strText = $('#div_inner').text();
		    
		    //총페이지수
		    var totalPageCnt = Math.ceil(innerHeight/containerHeight);
		    //한화면당 출력 텍스트 길이
		    var eachPageTextLength = (strText.length/totalPageCnt);
		    
		    
		    for(var i=0; i<totalPageCnt; i++){
		    	
		    	var strTestRst = "";
		    	
		    	if( i == 0 ){
		    		strTestRst = strText.substring( 0, (eachPageTextLength)*(i+1));
		    		
		    		//page1에 상품정보 적용
				    $('#page1 #div_inner').html(strTestRst);
		    		
		    		//페이지 카운트
		    		$('#page1 #page_cnt').html( (i+1)+"/ "+totalPageCnt );
		    	}
		    	//마지막내용인경우 인덱스이하 모두출력
		    	else if( (i-1) == totalPageCnt){
		    		strTestRst = strText.substring( (eachPageTextLength)*i );
		    	}
		    	else{
		    		strTestRst = strText.substring( (eachPageTextLength)*i, (eachPageTextLength)*(i+1));
		    	}
		    	
		    	//2page이상인 경우만 아래 스크립트 실행
		    	if(i<1) continue; 
		    	
		    	var strHtml = '';
		    	/* strHtml += '<p id="next_page_style_tag"'+i+' style="page-break-before:always;">';			//다음페이지출력 스타일태그.
		    	strHtml += '</p>'; */
		    	strHtml += '<div id="page'+(i+1)+'">';
		    	strHtml += '</div>';
		    	
		    	$('#div_more').append(strHtml);
		    	
		    	//page1의 테이블 복사
		    	$('#page1 #page_content').clone().appendTo('#page'+(i+1));
		    	
		    	//상품정보 적용
		    	$('#page'+(i+1)+' #div_inner').html(strTestRst);
		    	
		    	//페이지 카운트
	    		$('#page'+(i+1)+' #page_cnt').html( (i+1)+"/ "+totalPageCnt );
		    }
		    
		}
		
		
		//출력
		printPage();
	}
	
	
	/**
	 * JSBarcode를 이용한 바코드생성
	 */
	function fn_createBarcode()
	{
		//도착지코드
		JsBarcode(
			"#code128A_NV", 														//컴포넌트 id
			'<% if( map != null){ %><%=map.get("dlvClsfCd") %><%}%>', 				//바코드생성 문자
			{
				format: "CODE128A", 												//생성형식
				displayValue: false,												//문자출력여부
				width: 3,
				height: 115
			}	
		);
		
		//운송장번호
		JsBarcode(
			"#code128C_NV", 														//컴포넌트 id
			'<% if( map != null){ %><%=map.get("dlvrNumb") %><%}%>', 				//바코드생성 문자
			{
				format: "CODE128C", 												//생성형식
				displayValue: false,												//문자출력여부
				width: 3,
				height: 45
			}	
		);
		
		//운송장번호
		JsBarcode(
			"#code128C", 							//컴포넌트 id
			'<% if( map != null){ %><%=map.get("dlvrNumb") %><%}%>', 				//바코드생성 문자
			{
				format: "CODE128C", 					//생성형식
				width: 3,
				height: 75,
				fontOptions: "bold",
				fontSize: 20
			}	
		);
	}
	
	
	/**
	 * 출력하기
	 */
	function printPage() 
	{
	
		 //무료기능  
		 factory.printing.header = "";   //머릿말
		 factory.printing.footer = "";   //꼬릿말
		 factory.printing.portrait = false;  //false-가로, true-세로
		 factory.printing.topMargin = 2.5;  //상 여백 설정
		 factory.printing.leftMargin = 4.0;  //좌 여백 설정
		 factory.printing.rightMargin = 29.0;  //우 여백 설정
		 factory.printing.bottomMargin = 0.0;  //하 여백 설정
		 
		 
		 //factory.printing.Print(false);   //인쇄, 다이얼로그 창 등장 true, false
	
		 //미리보기실행
		 factory.printing.Preview();
		 
		 //웹브라우져 닫기
		 window.open('about:blank', '_self').close();
		  

	}
	
	
	/**
	 * Active X 설치 페이지
	 */
	function fn_installActiveX()
	{
		window.open('http://scriptx.meadroid.com/download/install-scriptx.aspx');
	}
	
	
</script>
</head>
<body onload="fn_onload();" style="font-family: arial; margin-top: 0px;">
	<!-- <div class="no-print">
		<a href="#" onclick="fn_installActiveX()">ACTIVE X설치가 안되는 경우 클릭</a>
		<br><br><br>
	</div>
	 -->
	
	<object id="factory" style="display:none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="http://localhost:8080/_plugin/smsx.cab#Version=6,1,429,14">
	</object>
	
	<div id="page1">
		<div id="page_content"> 
			<div style=" margin-left: 30px; font-weight: bold;">
				<!-- 운송장번호 -->
				<span style="font-size: 19px; margin-right: 15px; word-spacing: -3px;">
					<% if( map != null){ %><%=map.get("dlvrNumb").substring(0, 4) %> - <%=map.get("dlvrNumb").substring(4, 8) %> - <%=map.get("dlvrNumb").substring(8) %><%}%>
				</span>
				<!-- 출력일자 -->
				<span style="font-size: 12px; margin-right: 35px;">
					<% if( map != null){ %><%=map.get("prtYmd") %><%}%>
				</span>
				<!-- 페이지카운트 -->
				<span id="page_cnt" style="font-size: 10px;">
					1/ 1
				</span>
			</div>
			
			<table style="margin-top: -10px; margin-left: -15px; font-weight: bold;">
				<tr>
					<td>
						<!-- 도착지코드 바코드(CODE128A) -->
						<svg id="code128A_NV"></svg>
					</td>
					<td style="padding-top: 17px;">
						<!-- 도착지코드 첫자리 -->
						<span class="first_dlvClsfCd" style="font-size: 46px; padding-bottom: 3px; ">
							<% if( map != null){ %><%=map.get("dlvClsfCd").substring(0, 1) %><%}%>
						</span>
					</td>
					<td>
						<!-- 도착지코드 나머지 -->
						<span style="font-size: 75px;">
							<% if( map != null){ %><%=map.get("dlvClsfCd").substring(1, 4) %><%}%>
						</span>
					</td>
					<td style="padding-top: 9px;">
						<span style="font-size: 46px;">-</span>
					</td>
					<td style="padding-top: 21px;">
						<!-- 도착지서브코드 -->
						<span style="font-size: 46px;">
							<% if( map != null){ %><%=map.get("dlvSubClsfCd") %><%}%>
						</span>
					</td>
				</tr>
			</table>
						
			<table style="margin-top: -25px; margin-left: 5px; font-weight: bold;">
				<tr>
					<td style="padding-right: 30px; font-size: 14px; width:50px;"> 
						<!-- 받는분 명 -->
						<span>
							<% if( map != null){ %><%=map.get("rcvrNm") %><%}%>
						</span>
					</td>
					<td style="padding-right: 88px;  font-size: 14px; width: 88px">
						<!-- 받는분 연락처-->
						<span>
							<% if( map != null){ %><%=map.get("rcvrCell") %><%}%>
						</span>
					</td>
					<td>
						<!-- 운송장번호 바코드(CODE128C) -->
						<svg id="code128C_NV"></svg>
					</td>
				</tr>
			</table>	
						
			<table style="margin-top: -18px; margin-left: 5px; font-weight: bold; width: 442px; height: 46px; line-height: 13px;">
				<tr>
					<td style="vertical-align: top; text-align: left;">
						<!-- 받는분 주소 -->
						<span style="font-size: 13px;">
							<% if( map != null){ %><%=map.get("rcvrNewAddr") %> <%=map.get("rcvrNewAddrDtl") %><%}%>
						</span>
					</td>
				</tr>
			</table>	
						
			<table style="margin-top: -22px; margin-left: 5px; font-size: 32px; font-weight: bold;">
				<tr>
					<td>
						<!-- 받는분 주소약칭 -->
						<span>
							<% if( map != null){ %><%=map.get("rcvrShortAddr") %><%}%>
						</span>
					</td>
				</tr>
			</table>	
			
						
			<table style=" margin-left: 5px; font-weight: bold;">
				<tr>
					<td style="padding-right: 40px; font-size: 11px;">
						<!-- 보내는분 명 -->
						<span>
							<% if( map != null){ %><%=map.get("sndprNm") %><%}%>
						</span>
					</td>
					<td style="padding-right: 45px; font-size: 11px;">
						<!-- 보내는분 전화-->
						<span>
							<% if( map != null){ %><%=map.get("sndprCell") %><%}%>
						</span>
					</td>
					<td style="padding-right: 80px; font-size: 11px;">
						<!-- 수량 -->
						<span>
							<% if( map != null){ %><%=map.get("param1") %><%}%>
						</span>
					</td>
					<td style="padding-right: 40px; font-size: 11px;">
						<!-- 운임 -->
						<span>
							<% if( map != null){ %><%=map.get("param2") %><%}%>
						</span>
					</td>
					<td style="font-size: 11px;">
						<!-- 정산 -->
						<span>
							<% if( map != null){ %><%=map.get("param3") %><%}%>
						</span>
					</td>
				</tr>
			</table>		
						
			<table style="margin-top: -8px; margin-left: 3px; font-size: 11px; font-weight: bold;">
				<tr>
					<td>
						<!-- 보내는분 주소 -->
						<span style="font-size: 11px;">
							<% if( map != null){ %><%=map.get("sndprNewAddr") %> <%=map.get("sndprNewAddrDtl") %><%}%>
						</span>
					</td>
				</tr>
			</table>	
				
			<table style="margin-left: -10px; font-size: 11px; font-weight: bold; width: 446px; height: 100px;">
				<tr>
					<td style="height: 100%; vertical-align: top; text-align: left;">
						<!-- 상품정보 -->
						<div id="div_container" style="height: 100px; line-height: 15px; overflow:hidden;">
							<span style="font-size: 11px;" id="div_inner">
								<% if( map != null){ %><%=map.get("param4") %> <%}%>
							</span>
						</div>
					</td>
				</tr>
			</table>
			<!-- 
			<div style="margin-top: -10px; width: 446px; text-align: right; margin-left: -85px;">
				
				<span style="font-size: 11px; font-weight: bold;"> 
					<% if( map != null){ %><%=map.get("param5") %><%}%>
				</span>
			</div>
			 -->
			<table style="margin-top: -8px; margin-left: -14px; font-size: 11px; font-weight: bold; table-layout: fixed;">
				<tr>
					<td colspan="3" style="padding-top: 8px;" valign="bottom">
						<!-- 받는분 주소약칭 -->
						<span style="font-size: 11px;">
							<% if( map != null){ %><%=map.get("rcvrShortAddr") %><%}%>
						</span>
					</td>
					<td rowspan="2" style="padding-left: 20px;" valign="bottom">
						<!-- 운송장번호 바코드 -->
						<svg id="code128C"></svg>
					</td>
				</tr>
				<tr>
					<td style=" width: 155px; overflow: hidden; font-size: 16px; white-space: nowrap;">
						<div style="width: 155px; ">
						<!-- 배송집배점명 + 배송SM명 + 분류코드명 -->
						<% if( map != null){ %><%=map.get("dlvPreArrBranNm") %>-<%=map.get("dlvPreArrEmpNm") %>-<%=map.get("dlvPreArrEmpNickNm") %><%}%>
						</div>
					</td>
					<td style="padding-left: 50px; padding-right: 30px; ">
						<!-- 운임 -->
						<span>
							<% if( map != null){ %><%=map.get("param2") %><%}%>
						</span>
					</td>
					<td style="">
						<!-- 정산 -->
						<span >
							<% if( map != null){ %><%=map.get("param3") %><%}%>
						</span>
					</td>
				</tr>
			</table>
		
		</div>
	</div>
	
	<div id="div_more"></div>
	
	
</body>
</html>