<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<style>
tr, td {
	border: 1px solid;
	overflow: hidden;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<table>
					<thead>
						<tr>
							<td colspan="2">마이페이지</td>
					<tbody>
						<tr>
							<td>프로필 사진</td>

							<td style="width: 150px"><img id="image_section"
								src="${mem.filePath }" alt="your image" style="width: 100%" /></td>
						<tr>
							<td>프로필 사진 변경하기</td>
							<td><form method="post" action="changeImage"
									enctype="multipart/form-data">
									<input type="file" name="image" id="imgInput"> <input
										type="hidden" value="${mem.lastName }" name="id"></td>
						<tr>
							<td>퍼스트 네임</td>
							<td>${mem.firstName }</td>
						<tr>
							<td>라스트 네임</td>
							<td>${mem.lastName }</td>
						<tr>
							<td>이메일</td>
							<td>${mem.email }</td>
				</table>
				<input type="submit">
				</form>
				<input type="button" id="goBoard" value="게시판으로"> <input
					type="button" id="logout" value="로그아웃">
				<input	type="button" id="shopBoard" value="상품 게시판">
				<input	type="button" id="cheatGo" value="관리자와 채팅">

			</div>
		</div>
	</div>



	<script type="text/javascript">
		function readURL(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#imgInput").change(function() {
			readURL(this);
		});
		$("#goBoard").on("click", function() {
			location.href = "goBoard";
		})
		$("#logout").on("click", function() {
			location.href = "logout";
		})
		$("#shopBoard").on("click", function() {
			location.href = "shop?page=1";
		})
		$("#cheatGo").on("click", function() {
			location.href = "cheatGo";
		})
	</script>
</body>
</html>