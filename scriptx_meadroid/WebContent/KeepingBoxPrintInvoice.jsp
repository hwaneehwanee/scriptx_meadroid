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

<script src="./js/jsBarcode.code128.min.js"></script>
<style>
	#code128A{
		width: 135px !important;
		height: 75px !important;
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
	
</style>
<script type="text/javascript">
	
	function fn_onload()
	{
		/** 바코드생성*********************************************************************/
		//도착지코드
		JsBarcode(
			"#code128A", 								//컴포넌트 id
			'<%=map.get("dlvClsfCd") %>', 				//바코드생성 문자
			{
				format: "CODE128A", 					//생성형식
				displayValue: false,					//문자출력여부
				width: 3,
				height: 100
			}	
		);
		
		//운송장번호
		JsBarcode(
			"#code128C_NV", 							//컴포넌트 id
			'<%=map.get("dlvrNumb") %>', 				//바코드생성 문자
			{
				format: "CODE128C", 					//생성형식
				displayValue: false,					//문자출력여부
				width: 3,
				height: 35
			}	
		);
		
		//운송장번호
		JsBarcode(
			"#code128C", 							//컴포넌트 id
			'<%=map.get("dlvrNumb") %>', 				//바코드생성 문자
			{
				format: "CODE128C", 					//생성형식
				width: 3,
				height: 100,
				fontOptions: "bold"
			}	
		);
		
		printPage();
	}
	
	
	function printPage() 
	{
	
		 //무료기능  
		 factory.printing.header = "z";   //머릿말
		 factory.printing.footer = "d";   //꼬릿말
		 factory.printing.portrait = false;  //false-가로, true-세로
		 factory.printing.topMargin = 3.0;  //상 여백 설정
		 factory.printing.leftMargin = 1.0;  //좌 여백 설정
		 factory.printing.rightMargin = 1.0;  //우 여백 설정
		 factory.printing.bottomMargin = 1.0;  //하 여백 설정
		 
		  //factory.printing.Print(true);   //인쇄, 다이얼로그 창 등장 true, false
	
		  //미리보기실행
		  factory.printing.Preview();
		 
		 
		  //웹브라우져 닫기
		  //window.open('about:blank', '_self').close();
		  
		  //유료기능  
		  //factory.printing.paperSize = "A4";      // 용지 사이즈
		  //factory.printing.paperSource = "Manual feed";   // 종이 Feed 방식
		  //factory.printing.copies = 1; // 인쇄할 매수
		  //factory.printing.SetPageRange(false, 1, 3); // True로 설정하고 1, 3이면 1페이지에서 3페이지까지 출력
		  // factory.printing.printBackground = false; // 백그라운드까지 출력  
		  //factory.printing.SetMarginMeasure(2); // 테두리 여백 사이즈 단위를 인치로 설정합니다.
		  //factory.printing.printer = "SINDORICOH LP-1800";  // 프린트 할 프린터 이름 -->신도리코

	}
	

