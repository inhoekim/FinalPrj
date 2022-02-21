<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
 <html>
    <head>
        <style type="text/css">
		/*  form태그 전체를 감싸고있는 박스   */
		#bigbox{
			width:  1200px;
			display: flex;
			justify-content: center;
			background-color: white;
			border-radius: 9px;
			box-shadow : 0 0 20px 1px grey;
			padding-top: 40px;
			margin-left: auto;
			margin-right: auto;
			margin-bottom : 100px;
			box-sizing: content-box !important;
		}
		/* 단문,장문 잔여건수 안내문 */
		#box1{
			display: flex;
			width: 800px;
			border: 2px solid #212121; 
			background-color: white;
			color: #212121;
			border-radius: 9px;
			margin-top: 20px;
			margin-bottom: 20px;
			padding-left: 80px;
		}


		#box100{
			display: flex;
		}
		#box101{
			width: 180px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			font-size: 18px;
			padding-top: 20px;
			border-top-left-radius: 9px;
			border-top-right-radius: 9px;
		}
		#box102{
			width: 800px;
			text-align: left;
			font-size: 18px;
			border-bottom: 1px solid lightgrey;
			padding-left: 20px;
			padding-top: 20px;
			padding-bottom: 20px;
		}
		

		#box104{
			display: flex;
		}		
		#box105{
			width: 180px; height: 80px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			padding-top: 30px;
			border-bottom: 1px solid #212121;
			
		}		
		#box106{
			width: 800px; height: 80px;
			text-align: left;
			font-size: 18px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
			padding-top: 10px;
			padding-bottom: 10px;
		}		
		#box107{
			width: 500px; height: 30px;
			font-size: 20px;
			border-radius: 3px;
			border : 1px solid #212121;
		}


		#box109{
			display: flex;
		}		
		#box110{
			width: 180px; height: 170px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			padding-top: 60px;
			border-bottom: 1px solid #212121;
		}		
		#box111{
			width: 800px; height: 170px;
			text-align: left;
			font-size: 18px;
			border-bottom: 1px solid lightgrey;
			padding-left: 20px;
			padding-top: 10px;
			padding-bottom: 10px;

		}
		#box112{
			width:500px; height: 130px;
			margin-top: 10px;
			font-size: 15px;
			border : 1px solid #212121;
			border-radius: 3px;
		}


		#box114{
			display: flex;
		}
		#box115{
			width: 180px; height: 60px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			padding-top: 20px;
			border-bottom: 1px solid #212121;
		}
		#box116{
			width:800px; height: 60px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
			padding-top: 20px;
			padding-bottom: 10px;
		}
		#box117{
			width: 150px; height: 20px;
			font-size: 17px;
			border : 1px solid #212121;
			border-radius: 3px;
			text-align: center;
		}


		#box119{
			display: flex;
		}
		#box120{
			width: 180px; height: 80px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			padding-top: 30px;
			border-bottom: 1px solid #212121;
		}
		#box121{
			width:800px; height: 80px;
			padding-top: 10px;
			padding-bottom: 10px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}		
		#box122{
			font-size: 17px;
			border : 1px solid #212121;
			border-radius: 3px;
		}


		#box124{
			display: flex;
		}
		#box125{
			width: 180px; height: 50px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			padding-top: 10px;
			border-bottom: 1px solid #212121;
		}
		#box126{
			width:800px; height: 50px;
			padding-top: 10px;
			padding-bottom: 10px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}


		#box128{
			display: flex;
		}
		#box129{
			width: 180px; height: 50px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			padding-top: 15px;
			border-bottom: 1px solid #212121;
		}
		#box130{
			width:800px; height: 50px;
			padding-top: 10px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}
		#box131{
			font-size: 17px;
			border : 1px solid #212121;
			border-radius: 3px;
		}


		#box133{
			display: flex;
		}
		#box134{
			width: 180px; height: 50px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			padding-top: 10px;
			border-bottom: 1px solid #212121;
		}
		#box135{
			width:800px; height: 50px;
			padding-top: 10px;
			padding-bottom: 10px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}
		#box136{
			font-size: 17px;
			border : 1px solid #212121;
			border-radius: 3px;
		}

		#box138{
			display: flex;
		}
		#box139{
			width: 180px; height: 55px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			padding-top: 15px;
			border-bottom: 1px solid #212121;
		}		
		#box140{
			width:800px; height: 50px;
			padding-top: 10px;
			padding-bottom: 10px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}
		#box141{
			width: 250px;
			font-size: 17px;
			border : 1px solid #212121;
			border-radius: 3px;
		}


		#box143{
			display: flex;
		}
		#box144{
			width: 180px; height: 60px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			border-bottom: 1px solid #212121;
			padding-top: 10px
		}
		#box145{
			width:800px; height: 45px;
			padding-top: 5px;
			padding-bottom: 5px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}
		#box146{
			width: 250px;
			font-size: 17px;
			border : 1px solid #212121;
			border-radius: 3px;
		}


		#box148{
			display: flex;
		}
		#box149{
			width: 180px; height: 60px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			padding-top: 5px;
			border-bottom: 1px solid #212121;
		}
		#box150{
			width:800px; height: 45px;
			padding-bottom: 10px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}
		#box151{
			width: 250px;
			font-size: 17px;
			border : 1px solid #212121;
			border-radius: 3px;
		}


		#box153{
			display: flex;
		}
		#box154{
			width: 180px; height: 50px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			border-bottom: 1px solid #212121;
		}
		#box155{
			width:800px; height: 35px;
			padding-bottom: 10px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}


		#box158{
			display: flex;
		}
		#box159{
			width: 180px; height: 50px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			border-bottom: 1px solid #212121;
		}
		#box160{
			width:800px; height: 35px;
			padding-bottom: 10px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}


		#box162{
			display: flex;
		}
		#box163{
			width: 180px; height: 40px;
			background-color: #212121;
			color: antiquewhite;
			text-align: center;
			border-bottom: 1px solid #212121;
			border-bottom-left-radius: 6px;
			border-bottom-right-radius: 6px;
		}
		#box164{
			width:800px; height: 40px;
			padding-bottom: 10px;
			padding-left: 20px;
			border-bottom: 1px solid lightgrey;
		}


		#box166{
			display: flex;
		}				
		#box167{
			padding-top: 10px;
			padding-bottom: 10px;
		}		
		#box168{
			padding-top: 10px;
			padding-left: 90px;
		}	


		#button{
			background-color: #212121;
			color: antiquewhite;
			width: 180px; height: 40px;
			border-radius: 9px;
			border-color: #212121;
			cursor: pointer;
			font-size: 20px;
		}



        </style>

        <script type="text/javascript">
            function setPhoneNumber(val) {
                var numList = val.split("-");
                document.smsForm.sphone1.value = numList[0];
                document.smsForm.sphone2.value = numList[1];
            if(numList[2] != undefined){
                    document.smsForm.sphone3.value = numList[2];
        }
            }

            function loadJSON() {
                var data_file = "/final/admin/sms2";
                var http_request = new XMLHttpRequest();
                try {
                    // Opera 8.0+, Firefox, Chrome, Safari
                    http_request = new XMLHttpRequest();
                } catch (e) {
                    // Internet Explorer Browsers
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");

                    } catch (e) {

                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                            // Eror
                            alert("지원하지 않는브라우저!");
                            return false;
                        }

                    }
                }
                http_request.onreadystatechange = function() {
                    if (http_request.readyState == 4) {
                        // Javascript function JSON.parse to parse JSON data
                        var jsonObj = JSON.parse(http_request.responseText);
                        if (jsonObj['result'] == "Success") {
                            var aList = jsonObj['list'];
                            var selectHtml = "<select name=\"sendPhone\" onchange=\"setPhoneNumber(this.value)\">";
                            selectHtml += "<option value='' selected>발신번호를 선택해주세요</option>";
                            for (var i = 0; i < aList.length; i++) {
                                selectHtml += "<option value=\"" + aList[i] + "\">";
                                selectHtml += aList[i];
                                selectHtml += "</option>";
                            }
                            selectHtml += "</select>";
                            document.getElementById("sendPhoneList").innerHTML = selectHtml;
                        }
                    }
                }

                http_request.open("GET", data_file, true);
                http_request.send();
            }
        </script>
