<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지</title>

	<script src="../js/httpRequest.js"></script>
<script>
    function fncCng()
    {
        var obj = document.getElementsByName( "mytxt" );
        alert( "변경전 이름 : " + obj[0].name );
       
        obj[0].name = "HDKim";
        alert( "변경후 이름 : " + obj[0].name );
       
        obj[0].value = "변경된 이름은 HDKim 입니다.";
       
        // 이름이 변경되어도 접근은 이전이름으로 접근함을 유념.
        var objj = document.getElementsByName( "mytxt" );
        alert( objj[0].name );
    }
   
    function fncCngTr()
    {
        var obj_ = document.getElementById( "rowspan02" );
        alert( "현재 row span count : " + obj_.rowSpan );
        obj_.rowSpan = 1;
        alert( "1로 변경후 row span count : " + obj_.rowSpan );   
       
        var obj = document.getElementById( "row02" );
        obj.style.display = "none";
    }

</script>
</head>
<body>

<input type="text" name="mytxt" value="현재 이름은 mytxt입니다." size="40"></input>
<br><br>

<br><br>

<table width="40%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td id="rowspan02" rowspan="2" align="center"> row span 2 </td>
    <td height="15" align="center"> row 01 </td>
  </tr>
  <tr id="row02">
    <td height="15" align="center"> row 02 </td>
  </tr>
</table>   

<br><br>

<input type="button" value="Name Test" onclick="fncCng()">
&nbsp;
<input type="button" value="TR Test" onclick="fncCngTr()">
</body>
</html>