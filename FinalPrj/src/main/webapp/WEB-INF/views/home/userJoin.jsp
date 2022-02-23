<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
window.onload = function(){
	  engAndNumberFunc(document.getElementById("user_id"));
	  onlyNumberFunc(document.getElementById("jnum1"));
	  onlyNumberFunc(document.getElementById("jnum2"));
	  onlyNumberFunc(document.getElementById("age"));
	  onlyKorFunc(document.getElementById("name"));
	}
	function engAndNumberFunc(t){
	  var regexp = /[^a-z0-9]/gi;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}
	function onlyNumberFunc(t){
	  var regexp = /[^0-9]/gi;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}
	function onlyEngFunc(t){
	  var regexp = /[^a-z]/gi;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}
	function onlyKorFunc(t){
	  var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}
	function korAndNumberFunc(t){
	  var regexp = /[^ㄱ-ㅎ가-힣0-9]/gi;
	  t.onkeyup = function(e){
	    var v = this.value;
	    this.value = v.replace(regexp,'');
	  }
	}

function check(){
	if(document.uj.user_id.value == "" || document.uj.user_id.value.length < 0){ 
		alert("아이디를 입력해주세요")
		document.uj.user_id.focus();
		return false;
	}
	if(document.uj.pwd.value == "" || document.uj.pwd.value.length < 0){ 
		alert("비밀번호를 입력해주세요")
		document.uj.pwd.focus();
		return false;
	}
	if(document.uj.pwd2.value == "" || document.uj.pwd2.value.length < 0){ 
		alert("비밀번호를 확인해주세요")
		document.uj.pwd2.focus();
		return false;
	}
	if(document.uj.name.value == "" || document.uj.name.value.length < 0){ 
		alert("이름을 입력해주세요")
		document.uj.name.focus();
		return false;
	}
	if(document.uj.name.value.length<2 || document.uj.name.value.length > 6){ 
		alert("이름은 2~6글자 사이로 입력해주세요")
		document.uj.name.focus();
		return false;
	}
	if(document.uj.jnum1.value == "" || document.uj.jnum1.value.length < 0){ 
		alert("주민번호 앞자리를 입력해주세요")
		document.uj.jnum1.focus();
		return false;
	}
	if(document.uj.jnum1.value.length != 6){ 
		alert("주민번호 앞자리는 6자리입니다")
		document.uj.jnum1.focus();
		return false;
	}
	if(document.uj.jnum2.value == "" || document.uj.jnum2.value.length < 0){ 
		alert("주민번호 뒷자리를 입력해주세요")
		document.uj.jnum2.focus();
		return false;
	}
	if(document.uj.jnum2.value.length != 7){ 
		alert("주민번호 뒷자리는 7자리입니다")
		document.uj.jnum2.focus();
		return false;
	}
	if(document.uj.age.value == "" || document.uj.age.value.length < 0){ 
		alert("나이를 입력해주세요")
		document.uj.age.focus();
		return false;
	}
	if(document.uj.area.value == "" || document.uj.area.value.length < 0){ 
		alert("거주 지역을 선택해주세요")
		document.uj.area.focus();
		return false;
	}
}
function check_pw(){
	 
    var pwd = document.getElementById('pwd').value;
    var SC = ["!","@","#","$","%"];
    var check_SC = 0;

    if(pwd.length < 6 || pwd.length>16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 사용 가능합니다.');
        document.getElementById('pwd').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pwd.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
        document.getElementById('pwd').value='';
    }
    if(document.getElementById('pwd').value !='' && document.getElementById('pwd2').value!=''){
        if(document.getElementById('pwd').value==document.getElementById('pwd2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        	}
    	}
}

$(function(){
	$("#user_id").keyup(function(){
		let user_id=$("#user_id").val();
		if(user_id=="") return;
		$.ajax({
			url:'/final/idCheck/' + user_id,
			dataType:'json',
			success:function(data){
				if(data.using==true){
					$("#idcheck").html("사용 중인 아이디입니다.");
					$("#idcheck").css("color","red");
				}else{
					$("#idcheck").html("사용 가능한 아이디입니다.");
					$("#idcheck").css("color","blue");
				}
			}
		})
	});
});

</script>

</head>
<body>

<!-- 
<div class = "joinBox">
	<form:form method="post" action="${pageContext.request.contextPath }/join" name="uj" onsubmit="return check();">
		<div style="display: flex; justify-content: space-between;margin: 10px 0;width:230px;">
		아이디<input type = "text" name="user_id" id="user_id" maxlength="13"  style="margin-bottom: 10px;height: 20px"></div>
		<div>비밀번호<input type = "password" name="pwd" id="pwd" onchange="check_pw()"></div><br>
		<div>비밀번호확인<input type = "password" name="pwd2" id="pwd2" onchange="check_pw()"></div><br>
		<div>이름<input type = "text" name="name" id="name" maxlength="6"></div><br>
		<div>주민번호<input type = "text" name="jnum1" id="jnum1" maxlength="6"> - <input type="password" name="jnum2" id="jnum2" maxlength="7"></div><br>
		<div>나이<input type = "text" name="age" id="age" maxlength="2"></div><br>
		<div>지역
		<select name="area" id="area">
			<option value="서울">서울</option>
			<option value="인천광역시">인천광역시</option>
			<option value="경기">경기</option>
			<option value="강원">강원</option>
			<option value="충북">충북</option>
			<option value="대전광역시">대전광역시</option>
			<option value="충남">충남</option>
			<option value="전북">전북</option>
			<option value="전남">전남</option>
			<option value="광주광역시">광주광역시</option>
			<option value="경북">경북</option>
			<option value="대구광역시">대구광역시</option>
			<option value="울산광역시">울산광역시</option>
			<option value="경남">경남</option>
			<option value="부산광역시">부산광역시</option>
			<option value="제주">제주</option>
			<option value="해외">해외</option>
		</select>
		</div>
		<br>
		<tr>
		<th>
			이메일
		</th>
		<td>
			<p>
				<input id="email" type="text" name="email" placeholder="이메일 주소를 입력해주세요." required/>
				<button type="button" id="emailChk" class="doubleChk">인증번호 보내기</button><br/>
				<input id="email2" type="text" name="email2" placeholder="인증번호 입력" disabled required/>
				<button type="button" id="emailChk2" class="doubleChk">이메일인증</button>
				<span class="successEmailChk" style="font-size:0.5em;">이메일 입력후 인증번호 보내기를 해주십시오.</span>
				<input type="hidden" id="emailDoubleChk"/>
			</p>
		</td>
		</tr>
		<input type="submit" value="가입">
	</form:form>
</div>
-->
<div style="display: flex; flex-direction: column; justify-content: center;height: 100%">
<div class="joinBox">
<form:form method="post" action="${pageContext.request.contextPath }/join" name="uj" onsubmit="return check();">
	<div style="display: flex; width:100%; margin:15px 0;">
	<span style="width:100px">아이디</span><input type="text" name="user_id" id="user_id" maxlength="13" style= "height: 25px; margin-right:10px;"><div id="idcheck" style="font-size:0.5em;"></div>
	</div>
	
	<div style="display: flex; width:100%; margin:15px 0;">
	<span style="width:100px">비밀번호</span><input type="password" name="pwd" id="pwd" onchange="check_pw()" style= "height: 25px; margin-right:10px"><div style="font-size:0.5em; color:grey;">6글자 이상, 16글자 이하 & 특수문자(!,@,#,$,%)를 포함해주세요 </div>
	</div>
	
	<div style="display: flex; width:100%; margin:15px 0;">
		<span style="width:100px">비밀번호 확인</span><input type="password" name="pwd2" id="pwd2" onchange="check_pw()" style= "height: 25px;"><span id="check" style="font-size:0.5em;"></span>
	</div>
	<div style="display: flex; width:100%; margin:15px 0;">
	<span style="width:100px">이름</span><input type="text" name="name" id="name" maxlength="6" style= "height: 25px;">
	</div>
	<div style="display: flex; width:100%; margin:15px 0;">
	<span style="width:100px">주민번호</span><input type="text" name="jnum1" id="jnum1" maxlength="6" style= "height: 25px;"> - <input type="password" name="jnum2" id="jnum2" maxlength="7" style= "height: 25px;">
	</div>
	<div style="display: flex; width:100%; margin:15px 0;">
	<span style="width:100px">나이</span><input type="text" name="age" id="age" maxlength="2" style= "height: 25px;">
	</div>
	<div style="display: flex; width:100%; margin:15px 0;">
	<span style="width:100px">지역</span>
	<select name="area" id="area">
		<option value="서울">서울</option>
		<option value="인천광역시">인천광역시</option>
		<option value="경기">경기</option>
		<option value="강원">강원</option>
		<option value="충북">충북</option>
		<option value="대전광역시">대전광역시</option>
		<option value="충남">충남</option>
		<option value="전북">전북</option>
		<option value="전남">전남</option>
		<option value="광주광역시">광주광역시</option>
		<option value="경북">경북</option>
		<option value="대구광역시">대구광역시</option>
		<option value="울산광역시">울산광역시</option>
		<option value="경남">경남</option>
		<option value="부산광역시">부산광역시</option>
		<option value="제주">제주</option>
		<option value="해외">해외</option>
	</select>
	</div>
		
		<div style="display: flex; width:100%; margin:15px 0;">
				<span style="width:100px">이메일</span>		
				<input id="email" type="text" name="email" placeholder="이메일 주소를 입력해주세요." style="width:200px; height:25px;" required/>
				<button type="button" id="emailChk" class="doubleChk" style="width:120px;border: 1px solid #d8e3d5; background:#b2e1cc73;"  onMouseOver="this.style.backgroundColor='#92daa6';" onMouseOut="this.style.backgroundColor='#b2e1cc73'">인증번호 보내기</button><br/>
		</div>
		<div style="display: flex; width:100%; margin:15px 0;">
				<span style="width:100px"></span>
				<input id="email2" type="text" name="email2" placeholder="인증번호를 입력해주세요." style="width:200px; height:25px;" disabled required/>
				<button type="button" id="emailChk2" class="doubleChk" style="width:120px;border: 1px solid #d8e3d5; background:#b2e1cc73;" onMouseOver="this.style.backgroundColor='#92daa6';" onMouseOut="this.style.backgroundColor='#b2e1cc73'">이메일인증</button>
				<div style="font-size:0.5em; color:grey;">이메일 입력 후 버튼을 클릭해주세요.</div>
				<input type="hidden" id="emailDoubleChk"/>
			</div>
	<br><br>
	<div style="text-align:center;">
	<input type="submit" value="회원가입" style="font-size:20px;width:200px;height: 80px;background: #b2e1cc73;border: 1px solid #d8e3d5;">
	</div>
</form:form>
</div>
</div>
</body>

<script type="text/javascript">

var code = "";
$("#emailChk").click(function(){
	var email = $("#email").val();
	$.ajax({
        type:"GET",
        url:"mailCheck?email=" + email,
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("인증번호 발신하는 이메일의 아이디&비밀번호를 확인해주세요");
				$("#email").attr("autofocus",true);
				$(".successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
				$(".successEmailChk").css("color","red");
        	}else{	        		
				alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
        		$("#email2").attr("disabled",false);
        		$("#emailChk2").css("display","inline-block");
        		$(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
        		$(".successEmailChk").css("color","green");
        		code = data;
        	}
        }
    });
});

$("#emailChk2").click(function(){
	if($("#email2").val() == code){
		$(".successEmailChk").text("인증번호가 일치합니다.");
		$(".successEmailChk").css("color","green");
		$("#emailDoubleChk").val("true");
		$("#email2").attr("disabled",true);
	}else{
		$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successEmailChk").css("color","red");
		$("#emailDoubleChk").val("false");
		$("#email2").attr("autofocus",true);
	}
});
</script>
</html>