</head>
	
<h2 style="color: black; ">SMS 발송</h2>
<hr style="width: 100%; height: 2px; background-color: #bdbdbd; margin-bottom: 20px;">
	
    <body onload="loadJSON()">


<div id="bigbox" >


    <form:form method="post" name="smsForm" action="${pageContext.request.contextPath}/admin/sms1">
        <input type="hidden" id="boxtype" name="action" value="go"> 

		<div id= "box100"> 
			<div id="box101"><p>발송타입</p></div>
			<div id="box102">
				<span><input type="radio" name="smsType" value="S">단문(SMS)</span>
				<span><input type="radio" name="smsType" value="L">장문(LMS)</span>
			</div>
		</div>

		<div id="box104">
        	<div id="box105">메세지제목</div>
			<div id="box106">
				장문(LMS)인 경우(한글30자이내) <br>
        		<input type="text" name="subject" id="box107" value="제목"> 
			</div>
		</div>

        <div id="box109">
			<div id="box110"> 전송메세지</div>
			<div id="box111">
        		<textarea name="msg" cols="30" rows="10" id="box112">내용입력</textarea>
			</div>
		</div>

		<div id="box114">
			<div id="box115">받는 번호</div>
			<div id="box116">
				<input type="text" name="rphone" value="010-1111-1111" id="box117"> 예) 010-1111-111 , '-' 포함해서 입력.
			</div>
		</div>

		<div id="box119">
			<div id="box120">이름삽입번호</div>
			<div id="box121">
				예) 010-000-0000|홍길동,010-000-0001|김길동 <br>
				<input type="text" name="destination" value="" size=80 id="box122">
			</div>
		</div>

		<div id="box124">
			<div id="box125">보내는 번호</div>
			<div id="box126">
				<input type="hidden" name="sphone1">
				<input type="hidden" name="sphone2">
				<input type="hidden" name="sphone3">
				<span id="sendPhoneList"></span>
			</div>
		</div>

		<div id="box128">
			<div id="box129">예약 날짜</div>
			<div id="box130">
				<input type="text" name="rdate" maxlength="8" id="box131"> 예)20090909
			</div>
		</div>

		<div id="box133">
			<div id="box134">예약 시간</div>
			<div id="box135">
				<input type="text" name="rtime" maxlength="6" id="box136"> 예)173000 ,오후 5시 30분,예약시간은 최소 10분 이상으로 설정.
			</div>
		</div>

		<div id="box138">
			<div id="box139">Return Url</div>
			<div id="box140">
				<input type="text" name="returnurl" maxlength="64" value="http://localhost:9090/final/admin/adminsms" readonly="readonly" id="box141">
			</div>
		</div>

		<div id="box143">
			<div id="box144">Test Flag</div>
			<div id="box145">
				<input type="text" name="testflag" maxlength="1" id="box146"> 예) 테스트시: Y
			</div>
		</div>

		<div id="box148">
			<div id="box149">nointeractive</div>
			<div id="box150">
				<input type="text" name="nointeractive" maxlength="1" id="box151"> 예) 사용할 경우 : 1, 성공시 대화상자(alert)를 생략.
			</div>
		</div>

		<div id="box153">
			<div id="box154">반복설정</div>
			<div id="box155">
				<input type="checkbox" name="repeatFlag" value="Y" id="box156">
				사용할 경우 체크해주세요
			</div>
		</div>

		<div id="box158">
			<div id="box159">반복횟수</div>
			<div id="box160">
				<select name="repeatNum">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select> 예) 1~10회 가능.
			</div>
		</div>

		<div id="box162">
			<div id="box163">전송간격</div>
			<div id="box164">
				<select name="repeatTime"> 예)15분 이상부터 가능.
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
				</select>분마다
			</div>
		</div>

		<div id="box166">
			<div id="box167">
				이통사 정책에 따라 발신번호와 수신번호가 같은 경우 발송되지 않습니다.
			</div>
			<div id="box168">
				<input type="submit" value="전송" id="button">
			</div>
		</div>





		<div id="box1">
			<p>단문(SMS) : 최대 90byte까지 전송할 수 있으며, 잔여건수 1건이 차감됩니다.
			<br/> 장문(LMS) : 한번에 최대 2,000byte까지 전송할 수 있으며 1회 발송당 잔여건수 3건이 차감됩니다.
			</p>
		</div>

		</form:form>

