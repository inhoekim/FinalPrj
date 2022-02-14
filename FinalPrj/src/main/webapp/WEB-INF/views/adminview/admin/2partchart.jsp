<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 style="color: black; ">파티 차트</h2>
<hr style="width: 100%; height: 2px; background-color: #bdbdbd; margin-bottom: 20px;">

</body>
<script type="text/javascript">
<script type="text/javascript">
var jsonData = ${json}
var jsonObject = JSON.stringify(jsonData);
var jData = JSON.parse(jsonObject);

var labelList = new Array();
var valueList = new Array();
var colorList = new Array();

for(var i = 0; i<jData.length; i++) {
	var d = jData[i];
	labelList.push(d.IP);
	valueList.push(d.Count);
	colorList.push(colorize());
}
		
		
var data = {
				labels: labelList,
				datasets: [{
						backgroundColor: colorList,
						data : valueList
				}],
				options : {
						title : {
						display : true,
						text: '유저별 접속 횟수'
						}
				}
};
		
var ctx1 = document.getElementById('logNameChart').getContext('2d');
new Chart(ctx1, {
	      type: 'pie',
		  data: data
});
	
function colorize() {
	var r = Math.floor(Math.random()*200);
	var g = Math.floor(Math.random()*200);
	var b = Math.floor(Math.random()*200);
	var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
	return color;
}

</script>
</html>