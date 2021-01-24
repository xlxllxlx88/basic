<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 7. List jsp 만들기 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> 공통코드관리
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javaScript" language="javascript" defer="defer">
    
		$(document).ready(function(){
			if ('${deleteYn}' == 'Y') {
				opener.parent.fn_popCallBack('del');
				alert('삭제되었습니다.');
			}
		});
		
		function fn_popCallBack(gubun) {
	    	if (gubun == 'add' || gubun == 'del') {
				popup.close();
				fn_selectCodeList();
	    	} else if (gubun == 'mod') {
	    		fn_selectCodeList();
	    	}
	    }
    
		
		// 검색 이벤트
	    function fn_selectCodeList() {
			var searchId = $('#searchId').val();
			var searchNm = $('#searchNm').val();
			var idKeyword = $('#idKeyword').val();
			var nameKeyword = $('#nameKeyword').val();
	    	var searchUseYn = $("[name=searchUseYn]:checked").val()
	    	
			location.href = '/codeList.do?searchId=' + searchId
						  + '&idKeyword='   + idKeyword
					  	  + '&searchNm='    + searchNm
					  	  + '&nameKeyword=' + nameKeyword
					      + '&searchUseYn=' + searchUseYn; 
		}
		
		// 초기화 fn_searchCdInit()
		function fn_searchCdInit() {
			$('#searchId').val('');
			$('#searchNm').val('');
			$('#idKeyword').val('');
			$('#nameKeyword').val('');
	    	$("[name=searchUseYn]:checked").val('')
	    	fn_selectCodeList();
		}
	    
	    var popup;
	    
	    // 상세 팝업
	    function fn_goCodeViewDtl(groupId) {
	    	popup = window.open("/codeView.do?groupId=" + groupId
	    			, "PopupView"
				    , "width=750, height=400");
	    } 
	    
	    // 등록 팝업 
	    function fn_goCodeAddView() {
	    	popup = window.open("/codeAddView.do", "popupAdd", "width=750, height=400");
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
	    
	    // 코드그룹에서 선택했을 때 상세코드로 가져기기 위한 전역변수
	    var selGroupId = '';
	    
	    // 상세코드 목록 (ajax)
	    function fn_getCodeDtl(gId) {
	    	
	    	selGroupId = gId;
	    	/* alert($("[name=searchUseYn]:checked").val() + '사용여부'); */
	    	$.ajax({
	    	   // 호출 url
	            url : '/codeDtlList.do'
	           // hrml 전송 method
	           ,type : 'post'
	           // ajax를 통해 호출한 페이지의 return 형식  : json으로 받음
	           ,dataType : 'json'
	           // 서버로 데이터를 전송 { 키 : 값 }
	           ,data : {groupId     : gId
	        	      , searchUseYn : $("[name=searchUseYn]:checked").val()
	        	      , searchId    : $('#searchId').val()
	        	      , idKeyword   : $('#idKeyword').val()
	        	      , searchNm    : $('#searchNm').val()
	        	      , nameKeyword : $('#nameKeyword').val()
	        	      }
	           // 성공했을 때
	           ,success : function(data) {
	                   
	                   var list = data.codeDtlList;
	                   var dHtml = '';
	                   
	                   for (var i=0; i < list.length; i++) {
	                           var info = list[i];
	                           dHtml += '<tr class="drawTr">';
	                           dHtml += '	<td align="center"><input type="checkbox" name="dtlChk" value="' + info.cdId + '"/></td>';
	                           /* dHtml += '	<td align="center"><input type="checkbox" name="dtlChk" value="' + info.groupId + '/' + info.cdId + '"/></td>';  */
	                           dHtml += '	<td align="center"><a href=\'javascript:fn_goCodeDtlPop("' + info.groupId + '", "' + info.cdId + '");\'>' + info.cdId + '</a></td>';
	                           dHtml += '	<td align="center">' + info.cdNm + '</td>';
	                           dHtml += '	<td align="center">' + info.dtlNote + '</td>';
	                           dHtml += '</tr>';
	                   }
	                   
	                   $(".drawTr").remove();
	                   $("#codeDtlTb").append(dHtml);
	                   
	           }
	           // 실패했을 때
	           ,error : function(request, status, error) {
	                   alert('에러:' + error);
	           }
	   		});
	    }   	
	    
	    // 상세코드 상세팝업 이벤트
	    function fn_goCodeDtlPop(groupId, cdId){
	    	 popup = window.open("/codeDtlView.do?groupId=" + groupId + "&cdId=" + cdId 
	    			, "PopupDtlView"
				    , "width=750, height=600");
	    }
	    
	 // 상세코드 등록 이벤트
	       function fn_goCodeDtlAddView() {
	          alert("/codeDtlAddView.do?groupId=" + selGroupId);

	          if(selGroupId == '') {
	             
	             alert('그룹아이디없음');
	             return false;
	          }
	          popup = window.open("/codeDtlAddView.do?groupId=" + selGroupId, "popupAdd", "width=750, height=600");
	       }
	     
	     // 코드그룹 선택삭제 이벤트
	     function fn_codeDelete() {
	         	 
	    	 var delStr = '';
	    	 $("[name=chk]:checked").each( function(idx, item) {
	    		 
	    		 if (idx == 0) {
	    			 delStr = item.value;
	    		 } else {
	    			 delStr += '|' + item.value;
	    		 }
	    		 
	    	 });
	    	 
	    	 if (delStr == '') {
	    		 alert('삭제할 데이터를 선택해주세요.');
	    		 return false;
	    	 }
	    	 
	    	 /* var cnt = "${cnt.groupId}";
	    	 if (cnt > 0) {
	    		 alert("삭제불가")
	    		 return;
	    	 } */
	    	 
	    	 if (confirm('삭제하시겠습니까?')) {
	    		 location.href = "/codeDelete.do?delStr=" + encodeURI(delStr);
	    	 }
	     }
	     
	     // 상세코드 선택삭제 이벤트
	     function fn_codeDtlDelete() {
	         	 
	    	 var delStr = '';
	    	 $("[name=dtlChk]:checked").each( function(idx, item) {
	    		 
	    		 if (idx == 0) {
	    			 delStr = item.value;
	    		 } else {
	    			 delStr += '|' + item.value;
	    		 }
	    		 
	    	 });
	    	 
	    	 if (delStr == '') {
	    		 alert('삭제할 데이터를 선택해주세요.');
	    		 return false;
	    	 }
	    	 
	    	 if (confirm('삭제하시겠습니까?')) {
	    		 location.href = "/codeDtlDelete.do?delStr=" + encodeURI(delStr);
	    	 }
	     }
    </script>
</head>
  <body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="CodeVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
          
           <!-- 타이틀 -->
           <div id="title">
              <ul>
                 <li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                  	 코드그룹
                 </li>
              </ul>
           </div>
           
           <!-- 검색 -->
           <!-- 7_2. 검색 조건  -->
           <div id="search">
           <ul>
           		<li>			
					<span class="btn_blue_l">					 
					<a href="javascript:fn_searchCdInit();">초기화</a>					
					<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>					
					</span>					
				</li>
				<li>			
					<span class="btn_blue_l">					 
					<a href="javascript:fn_selectCodeList();">검색</a>					
					<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>					
					</span>					
				</li>
		   </ul>
           <ul>			
		       <li>
			       <label for="searchId" style="visibility:hidden;"></label>
                   <select id="searchId" name="searchId" class="use">
                   	   <option value="groupId" label="그룹ID" />
                   	   <option value="cdId" label="코드ID" />
                   </select>
               </li>	
               <li><label for="idKeyword" style="visibility:hidden;display:none;"></label>
                   <input type="text" name="idKeyword" id="idKeyword"/>
               </li>
               <li>
			       <label for="searchNm" style="visibility:hidden;"></label>
                   <select id="searchNm" name="searchNm" class="use">
                   	   <option value="groupNm" label="그룹명" />
                   	   <option value="cdNm" label="코드명" />
                   </select>
               </li>
               <li><label for="nameKeyword" style="visibility:hidden;display:none;"></label>
                   <input type="text" name="nameKeyword" id="nameKeyword"/>
               </li>		
			   <li>
					<label for="searchUseYn">사용여부:</label>
					<label for="searchUseYn" style="visibility:hidden;display:none;"></label>			
					<input type="radio" name="searchUseYn" id="searchUseYn_Y" value="Y"/>
					<label for="searchUseYn_Y">사용</label>
					<input type="radio" name="searchUseYn" id="searchUseYn_N" value="N"/>
					<label for="searchUseYn_N">사용안함</label>
				</li>
		    </ul>
			
			  	
           </div>
           <!-- 7_1. List 만들기 -->
           <div id="table">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                 <caption style="visibility:hidden"></caption>
                 <colgroup>
                    <col width="40"/>
                    <col width="100"/>
                    <col width="100"/>
                    <col width="200"/>
                 </colgroup>
                 <tr>
                    <th align="center"><input type="checkbox" name="chkAll" id ="chkAll" onclick="fn_allChk(this);"/></th>
                    <th align="center">코드그룹ID</th>
                    <th align="center">코드그룹명</th>
                    <th align="center">설명</th>
                 </tr>
                 <!-- codeList 키, list 값 -->
                 <c:forEach var="list" items="${codeList}" varStatus="status">
                     <tr onclick="fn_getCodeDtl('${list.groupId}');">
                        <td align="center"><input type="checkbox" name="chk" value="${list.groupId}"/></td>
                        <td align="center"><a href="javascript:fn_goCodeViewDtl('${list.groupId}');">${list.groupId}</a></td>
                        <td align="center">${list.groupNm}</td>
                        <td align="center">${list.cdNote}</td>
                     </tr>
                 </c:forEach>
              </table>
           </div>
           <!-- /btn --> 
           <div id="sysbtn">
             <ul>
             	 <!-- 14. 등록버튼 만들기  (function 부르는 부분)-->
                 <li>
                     <span class="btn_blue_l">
	                     <a href="javascript:fn_goCodeAddView();">등록</a>
	                     <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                     </span>
                 </li>
                 <li>
	                 <span class="btn_blue_l">
	                     <a href="javascript:fn_codeDelete();">선택삭제</a>
	                     <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
	                 </span>
                 </li> 
              </ul>
           </div>
        </div>
        <!-- 상세코드 목록 (ajax) -->
        <div id="table2" style="float: left;margin: 0 0 10px 0;padding: 0 0 0 0;width: 680px;">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 80px;" id="codeDtlTb">
                 <caption style="visibility:hidden"></caption>
                 <colgroup>
                    <col width="40"/>
                    <col width="100"/>
                    <col width="100"/>
                    <col width="200"/>
                 </colgroup>
                 <tr>
                    <th align="center"><input type="checkbox" name="dtlChk" id ="dtlChk" onclick="fn_allChk(this);"/></th>
                    <th align="center">코드ID</th>
                    <th align="center">코드명</th>
                    <th align="center">설명</th>
                 </tr>
              </table>
              <!-- /btn --> 
	           <div id="sysbtn">
	             <ul>
	             	 <!-- 14. 등록버튼 만들기  (function 부르는 부분)-->
	                 <li>
	                     <span class="btn_blue_l">
		                     <a href="javascript:fn_goCodeDtlAddView();">등록</a>
		                     <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
	                     </span>
	                 </li>
	                 <li>
		                 <span class="btn_blue_l">
		                     <a href="javascript:fn_codeDtlDelete();">선택삭제</a>
		                     <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
		                 </span>
	                 </li> 
	              </ul>
	           </div>
           </div>
    </form:form>
</body>
</html>