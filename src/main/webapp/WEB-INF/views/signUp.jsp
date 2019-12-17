<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원가입</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 스크립트 시작 -->
<script type="text/javascript">
var idPass;
//영문,숫자포함 4~12
var idRegex = /^[a-zA-Z0-9]{4,12}$/;
var passWordPass;
$(document).ready(function(){
	//아이디 중복체크
	$('input[name=id]').blur(function(){
		var idCheck=$('input[name=id]').val();
		if(idRegex.test(idCheck)){
			$.ajax({
				url:'idCheck?userId='+idCheck,
				type:'get',
				success:function(data){
					var color;
					var ans;
					if(data>0){
						ans='이미있는 아이디입니다.';
						color='red';
						idPass=false;
					}else{
						ans='회원가입 가능한 아이디입니다.';
						color='blue';
						idPass=true;
					}
					$('#temp').text(ans);
					$('#temp').css('color',color);
				}
			})	
		}
	});
	//비밀번호 일치
	//비밀번호 정규식 특수문자 / 문자 / 숫자 포함 형태의 5~10
	var pwRegex =  /^.*(?=^.{5,10}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		$('input[name=passWordCheck]').blur(function(){
			var passWordTest=pwRegex.test($('input[name=passWord]').val());
			if(passWordTest&&$('input[name=passWord]').val()==$('input[name=passWordCheck]').val()){
				passWordPass=true;
				$('#passWordCheckRegex').text('성공');
			}else if(!passWordTest){
				passWordPass=false;
				$('#passWordCheckRegex').text('비밀번호가 형식에 맞지 않습니다.');
			}else if($('input[name=passWord]').val()!=$('input[name=passWordCheck]').val()){
				passWordPass=false;
				$('#passWordCheckRegex').text('비밀번호가 일치하지 않습니다.');
			}
		});
		
	//회원가입 버튼 작동
	$('#signUpBtn').click(function(){
		var name=$('input[name=name]').val();
		if(idPass&&name!=''&&passWordPass){
			$('.user').submit();
		}else{
			alert('조건에 만족하지 않습니다.');
		}
	});
});
</script>
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 mb-4" id="temp">Create an Account!</h1>
              </div>
              <form class="user" action="signUp" method="post">
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" name="id" placeholder="아이디를 입력해 주세요.">
                </div>
                 <div class="form-group row">
                 <div class="col-sm-11 small">★★★아이디는 영문자,숫자 4~12범위입니다.</div>
                 </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" name="name" placeholder="이름을 입력해 주세요.">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" name="passWord" placeholder="비밀번호를 입력해주세요.">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" name="passWordCheck" placeholder="비밀번호를 확인해 주세요.">
                  </div> 
                </div>
                 <div class="form-group row">
                 <div class="col-sm-11 small">★★★비밀번호는 특수문자,숫자,영문자 포함 5~10자리로 만들어 주세요.</div>
                 <div class="col-sm-11 small" id="passWordCheckRegex"></div>
                 </div>
                <input type="button" class="btn btn-primary btn-user btn-block" id="signUpBtn" value="회원가입">
                <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.html">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.html">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin-2.min.js"></script>

</body>

</html>