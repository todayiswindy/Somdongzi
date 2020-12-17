<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고양이 매칭</title>
	
</head>

<body>
	<jsp:include page="/main/index.jsp"/>
	
	<div class="container">
		<div id="l-margin">
			<br><p id="test-toptext-p" class="text-center"> 고양이 매칭 </p>
			<form name="f" method="get" action="/matching/dog" enctype="multipart/form-data">
				1. 크기<br>
				<input type='radio' name='size' value='s'/>중,소형견
				<input type='radio' name='size' value='l'/>대형견<br>
				2. 색상<br>
				<input type='radio' name='color' value='노'/>노란색
				<input type='radio' name='color' value='갈'/>갈색
				<input type='radio' name='color' value='검'/>검정색
				<input type='radio' name='color' value='회'/>회색
				<input type='radio' name='color' value='흰'/>흰색<br>
				3. 성별<br>
				<input type='radio' name='sex' value='F'/>암컷
				<input type='radio' name='sex' value='M'/>수컷<br>
				4. 중성화여부<br>
				<input type='radio' name='neuter' value='Y'/>예
				<input type='radio' name='neuter' value='N'/>아니오<br>
				
				<input type="button" value="매칭 결과 보기" onclick="checkdata(this.form)">
			</form>
		</div>
	</div>
</body>
</html>