</script>
</head>
<body onload="fn_onload();" style="font-family: arial;">
	<object id=factory style="display:none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="http://www.meadroid.com/scriptx/ScriptX.cab#Version=6,1,429,14">
	</object>
	<div style="margin-left: 30px; font-weight: bold;">
		<!-- 운송장번호 -->
		<span style="font-size: 19px; margin-right: 15px; word-spacing: -3px;"><%=map.get("dlvrNumb").substring(0, 4) %> - <%=map.get("dlvrNumb").substring(4, 8) %> - <%=map.get("dlvrNumb").substring(8) %></span>
		<!-- 출력일자 -->
		<span style="font-size: 12px; margin-right: 35px;"><%=map.get("prtYmd") %></span>
		<!-- 페이지카운트 -->
		<span style="font-size: 10px;"><%=map.get("pageCnt") %></span>
	</div>
	
	<table style="margin-top: -10px; margin-left: -15px; font-weight: bold;">
		<tr>
			<td>
				<!-- 도착지코드 바코드(CODE128A) -->
				<svg id="code128A"></svg>
			</td>
			<td style="padding-top: 21px;">
				<span style="font-size: 46px; border-bottom: 1px solid;">
				<%=map.get("dlvClsfCd").substring(0, 1) %>
				</span>
			</td>
			<td>
				<span style="font-size: 75px;"><%=map.get("dlvClsfCd").substring(1, 4) %></span>
			</td>
			<td style="padding-top: 9px;">
				<span style="font-size: 46px;">-</span>
			</td>
			<td style="padding-top: 21px;">
				<span style="font-size: 46px;"><%=map.get("dlvSubClsfCd") %></span>
			</td>
		</tr>
	</table>
				
	<table style="margin-top: -13px; font-weight: bold;">
		<tr>
			<td style="padding-right: 30px; font-size: 15px;"> 
				<!-- 수화인 명 -->
				<span><%=map.get("rcvrNm") %></span>
			</td>
			<td style="padding-right: 120px;  font-size: 15px;">
				<!-- 수화인 연락처-->
				<span><%=map.get("rcvrCell") %></span>
			</td>
			<td>
				<!-- 운송장번호 바코드(CODE128C) -->
				<svg id="code128C_NV"></svg>
			</td>
		</tr>
	</table>	
				
	<table style="margin-top: -18px; font-weight: bold;">
		<tr>
			<td>
				<!-- 수하인 주소 -->
				<span style="font-size: 15px;"><%=map.get("rcvrNewAddr") %> <%=map.get("rcvrNewAddrDtl") %></span>
			</td>
		</tr>
	</table>	
				
	<table style="margin-top: 10px; font-size: 32px; font-weight: bold;">
		<tr>
			<td>
				<span><%=map.get("rcvrShortAddr") %></span>
			</td>
		</tr>
	</table>	
	
				
	<table style="margin-top: -10px; font-weight: bold;">
		<tr>
			<td style="padding-right: 40px; font-size: 11px;">
				<span><%=map.get("sndprNm") %></span>
			</td>
			<td style="padding-right: 20px; font-size: 11px;">
				<span><%=map.get("sndprCell") %></span>
			</td>
			<td style="padding-right: 60px;">
				<span><%=map.get("param1") %></span>
			</td>
			<td style="padding-right: 25px;">
				<span><%=map.get("param2") %></span>
			</td>
			<td>
				<span><%=map.get("param3") %></span>
			</td>
		</tr>
	</table>		
				
	<table style="margin-top: -10px; font-size: 11px; font-weight: bold;">
		<tr>
			<td>
				<!-- 수하인 주소 -->
				<span style="font-size: 11px;"><%=map.get("sndprNewAddr") %> <%=map.get("sndprNewAddrDtl") %></span>
			</td>
		</tr>
	</table>		
				
	<table style="margin-top: -5px; margin-bottom: 100px; font-size: 11px; font-weight: bold;">
		<tr>
			<td>
				<span style="font-size: 11px;"><%=map.get("param4") %> </span>
			</td>
		</tr>
	</table>		
	
	<table style="margin-top: -10px; font-size: 11px; font-weight: bold;">
		<tr>
			<td colspan="3">
				<!-- 수하인 주소 -->
				<span style="font-size: 11px;"><%=map.get("rcvrShortAddr") %></span>
			</td>
			<td rowspan="2" style="padding-bottom: 10px; padding-left: 20px;">
				<svg id="code128C"></svg>
			</td>
		</tr>
		<tr>
			<td style="padding-right: 45px;">
				<!-- 수하인 주소 -->
				<span style="font-size: 18px;"><%=map.get("dlvPreArrBranNm") %>-<%=map.get("dlvPreArrEmpNm") %>-<%=map.get("dlvPreArrEmpNickNm") %></span>
			</td>
			<td style="padding-right: 25px;">
				<span><%=map.get("param2") %></span>
			</td>
			<td>
				<span><%=map.get("param3") %></span>
			</td>
		</tr>
	</table>
				

	<br><br>
	
	<!-- 다음페이지 출력 -->
	<p style="page-break-before:always;">
	</p>
	
	<div></div>
	<div><%=request.getAttribute("prtDate") %></div>
	<div><%=request.getAttribute("dlvClsfCd") %></div>
	<div><%=map.get("dlvClsfCd")+"zzzz|||"+ map.get("test")%></div>
</body>
</html>