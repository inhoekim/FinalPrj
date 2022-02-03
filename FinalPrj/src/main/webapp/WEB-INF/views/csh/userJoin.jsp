<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


</script>

</head>
<body>
<form:form method="post" action="${pageContext.request.contextPath }/join" name="uj" onsubmit="return check();">
	아이디 <br>
	<input type="text" name="user_id" id="user_id" maxlength="13"><br>
	비밀번호 <br>
	<input type="password" name="pwd" id="pwd" onchange="check_pw()"><span style="font-size:0.5em; color:grey;">&nbsp;&nbsp;&nbsp; 6글자 이상, 16글자 이하 & 특수문자(!,@,#,$,%)를 포함해주세요 </span><br>
	비밀번호 확인<br>
	<input type="password" name="pwd2" id="pwd2" onchange="check_pw()">&nbsp;&nbsp;<span id="check" style="font-size:0.5em;"></span><br>
	이름 <br>
	<input type="text" name="name" id="name" minlength="2" maxlength="6"><br>
	주민번호 <br>
	<input type="text" name="jnum1" id="jnum1" maxlength="6"> - <input type="password" name="jnum2" id="jnum2" maxlength="7"><br>
	나이 <br>
	<input type="text" name="age" id="age" maxlength="2"><br>
	지역 <br>
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
	<br>
	이메일 <br>
	<input type="text" name="email" value="${email_id }" readonly="readonly"><br>
	<input type="submit" value="가입">
</form:form>
</body>
</html>