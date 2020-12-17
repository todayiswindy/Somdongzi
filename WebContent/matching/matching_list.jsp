<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입양 신청 목록</title>
	
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script>
		function del(f) {
			if(confirm("해당 신청내역을 삭제하시겠습니까?")==false){
				return;
			}
			var mat_id = f.mat_id.value.trim();
			var mem_id = f.mem_id.value.trim();
			
			//ajax를 통해 삭제 처리
			var url = "/matching/delete";
			var param = "mat_id="+mat_id+"&mem_id="+mem_id;
			
			sendRequest(url,param,delResultFn,"POST");
		}
		
		function delResultFn() {
			if( xhr.readyState == 4 && xhr.status == 200 ){
				var data = xhr.responseText;
				var json = eval( data );
				
				if( json[0].result == '0' ){
					alert("삭제 실패" );
				}
				else{
					alert("삭제 성공");
				}
				location.href="/adminonly";
			}
		}
		
		function update(f) {
			if(confirm("회원정보를 수정하시겠습니까?")==false){
				return;
			}
			
			var updateCode = f.updateCode.value.trim();
			var mem_id = f.mem_id.value.trim();
			var mem_membership = f.mem_membership.value.trim();
			
			var url = "/member/update";
			var param = "updateCode=" + updateCode + "&mem_id=" + mem_id + "&mem_membership=" + mem_membership;
			
			sendRequest(url,param,updateResultFn,"POST");
		}
		
		function updateResultFn() {
			if( xhr.readyState == 4 && xhr.status == 200 ){
				var data = xhr.responseText;
				var json = eval( data );
				
				if( json[0].result == '0' ){
					alert("회원정보 업데이트 실패" );
				}
				else{
					alert("회원정보 업데이트 성공");
				}
				
				location.href="/adminonly";
			}
		}
	</script>
	<style>
		table{
			width: 100%;
		}
		table.type09 {
			border-collapse: collapse;
			text-align: left;
			line-height: 1.5;
		}
		table.type09 thead th {
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			color: #369;
			border-bottom: 3px solid #036;
		}
		table.type09 tbody th {
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
			background: #f3f6f7;
		}
		table.type09 td {
			padding: 10px;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
		}
	</style>
</head>
	
<body>
	<div id="l-margin">
		<br><p id="test-toptext-p" class="text-center"></p>
		<table class="type09">
			<thead>
				<tr>
					<th scope="cols">아이디</th>
					<th scope="cols">유기번호</th>
					<th scope="cols">보호소명</th>
					<th scope="cols">신청날짜</th>
					<th scope="cols">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${ list }">
					<tr>
						<td>${ vo.mem_id }</td>
						<td>${ vo.mat_id }</td>
						<td>${ vo.mat_careName }</td>
						<td>${ vo.mat_date }</td>
						<td>
							<form>
								<input type="hidden" name="mat_id" value="${vo.mat_id }">
								<input type="hidden" name="mem_id" value="${vo.mem_id }">
								<input type="hidden" name="updateCode" value="manager">
								<input type="button" value="승인" onclick="update(this.form);">
								<input type="button" value="삭제" onclick="del(this.form);">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>