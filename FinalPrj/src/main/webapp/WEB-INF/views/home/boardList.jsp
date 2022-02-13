<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
Test
</div>


<script>
$(function(){
	$($(".category_name")[0]).addClass("active");
	$($(".folder_items")[0]).addClass("active");
	$($(".category_name")[0]).children('i').removeClass('fa-folder');
	$($(".category_name")[0]).children('i').addClass('fa-folder-open');
	$($(".category_name")[0]).siblings("i").css("transform", "rotate(-180deg)");
})
</script>