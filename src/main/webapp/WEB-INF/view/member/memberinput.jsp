<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<!-- Bootstrap CSS -->

<style>

.lo{

background:black;
color:white;
padding:10px 40px 10px 40px;
}
.input-form {
    
	max-width: 800px;
	margin: 80px auto; /* 상하 여백은 auto로 설정하여 중앙 정렬 */
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	text-align: center;
	color:black;
}
#id,
#pass {
    width: 70%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto text-center"> <!-- text-center 추가 -->
				<h2 class="mb-3" style="text-align:center">Sign up</h2><p>
			<form class="validation-form" novalidate action="memberPro" method="post" name="f">
					<div class="row">
					  
                  <div class="col-md-9 mb-3">
                  <div class="row">
                  <div class="col-md-6 mb-3">
                     <label for="id">아이디</label> <input type="text"
                        class="form-control" id="id" placeholder="아이디" value="" required  name="id">
                     <div class="invalid-feedback">아이디을 입력해주세요.</div>
                  </div>
                   <div class="col-md-6 mb-3">
                     <label for="address">주소</label> <input type="text"
                        class="form-control" id="address" placeholder="address" value="" required  name="address">
                     <div class="invalid-feedback">주소 입력해주세요.</div>
                  </div>
                   <div class="col-md-6 mb-3">
                     <label for="account">계좌</label> <input type="text"
                        class="form-control" id="account" placeholder="account" value="" required  name="account">
                     <div class="invalid-feedback"> 입력해주세요.</div>
                  </div>
                   <div class="col-md-6 mb-3">
                     <label for="bank">은행</label> <input type="text"
                        class="form-control" id="bank" placeholder="bank" value="" required  name="bank">
                     <div class="invalid-feedback">bank 입력해주세요.</div>
                  </div>
                   <div class="col-md-6 mb-3">
                     <label for="nickname">닉네임</label> <input type="text"
                        class="form-control" id="nickname" placeholder="닉네임" value="" required  name="nickname">
                     <div class="invalid-feedback">닉네임</div>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="name">이름</label> <input type="text"
                        class="form-control" id="name" placeholder="" value=""   name="name"
                        required>
                     <div class="invalid-feedback">이름을 입력해주세요.</div>
                  </div>
               </div></div></div>
               
                  <div class="row">
                  <div class="col-md-6 mb-3">
                     <label for="pass">비밀번호</label> <input type="password"
                        class="form-control" id="pass" placeholder="아이디" value="" required  name="pass">
                     <div class="invalid-feedback">비밀번호을 입력해주세요.</div>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="pass2">비밀번호확인</label> <input type="password"
                        class="form-control" id="pass2" placeholder="" value=""   name="pass2"
                        required>
                     <div class="invalid-feedback">비밀번호확인을 입력해주세요.</div>
                  </div>
					</div><p>
					<div class="mb-1"></div>
					<button class="lo" type="submit">Sign up</button>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>