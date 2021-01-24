<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 12. 상세 화면  -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> 코드그룹 등록/수정
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
     <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <script type="text/javaScript" language="javascript" defer="defer">
    
	     $(document).ready(function(){
			if ('${updateYn}' == 'Y') {
				opener.parent.fn_popCallBack('mod');
				alert('저장되었습니다.');
			}
		}); 
	    	
	 	// 21. 수정후 저장 버튼 이벤트 만들기 
	    function fn_modifyCode() {
	    	// 코드그룹ID를 입력하지 않았을 때
	    	if ($("#groupId").val() == '') {
	    		// 오류메세지 출력 후 
	    		alert('코드그룹ID를 입력하세요.');
	    		// 코드그룹ID로 포커스
	    		$("#groupId").focus();
	    		return false;
	    	}
	    	
	    	// 코드그룹명을 입력하지 않았을 때
	    	if ($("#groupNm").val() == '') {
	    		// 오류메세지 출력 후 
	    		alert('코드그룹명을 입력하세요.');
	    		// 코드그룹명으로 포커스
	    		$("#groupNm").focus();
	    		return false;
	    	}
	    	
	    	
	    	// 저장할 데이터 post 방식으로 넘기기
	    	$("#detailForm").prop('action', 'codeModify.do');
	        $("#detailForm").prop('method', 'post');
	        $("#detailForm").submit();
	    }
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<form:form commandName="codeVO"  id="detailForm"  name="detailForm">
    <div id="content_pop">
       <!-- 타이틀 -->
       <div id="title">
          <ul>
             <li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
               	코드그룹 등록/수정
             </li>
          </ul>
       </div>
       <!-- 12_1. 상세정보 -->
       <div id="table">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
          <colgroup>
             <col width="150"/>
             <col width="?"/>
          </colgroup>
          <tr>
             <td class="tbtd_caption"><label for="groupId">코드그룹ID</label></td>
             <td class="tbtd_content">
                <form:input path="groupId" maxlength="10" value="${info.groupId}" readonly="true"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="groupNm">코드그룹명</label></td>
             <td class="tbtd_content">
                <form:input path="groupNm" maxlength="20" value="${info.groupNm}"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="cdNote">설명</label></td>
             <td class="tbtd_content">
                <textarea rows="5" cols="50" id="cdNote" name="cdNote" >${info.cdNote}</textarea>
             </td>
          </tr>
       </table>
      </div>
     
      <!-- 12_1. 상세정보 -->
      <div id="table">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
          <colgroup>
             <col width="150"/>
             <col width="?"/>
          </colgroup>
          <tr>
             <td class="tbtd_caption"><label for="cdRegDt">등록일시</label></td>
             <td class="tbtd_content">${info.cdRegDt}&nbsp;${info.cdRegNm}</td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="cdUpdateDt">수정일시</label></td>
             <td class="tbtd_content">${info.cdUpdateDt}&nbsp;${info.cdUpdateNm}</td>
          </tr>
       </table>
      </div>
      
      <!-- btn -->
      <div id="sysbtn">
        <ul>
            <!-- 수정 후 저장 버튼 -->
            <li>
             <span class="btn_blue_l" id="btnMod">
                 <a href="javascript:fn_modifyCode();">저장</a>
                 <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
             </span>
            </li>
     		<!-- 닫기 버튼  -->
            <li>
             <span class="btn_blue_l">
                 <a href="javascript:self.close();">닫기</a>
                 <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
             </span>
            </li>
         </ul>
      </div>
    </div>
</form:form>
</body>
</html>