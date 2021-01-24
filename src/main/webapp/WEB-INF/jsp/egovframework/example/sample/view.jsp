<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleRegister.jsp
  * @Description : Sample Register 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> 사원 상세정보
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
     <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="sampleVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
    <script type="text/javaScript" language="javascript" defer="defer">
  
    	/* 사원 정보 수정 function */
	  	function fn_egov_update(){
	  		alert($("#memberno").val() + "update");
	  		// detailForm : input 들을 감싸고 있는 <form></form> 의 id
	  		// updateSample.do 호출  // form 안에 있는 name들과 값이 form의 action으로 전송
	  		$("#detailForm").prop('action','updateSample.do');
	  		// form으로 전송할 경우에는 대부분 post로 전송
	  		$("#detailForm").prop('method','post');
	  		$("#detailForm").submit();
	  	}
	
		/* 사원 정보 삭제 function */
	  	function fn_egov_del() {
	  		alert($("#memberno").val() + "del"); 
	  		var memberno = $("#memberno").val(); 
	  		// deleteSample.do 호출
	  		$("#detailForm").prop('action','deleteSample.do');
	  		$("#detailForm").prop('method','post');
	  		$("#detailForm").submit(); 
	  	}

    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="sampleVO"  id="detailForm"  name="detailForm" enctype="multipart/form-data">
   <input type="hidden" id="memberno" name="memberno" value="${info.memberno}"/>
    <div id="content_pop">
       <!-- 타이틀 -->
       <div id="title">
          <ul>
             <li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                  사원 상세정보
                </li>
          </ul>
       </div>
       <!-- // 상세정보 -->
       <div id="table">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
          <colgroup>
             <col width="150"/>
             <col width="?"/>
          </colgroup>
          <tr>
             <td class="tbtd_caption"><label for="kname">한글 이름</label></td>
             <td class="tbtd_content">
                <form:input path="kname" maxlength="10" value="${info.kname}" /><!-- readonly="true" cssClass="essentiality" -->
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="ename">영문 이름</label></td>
             <td class="tbtd_content">
                <form:input path="ename" maxlength="30" cssClass="txt" value="${info.ename}"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="jname">한문 이름</label></td>
             <td class="tbtd_content">
                <form:input path="jname" maxlength="30" cssClass="txt" value="${info.jname}"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="mynumber">주민등록번호</label></td>
             <td class="tbtd_content">
                <form:input path="mynumber1" maxlength="30" cssClass="txt" value="${info.mynumber1}"/>&nbsp;-&nbsp;
                <form:input path="mynumber2" maxlength="30" cssClass="txt" value="${info.mynumber2}"/>
             </td>
          </tr>
          <!-- 사진이 있을 때 보여줌 -->
          <c:if test="${not empty info.filename}">
          <tr>
                <td class="tbtd_caption"><label>사진</label></td>
                <td class="tbtd_content">
                   <img src="/img/${info.filename}" alt="파일이미지" style="width: 200px;" />
                </td>
          </tr>
          </c:if>
          <tr>
                <td class="tbtd_caption"><label for="uploadFile">파일첨부</label></td>
                <td class="tbtd_content">
                   <input multiple="multiple" type="file" id="uploadFile" name="uploadFile" />
                </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="year">생년월일</label></td>
             <td class="tbtd_content">
                <form:input path="year" maxlength="30" cssClass="txt" value="${info.year}" style="width:60px"/>년&nbsp;
                <form:input path="month" maxlength="30" cssClass="txt" value="${info.month}" style="width:60px"/>월&nbsp;
                <form:input path="day" maxlength="30" cssClass="txt" value="${info.day}" style="width:60px"/>일&nbsp;
               (<input type="radio" name="calendar" id="calendar" value="1" <c:if test="${info.calendar eq '1'}">checked="checked"</c:if>/>&nbsp;양력
                <input type="radio" name="calendar" id="calendar" value="2" <c:if test="${info.calendar eq '2'}">checked="checked"</c:if>/>&nbsp;음력)
             </td>
          </tr>
            <tr>
             <td class="tbtd_caption"><label for="gender">성별</label></td>
             <td class="tbtd_content">
             	<input type="radio" name="gender" id="gender" value="1" <c:if test="${info.gender eq '1'}">checked="checked"</c:if>/>&nbsp;남자
             	<input type="radio" name="gender" id="gender" value="2" <c:if test="${info.gender eq '2'}">checked="checked"</c:if>/>&nbsp;여자
             </td>
          </tr>
            <tr>
             <td class="tbtd_caption"><label for="wedding">결혼유무</label></td>
             <td class="tbtd_content">
 				<input type="radio" name="wedding" id="wedding" value="1" <c:if test="${info.wedding eq '1'}">checked="checked"</c:if>/>&nbsp;기혼
				<input type="radio" name="wedding" id="wedding" value="2" <c:if test="${info.wedding eq '2'}">checked="checked"</c:if>/>&nbsp;미혼             
             </td>
          </tr>
           <tr>
             <td class="tbtd_caption"><label for=career>년차</label></td>
             <td class="tbtd_content">
                <form:input path="career" maxlength="30" cssClass="txt" value="${info.career}" />
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="moneyType">급여 지급 유형 </label></td>
             <td class="tbtd_content">
                 <select>
                   <option value="주급" label="주급" <c:if test="${info.moneyType eq '주급'}">selected</c:if>/> 
                   <option value="월급" label="월급" <c:if test="${info.moneyType eq '월급'}">selected</c:if>/> 
                </select>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="workingType">희망직무</label></td>
             <td class="tbtd_content">
                 <select>
                   <option value="SI" label="SI" <c:if test="${info.workingType eq 'SI'}">selected</c:if>/> 
                   <option value="SM" label="SM" <c:if test="${info.workingType eq 'SM'}">selected</c:if>/> 
                </select>
             </td>
          </tr>
           <tr>
             <td class="tbtd_caption"><label for="welcome">입사유형</label></td>
             <td class="tbtd_content">
                 <select>
                   <option value="정규직" label="정규직" <c:if test="${info.welcome eq '정규직'}">selected</c:if>/> 
                   <option value="비정규직" label="비정규직" <c:if test="${info.welcome eq '비정규직'}">selected</c:if>/> 
                </select>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="address">주소 </label></td>
             <td class="tbtd_content">
                <form:input path="address" maxlength="30" cssClass="txt" value="${info.address}" style="width:100px"/>&nbsp;&nbsp;
                <form:input path="detailAddress" maxlength="30" cssClass="txt" value="${info.detailAddress}" style="width:180px"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for=" phoneNumber">연락처 </label></td>
             <td class="tbtd_content">
                <form:input path="phoneNumber1" maxlength="30" cssClass="txt" value="${info.phoneNumber1}" style="width:60px"/>&nbsp;- &nbsp;
                <form:input path="phoneNumber2" maxlength="30" cssClass="txt" value="${info.phoneNumber2}" style="width:60px"/>&nbsp;-&nbsp;
                <form:input path="phoneNumber3" maxlength="30" cssClass="txt" value="${info.phoneNumber3}" style="width:60px"/>&nbsp;
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="email">이메일 </label></td>
             <td class="tbtd_content">
                <form:input path="email" maxlength="30" cssClass="txt" value="${info.email}" style="width:350px"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="stat">기술등급 </label></td>
             <td class="tbtd_content">
                <form:input path="stat" maxlength="30" cssClass="txt" value="${info.stat}" style="width:100px"/>
             </td>
          </tr>
          <tr>
             <td class="tbtd_caption"><label for="alchol">주량 </label></td>
             <td class="tbtd_content">
                <form:input path="alchol" maxlength="30" cssClass="txt" value="${info.alchol}" style="width:130px"/>
             </td>
          </tr>
       </table>
      </div>
      <!-- btn -->
      <div id="sysbtn">
         <ul>
         	 <!-- 리스트화면으로 이동할 수 있게 링크 -->
            <li>
             <span class="btn_blue_l">
                 <a href="/list.do">목록</a>
                 <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
             </span>
            </li>
            <!-- 수정버튼 클릭하면 fn_egov_update() -->
            <li>
             <span class="btn_blue_l">
                 <a href="javascript:fn_egov_update();">수정</a>
                 <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
             </span>
            </li>
            <li>
            <!-- 삭제버튼 클릭하면 fn_egov_del() -->
             <span class="btn_blue_l">
                 <a href="javascript:fn_egov_del();">삭제</a>
                 <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
             </span>
            </li>
           </ul>
      </div>
    </div>
</form:form>
</body>
</html>