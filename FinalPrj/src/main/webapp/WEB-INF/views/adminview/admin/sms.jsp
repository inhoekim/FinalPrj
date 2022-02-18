<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
 <html>

    <head>
        <title>sms - jsp </title>
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
                var data_file = "/final/sms2";
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

    <body onload="loadJSON()">
    <form:form method="post" name="smsForm" action="${pageContext.request.contextPath}/sms1">
        <input type="hidden" name="action" value="go"> 발송타입
        <span>
          <input type="radio" name="smsType" value="S">단문(SMS)</span>
        <span>
          <input type="radio" name="smsType" value="L">장문(LMS)</span>
        <br /> 제목 :
        <input type="text" name="subject" value="제목"> 장문(LMS)인 경우(한글30자이내)
        <br /> 전송메세지
        <textarea name="msg" cols="30" rows="10" style="width:455px;">내용입력</textarea>
        <br />
        <br />
        <p>단문(SMS) : 최대 90byte까지 전송할 수 있으며, 잔여건수 1건이 차감됩니다.
            <br /> 장문(LMS) : 한번에 최대 2,000byte까지 전송할 수 있으며 1회 발송당 잔여건수 3건이 차감됩니다.
        </p>
        <br />받는 번호
        <input type="text" name="rphone" value="011-111-1111"> 예) 011-011-111 , '-' 포함해서 입력.
        <br />이름삽입번호
        <input type="text" name="destination" value="" size=80> 예) 010-000-0000|홍길동
        <br /> 보내는 번호
        <input type="hidden" name="sphone1">
        <input type="hidden" name="sphone2">
        <input type="hidden" name="sphone3">
        <span id="sendPhoneList"></span>
        <br />예약 날짜
        <input type="text" name="rdate" maxlength="8"> 예)20090909
        <br />예약 시간
        <input type="text" name="rtime" maxlength="6"> 예)173000 ,오후 5시 30분,예약시간은 최소 10분 이상으로 설정.
        <br />return url
        <input type="text" name="returnurl" maxlength="64" value="http://localhost:9090/final/sms" readonly="readonly">
        <br /> test flag
        <input type="text" name="testflag" maxlength="1"> 예) 테스트시: Y
        <br />nointeractive
        <input type="text" name="nointeractive" maxlength="1"> 예) 사용할 경우 : 1, 성공시 대화상자(alert)를 생략.
        <br />반복설정
        <input type="checkbox" name="repeatFlag" value="Y">
        <br /> 반복횟수
        <select name="repeatNum">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select> 예) 1~10회 가능.
        <br />전송간격
        <select name="repeatTime"> 예)15분 이상부터 가능.
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="25">25</option>
        </select>분마다
        <br>
        <input type="submit" value="전송">
        <br/>이통사 정책에 따라 발신번호와 수신번호가 같은 경우 발송되지 않습니다.
    </form:form>
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
            