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
    
    function fn_modifyCodeDtl() {
    	// 코드ID를 입력하지 않았을 때
    	if ($("#cdId").val() == '') {
    		// 오류메세지 출력 후 
    		alert('코드ID를 입력하세요.');
    		// 코드ID로 포커스
    		$("#cdId").focus();
    		return false;
    	}
    	
    	// 코드명을 입력하지 않았을 때
    	if ($("#cdNm").val() == '') {
    		// 오류메세지 출력 후 
    		alert('코드명을 입력하세요.');
    		// 코드명으로 포커스
    		$("#cdNm").focus();
    		return false;
    	}
    	
    	// 저장할 데이터 post 방식으로 넘기기
    	$("#detailForm").prop('action', 'codeDtlModify.do');
        $("#detailForm").prop('method', 'post');
        $("#detailForm").submit();
    }
   
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<form:form commandName="codeVO"  id="detailForm"  name="detailForm">
   <input type="hidden" id="groupId" name="groupId" value="${dtl.groupId}"/> 
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
             <td class="tbtd_caption"><label for="cdId">코드ID</label></td>
             <td class="tbtd_content">
                <form:input path="cdId" maxlength="10" value="${dtl.cdId}"  readonly="true"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="cdNm">코드명</label></td>
             <td class="tbtd_content">
                <form:input path="cdNm" maxlength="20" value="${dtl.cdNm}"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="reference1">잠조값1</label></td>
             <td class="tbtd_content">
                <form:input path="reference1" maxlength="20" value="${dtl.reference1}"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="reference2">참조값2</label></td>
             <td class="tbtd_content">
                <form:input path="reference2" maxlength="20" value="${dtl.reference2}"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="dtlNote">설명</label></td>
             <td class="tbtd_content">
                <textarea rows="5" cols="50" id="dtlNote" name="dtlNote" >${dtl.dtlNote}</textarea>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="useYn">사용여부</label></td>
             <td class="tbtd_content">
             	<input type="radio" name="useYn" id="useYn" value="Y" <c:if test="${dtl.useYn eq 'Y'}">checked="checked"</c:if>/>&nbsp;사용
             	<input type="radio" name="useYn" id="useYn" value="N" <c:if test="${dtl.useYn eq 'N'}">checked="checked"</c:if>/>&nbsp;사용안함
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
             <td class="tbtd_caption"><label for="dtlRegDt">등록일시</label></td>
             <td class="tbtd_content">${dtl.dtlRegDt}&nbsp;${dtl.dtlRegNm}</td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="dtlUpdateDt">수정일시</label></td>
             <td class="tbtd_content">${dtl.dtlUpdateDt}&nbsp;${dtl.dtlUpdateNm}</td>
          </tr>
       </table>
      </div>
      
      <!-- btn -->
      <div id="sysbtn">
        <ul>
            <!-- 수정 후 저장 버튼 -->
     		<li>
             <span class="btn_blue_l" id="btnMod">
                 <a href="javascript:fn_modifyCodeDtl();">저장</a>
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