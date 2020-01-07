<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인쇄 테스트</title>

<script src="./js/jsBarcode.code128.min.js"></script>

<script type="text/javascript">
	
	function fn_onload()
	{
		JsBarcode("#code128A", "1D40", {format: "CODE128A"});
		JsBarcode("#code128B", "Hi!", {format: "CODE128B", displayValue: false});
		JsBarcode("#code128C", "608393980711", {format: "CODE128C"});
		printPage();
	}
	
	
	function printPage()
	{
	
		 //무료기능  
		 factory.printing.header = "";   //머릿말
		 factory.printing.footer = "";   //꼬릿말
		 factory.printing.portrait = false;  //false-가로, true-세로
		 factory.printing.topMargin = 3.0;  //상 여백 설정
		 factory.printing.leftMargin = 1.0;  //좌 여백 설정
		 factory.printing.rightMargin = 1.0;  //우 여백 설정
		 factory.printing.bottomMargin = 1.0;  //하 여백 설정
		 //미리보기실행
		 //factory.printing.Preview();
		 //factory.printing.Print(true);   //인쇄, 다이얼로그 창 등장 true, false
	
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
<body onload="fn_onload();">
	<object id=factory style="display:none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="http://www.meadroid.com/scriptx/ScriptX.cab#Version=6,1,429,14">
	</object>
	
	<svg id="code128A"></svg>1
	<svg id="code128B"></svg>2
	<svg id="code128C"></svg>3

	<%=request.getAttribute("param1") %>

</body>
</html>