</div> <!--빅박스의 끝-->


    </body>
<APM_DO_NOT_TOUCH>

<script type="text/javascript">
(function(){
window.uhX=!!window.uhX;try{(function(){(function(){})();var lj=99;try{var Lj,zj,sj=l(517)?1:0,ij=l(997)?0:1,Ij=l(858)?0:1,LJ=l(436)?1:0;for(var oJ=(l(530),0);oJ<zj;++oJ)sj+=l(120)?2:1,ij+=(l(696),2),Ij+=l(560)?2:1,LJ+=(l(910),3);Lj=sj+ij+Ij+LJ;window.SZ===Lj&&(window.SZ=++Lj)}catch(sJ){window.SZ=Lj}var _J=!0;function O(J){var L=arguments.length,z=[],S=1;while(S<L)z[S-1]=arguments[S++]-J;return String.fromCharCode.apply(String,z)}
function iJ(J){var L=2;!J||document[Z(L,120,107,117,107,100,107,110,107,118,123,85,118,99,118,103)]&&document[O(L,120,107,117,107,100,107,110,107,118,123,85,118,99,118,103)]!==s(68616527664,L)||(_J=!1);return _J}function Z(J){var L=arguments.length,z=[];for(var S=1;S<L;++S)z.push(arguments[S]-J);return String.fromCharCode.apply(String,z)}function s(J,L){J+=L;return J.toString(36)}function IJ(){}iJ(window[IJ[s(1086755,lj)]]===IJ);iJ(typeof ie9rgb4!==s(1242178186100,lj));
iJ(RegExp("\x3c")[s(1372106,lj)](function(){return"\x3c"})&!RegExp(s(42790,lj))[s(1372106,lj)](function(){return"'x3'+'d';"}));
var ll=window[O(lj,196,215,215,196,198,203,168,217,200,209,215)]||RegExp(O(lj,208,210,197,204,223,196,209,199,213,210,204,199),Z(lj,204))[Z(lj,215,200,214,215)](window["\x6e\x61vi\x67a\x74\x6f\x72"]["\x75\x73e\x72A\x67\x65\x6et"]),ol=+new Date+(l(850)?795669:6E5),Ol,zl,Zl,sl=window[O(lj,214,200,215,183,204,208,200,210,216,215)],il=ll?l(977)?39659:3E4:l(472)?6E3:4232;
document[Z(lj,196,199,199,168,217,200,209,215,175,204,214,215,200,209,200,213)]&&document[O(lj,196,199,199,168,217,200,209,215,175,204,214,215,200,209,200,213)](Z(lj,217,204,214,204,197,204,207,204,215,220,198,203,196,209,202,200),function(J){var L=93;document[O(L,211,198,208,198,191,198,201,198,209,214,176,209,190,209,194)]&&(document[Z(L,211,198,208,198,191,198,201,198,209,214,176,209,190,209,194)]===s(1058781890,L)&&J[O(L,198,208,177,207,210,208,209,194,193)]?Zl=!0:document[O(L,211,198,208,198,
191,198,201,198,209,214,176,209,190,209,194)]===s(68616527573,L)&&(Ol=+new Date,Zl=!1,jL()))});function jL(){if(!document[O(70,183,187,171,184,191,153,171,178,171,169,186,181,184)])return!0;var J=+new Date;if(J>ol&&(l(783)?658857:6E5)>J-Ol)return iJ(!1);var L=iJ(zl&&!Zl&&Ol+il<J);Ol=J;zl||(zl=!0,sl(function(){zl=!1},l(855)?0:1));return L}jL();var JL=[l(944)?13996070:17795081,l(188)?27611931586:2147483647,l(814)?1715083066:1558153217];
function lL(J){var L=14;J=typeof J===s(1743045662,L)?J:J[O(L,130,125,97,130,128,119,124,117)](l(581)?36:20);var z=window[J];if(!z||!z[Z(L,130,125,97,130,128,119,124,117)])return;var S=""+z;window[J]=function(J,L){zl=!1;return z(J,L)};window[J][Z(L,130,125,97,130,128,119,124,117)]=function(){return S}}for(var LL=(l(139),0);LL<JL[s(1294399106,lj)];++LL)lL(JL[LL]);iJ(!1!==window[Z(lj,216,203,187)]);window._z=window._z||{};window._z.OI="08975c6dde194000bcac73a5cdc75076b6dab3c662df321e01721a4a03e88cd9a358ab956ae13bf8095d2a058cc3ab69e5b902417d8d05eaddecf5dfeaff176cfe4b379104dc8613";
function OL(J){var L=+new Date,z;!document[Z(83,196,200,184,197,204,166,184,191,184,182,199,194,197,148,191,191)]||L>ol&&(l(313)?6E5:434809)>L-Ol?z=iJ(!1):(z=iJ(zl&&!Zl&&Ol+il<L),Ol=L,zl||(zl=!0,sl(function(){zl=!1},l(408)?1:0)));return!(arguments[J]^z)}function l(J){return 701>J}
(function(){var J=/(\A([0-9a-f]{1,4}:){1,6}(:[0-9a-f]{1,4}){1,1}\Z)|(\A(([0-9a-f]{1,4}:){1,7}|:):\Z)|(\A:(:[0-9a-f]{1,4}){1,7}\Z)/ig,L=document.getElementsByTagName("head")[0],z=[];L&&(L=L.innerHTML.slice(0,1E3));while(L=J.exec(""))z.push(L)})();})();}catch(x){}finally{ie9rgb4=void(0);};function ie9rgb4(a,b){return a>>b>>0};

})();

</script>
</APM_DO_NOT_TOUCH>

<script type="text/javascript" src="/TSPD/0853a021f8ab2000754286a5548a4576db31137e58706641652d31549dddc632b8a4ce4312f550eb?type=9"></script>


    </html>