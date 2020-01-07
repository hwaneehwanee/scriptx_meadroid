<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="StyleSheet" href="./css/code128.css" type="text/css" />
<script src="./js/code128.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function print(){
		//location.href="print.jsp";
		//location.href="KeepingBoxPrintInvoice_t.jsp";
		var win = window.open("print.jsp", '_blank');
        //win.close();
	}
	
	function encode()
	{
	  var strValue = document.getElementById("barcode_input").value;
	  var strBarcodeHTML = code128(strValue);
	  document.getElementById("barcode").innerHTML = strBarcodeHTML;
	}
</script>
</head>
<body>
	<input type="button" value="출력" onclick="print()">
	<input style="margin-left:45px" type="text" id="barcode_input"></input>
	<input type="button" value="Encode" onclick="encode()"/>
	<div class="barcode128v" id="barcode"></div>
</body>
</html>