<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hi</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javaScript" language="javascript">
		function AjaxEx(){
		 
		var name = "name="+document.check.name.value;
		 
		$.ajax({
			  url : "/check.do"
		 	, type : "post"
		    , data : name
		    , dataType : "json"
		    , success : function(data) {
		 		document.getElementById("result").innerHTML = data+"님 반갑습니다.";
		 	  }
		 	, error : function(request) {
				alert("실패");
		 	  }
		});
		 
		 }
		 
	</script>
</head>
<body>
	<form action="" name="check" method="post">
		<input type="text" id="name">
		<input type="button" value="클릭" onclick="AjaxEx()">
		<div id="result"></div>
	</form>
</body>
</html>