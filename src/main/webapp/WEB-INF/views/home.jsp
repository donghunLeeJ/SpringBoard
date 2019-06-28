<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js" ></script>
<body>
	
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first" style="overflow: hidden">
      <img src="image/ryan.png" id="icon" alt="User Icon" style="width: 100% " />
    </div>

    <!-- Login Form -->
    <form action="loginProc" method="post">
      <input type="text" name="id" id="login" class="fadeIn second" name="login" placeholder="login">
      <input type="text" name="pw" id="password" class="fadeIn third" name="login" placeholder="password">
      <input type="submit" class="fadeIn fourth" value="Log In">
       <input type="button" id="joinMem" class="fadeIn fourth" value="Join Member">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

  </div>
</div>
	<script>
		$("#joinMem").on("click",function(){
			location.href = "joinMemForm";
		})

	
	</script>
</body>
</html>