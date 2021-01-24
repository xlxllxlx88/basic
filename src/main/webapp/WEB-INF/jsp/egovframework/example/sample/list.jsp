<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
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
    <title> 사원 조회
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javaScript" language="javascript" defer="defer">

   $(document).ready(function(){
      
   });
   
    /* 검색 버튼 function */
	function fn_selectList() {	
		var searchCondition = $('#searchCondition').val();
		var searchKeyword = $("#searchKeyword").val();
		// searchCondition=' + searchCondition + '&searchKeyword=' + searchKeyword; 조건과 키워드에 맞는 데이터를 부름
		document.location = '/list.do?searchCondition=' + searchCondition + '&searchKeyword=' + searchKeyword;
	} 

    /* 등록 버튼 function */
    function fn_goAdd(){
       alert("등록 버튼")
       // add.jsp로 이동
       location.href = "<c:url value='/add.do'/>" 
    }
   
	/* 상세정보 화면 조회 function */
   function fn_goView(memberno){
	// 사원번호 같이 받아서 get방식으로 /view.do로 이동
       location.href = "<c:url value='/view.do?memberno="+memberno+"'/>";
   }
   
   /* pagination 페이지 링크 function */
   function fn_egov_link_page(pageNo){
	   document.listForm.pageIndex.value = pageNo;
	   document.listForm.action = "<c:url value='/list.do'/>";
	   document.listForm.submit();
   }
   
   /* 전체 체크 이벤트 */
   function fn_allChk(obj){
       var chkObj = document.getElementsByName("chk");
       var rowCnt = chkObj.length - 1;
       var check = obj.checked;
       if (check) { 
           for (var i=0; i<=rowCnt; i++){
            if(chkObj[i].type == "checkbox")
                chkObj[i].checked = true;
           }
       } else {
           for (var i=0; i<=rowCnt; i++) {
           	if(chkObj[i].type == "checkbox"){
                chkObj[i].checked = false;
            }	
           }
       }
   } 

</script>
</head>
  <body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
           <!-- 타이틀 -->
           <div id="title">
              <ul>
                 <li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                                  사원 조회
                 </li>
              </ul>
           </div>
           <!-- // search -->
           <!-- 검색 조건 searchCondition은 한글이름, 기술등급으로 정했고   
			        검색 키워드 searchKeyword 입력해서
			        검색 버튼을 누르면  fn_selectList(); 검색 이벤트 실행 -->
           <div id="search">
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
           </div>
           <!-- List -->
           <div id="table">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                 <caption style="visibility:hidden"></caption>
                 <colgroup>
                    <col width="40"/>
                    <col width="100"/>
                    <col width="150"/>
                    <col width="80"/>
                    <col width="80"/>
                    <col width="80"/>
                    <col width="80"/>
                    <col width="80"/>
                 </colgroup>
                 <tr>
                    <th align="center"><input type="checkbox" name="chkAll" id ="chkAll" onclick="fn_allChk(this);"/></th>
                    <th align="center">이름</th>
                    <th align="center">주민번호</th>
                    <th align="center">성별</th>
                    <th align="center">기술등급</th>
                    <th align="center">상태</th>
                    <th align="center">근무정보 </th>
                 </tr>
                 
                 <!-- 컨트롤러에서 받아온 리스트를  foreach문으로 만들었고 -->
                 <c:forEach var="list" items="${list}" varStatus="status">
                     <tr>
                        <td align="center">
                        	<input type="checkbox" name="chk"  id="chk" value=""/>
                        </td>
                       	<!-- 이름 클릭하면 상세 화면으로 이동하도록 goview 펑션사용 -->
                        <td align="center" onclick="fn_goView('${list.memberno}')" style="cursor:pointer;" >${list.kname}</td>
                        <td align="center">${list.mynumber1}-${list.mynumber2}</td>
                        <td align="center">${list.genderNm}</td>
                        <td align="center">${list.stat}</td>
                        <td align="center">${list.listStat}</td>
                        <td align="center">${list.workYnNm}</td>
                     </tr>
                 </c:forEach>
                 <!-- 리스트가 없을 때 -->
                 <c:if test="${empty list}">
	                 <tr>
	                 	<td colspan="8" >data null</td>   
	                 </tr>
               </c:if>      
              </table>
           </div>
           <!-- /paging --> 
           <div id="paging">
              <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
              <form:hidden path="pageIndex" />
           </div>
           <!-- /btn --> 
           <div id="sysbtn">
             <ul>
                 <li>
	                 <span class="btn_blue_l">
	                     <a href="javascript:fn_delRow();">삭제</a>
	                     <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
	                 </span>
                 </li> 
                  <!-- 등록버튼 클릭하면 fn_goAdd() -->
                 <li>
                     <span class="btn_blue_l">
	                     <a href="javascript:fn_goAdd();">등록</a>
	                     <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                     </span>
                  </li>
              </ul>
           </div>
        </div>
    </form:form>
</body>
</html>