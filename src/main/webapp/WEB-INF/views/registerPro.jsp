<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<ul class="nav justify-content-center">
		<li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
		<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
		<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
		<li class="nav-item"><a class="nav-link disabled" href="#"
			tabindex="-1" aria-disabled="true">Disabled</a></li>
	</ul>
	<div class="container">
		<div class="row">
			<div class="col">
				<form action="shopRegister" method="post" enctype="multipart/form-data">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">상품 소개</th>
								<th scope="col"><input name="title" type="text" 
									class="form-control"> <input name="writer" type="hidden"
									 value="${mem.lastName }"></th>
							</tr>
						</thead>
						<tbody>
							<tr style="overflow: hidden;">
								<th scope="col">상품 정보</th>
								<th scope="col"><textarea name="contents"
										style="height: 100%; width: 100%;" class="form-control"></textarea></th>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<th scope="col">파일 첨부</th>
								<th scope="col">
									<div class="custom-file">
										<input name="boardFile" type="file" class="custom-file-input"
											id="customFile"> <label class="custom-file-label"
											for="customFile">Choose file</label>
									</div>
								</th>
							</tr>
							<tr>
								<th scope="col">이미지 미리보기</th>
								<td><img id="image_section" src="#" alt="your image"
									style="width: 150px" /></td>
							</tr>
						</tbody>
					</table>
					<button type="submit" class="btn btn-info">제출</button>
				</form>
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
		$("#customFile").change(function() {
			readURL(this);
		});
	</script>
</body>
</html>