<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> 설문조사 목록
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javaScript" language="javascript" defer="defer">

   
    /* 검색 버튼 function */
	function fn_selectList() {	
		var searchCondition = $('#searchCondition').val();
		var searchKeyword = $("#searchKeyword").val();
		// searchCondition=' + searchCondition + '&searchKeyword=' + searchKeyword; 조건과 키워드에 맞는 데이터를 부름
		document.location = '/list.do?searchCondition=' + searchCondition + '&searchKeyword=' + searchKeyword;
	} 

   
	/* 상세정보 화면 조회 function */
   

</script>
</head>
  <body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="surveyVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
           <!-- 타이틀 -->
           <div id="title">
              <ul>
                 <li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                                      설문조사 목록
                 </li>
              </ul>
           </div>
           <!-- // search -->
           <!-- 검색 조건 searchCondition은 한글이름, 기술등급으로 정했고   
			        검색 키워드 searchKeyword 입력해서
			        검색 버튼을 누르면  fn_selectList(); 검색 이벤트 실행 -->
       <%--     <div id="search">
           	 <ul>				
				<li><label for="searchCondition" style="visibility:hidden;"></label>			
					<select id="searchCondition" name="searchCondition" class="use">		
						<option value="kname" label="한글이름" />	
						<option value="stat" label="기술등급" />	
					</select>		
				</li>			
				<li><label for="searchKeyword" style="visibility:hidden;display:none;"></label>			
					<input type="text" name="searchKeyword" id="searchKeyword"/>						
				</li>						
				<li>			
					<span class="btn_blue_l">					 
					<a href="javascript:fn_selectList();">검색</a>					
					<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>					
					</span>					
				</li>					
			  </ul>	 				
           </div> --%>
           <!-- List -->
           <div id="table">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                 <caption style="visibility:hidden"></caption>
                 <colgroup>
                    <col width="40"/>
                    <col width="200"/>
                    <col width="200"/>
                    <col width="80"/>
                    <col width="80"/>
                 </colgroup>
                 <tr>
                    <th align="center">No</th>
                    <th align="center">설문명</th>
                    <th align="center">설문기간</th>
                    <th align="center">질문수</th>
                    <th align="center">답변수</th>
                 </tr>
                 
                 <!-- 컨트롤러에서 받아온 리스트를  foreach문으로 만들었고 -->
                 <c:forEach var="list" items="${surveyList}" varStatus="status">
                     <tr>
                       	<!-- 이름 클릭하면 상세 화면으로 이동하도록 goview 펑션사용 -->
                       	<td align="center">${status.count}</td>
                        <td align="center">${list.surveyNm}</td>
                        <td align="center">${list.sed}</td>
                        <td align="center">${list.qqn}</td>
                        <td align="center">${list.rrn}</td>
                     </tr>
                 </c:forEach>
              </table>
           </div>
        </div>
    </form:form>
</body>
</html>