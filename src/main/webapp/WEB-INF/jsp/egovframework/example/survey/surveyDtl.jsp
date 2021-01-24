<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 25. 상세 화면 (수정 가능)  -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> 설문조사
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
     <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    
    <script type="text/javaScript" language="javascript" defer="defer">
    
	   
	    
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="surveyVO"  id="detailForm"  name="detailForm" enctype="multipart/form-data">
    <input type="hidden" id="surveyNo" name="surveyNo" value="${dtl.surveyNo}"/>
    <div id="content_pop">
       <!-- 타이틀 -->
       <div id="title">
          <ul>
             <li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
               ${dtl.surveyNm}
                </li>
          </ul>
       </div>
       <!-- // 상세정보 -->
       <div id="table">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
             
           <c:forEach var="dtl" items="${surveyDtl}" varStatus="status">
                <c:if test="${dtl.gubun eq 'A_QST' and dtl.qstType eq 'T'}">
             		<tr>
             			<td class="tbtd_caption" style="text-align:left;">${dtl.qstSeq}. ${dtl.cont}</td>
             		</tr>
             		<tr>
						<td class="tbtd_content">
                			<form:input path="rspCont" value="${dtl.rspCont}" />
             			</td>             		
             		</tr>
                </c:if>
                <c:if test="${dtl.gubun eq 'A_QST' and dtl.qstType eq 'TA'}">
             		<tr>
             			<td class="tbtd_caption" style="text-align:left;">${dtl.qstSeq}. ${dtl.cont}</td>
             		</tr>
             		<tr>
						<td class="tbtd_content">
                			<form:input path="rspCont" value="${dtl.rspCont}" />
             			</td>             		
             		</tr>
                </c:if>
                <c:if test="${dtl.gubun eq 'A_QST' and dtl.qstType eq 'R'}">
             		<tr>
             			<td class="tbtd_caption" style="text-align:left;">${dtl.qstSeq}. ${dtl.cont}</td>
             		</tr>
             		<tr>
						<td class="tbtd_content">
			 				<input type="radio" name="rspSelNo" id="rspSelNo" value="1" <c:if test="${dtl.rspSelNo eq '1'}">checked="checked"</c:if>/>&nbsp;여자
							<input type="radio" name="rspSelNo" id="rspSelNo" value="2" <c:if test="${dtl.rspSelNo eq '2'}">checked="checked"</c:if>/>&nbsp;남자
			            </td>            		
             		</tr>
                </c:if>
                <c:if test="${dtl.gubun eq 'A_QST' and dtl.qstType eq 'S'}">
             		<tr>
             			<td class="tbtd_caption" style="text-align:left;">${dtl.qstSeq}. ${dtl.cont}</td>
             		</tr>
             		<tr class="tbtd_content">
                 		<select name="expCont" id="expCont">
                 			<option value=""   <c:if test="${dtl.expCont eq ''}"> selected</c:if> >선택</option>
		                 	<option value="1"  <c:if test="${dtl.expCont eq '1'}">selected</c:if> >서울</option>
		                 	<option value="5"  <c:if test="${dtl.expCont eq '5'}">selected</c:if> >경상도</option>
		                 	<option value="6"  <c:if test="${dtl.expCont eq '6'}">selected</c:if> >전라도</option>
		                 	<option value="2"  <c:if test="${dtl.expCont eq '2'}">selected</c:if> >경기도</option>
		                 	<option value="3"  <c:if test="${dtl.expCont eq '3'}">selected</c:if> >충청도</option>
		                 	<option value="4"  <c:if test="${dtl.expCont eq '4'}">selected</c:if> >강원도</option>
		                 	<option value="0"  <c:if test="${dtl.expCont eq '0'}">selected</c:if> >해외</option>
		                </select>
             		</tr>
                </c:if>
                <c:if test="${dtl.gubun eq 'A_QST' and dtl.qstType eq 'C'}">
             		<tr>
             			<td class="tbtd_caption" style="text-align:left;">${dtl.qstSeq}. ${dtl.cont}</td>
             		</tr>
             		<tr>
						<td class="tbtd_content">
			 				<input type="checkbox" name="expCont" value="1">Java</input>
							<input type="checkbox" name="expCont" value="2">Jsp</input>
							<input type="checkbox" name="expCont" value="3">DB</input>
							<input type="checkbox" name="expCont" value="4">Javascript</input>
			            </td>           		
             		</tr>
                </c:if>
                <c:if test="${dtl.gubun eq 'A_QST' and dtl.qstType eq 'MC'}">
             		<tr>
             			<td class="tbtd_caption" style="text-align:left;">${dtl.qstSeq}. ${dtl.cont}</td>
             		</tr>
             		<tr>
						<td class="tbtd_content">
			 				<input type="checkbox" name="expCont" value="1">보기1</input>
							<input type="checkbox" name="expCont" value="2">보기2</input>
							<input type="checkbox" name="expCont" value="3">보기3</input>
							<input type="checkbox" name="expCont" value="4">보기4</input>
							<input type="checkbox" name="expCont" value="4">보기5</input>
							<input type="checkbox" name="expCont" value="4">보기6</input>
			            </td>           		
             		</tr>
                </c:if>
           </c:forEach>

           <%-- <c:forEach var="dtl" items="${surveyDtl}" varStatus="status">
              if (dtl.gubun == A_QST) {
                  if (dtl.qstType == 'T') {
                      <tr>
             		      <td class="tbtd_caption" style="text-align:left;">${dtl.qstSeq}. ${dtl.cont}</td>
             		  </tr>
             		  <tr>
						  <td class="tbtd_content">
                		      <form:input path="rspCont" value="${dtl.rspCont}" />
             			  </td>             		
             		  </tr>
                  } 
              } else if (dtl.gubun != A_QST) {
           </c:forEach> --%>
             
       </table>
      </div>
      <!-- btn -->
      <div id="sysbtn">
         <ul>
           	<!-- 25_1. 저장 삭제 닫기 버튼 만들기 -->
            <li>
             <span class="btn_blue_l" id="btnMod">
                 <a href="javascript:fn_modifyCost();">완료</a>
                 <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
             </span>
            </li>
            <!-- 닫기버튼  -->
            <li>
             <span class="btn_blue_l">
                 <a href="javascript:self.close();">목록</a>
                 <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
             </span>
            </li>
           </ul>
      </div>
    </div>
</form:form>
</body>
</html>