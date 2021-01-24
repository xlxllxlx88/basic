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
    <title> 경비관리
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
    
    <!-- 7_2_5_1. 달력 검색 (연월) -->
    <style>
		.ui-datepicker-calendar {
		    display: none;
		    }
	</style>
	
	    

    <script type="text/javaScript" language="javascript" defer="defer">
		
 		// 7_2_5. 달력 검색 (연월)
		$(document).ready(function(){
			$('.date-picker').datepicker( {
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,
		        dateFormat: 'yymm',
		        onClose: function(dateText, inst) { 
		            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		            $(this).datepicker('setDate', new Date(year, month, 1));
		        }
		    }); 
		});
		
		
	    // 7_2_2. 검색 function (등록연월일, 사용내역, 처리상태)
	   	function fn_selectCostList() {
	    		location.href = '/costList.do?searchYm=' + $("#searchYm").val()
						      + '&searchDtlCd=' + $("#searchDtlCd").val()
						  	  + '&searchStatusCd=' + $("#searchStatusCd").val(); 	
	    }
	    
	    // 팝업 객체 생성
	    var popup;
	    
	    // 7_3_1. 등록버튼 만들기 (popup)
	    function fn_goCostAdd() {
	    	popup = window.open("/costAddView.do", "popupAdd", "width=750, height=280");
	    }
	
	    // 17. 34. 41. 부모창 재조회
	    function fn_popCallBack(gubun) {
	    	if (gubun == 'add' || gubun == 'del') {
				popup.close();
	    		// list화면으로 (검색 function탐)
	    		fn_selectCostList();
	    	} else if (gubun == 'mod') {
	    		fn_selectCostList();
	    	}
	    }
	    
	    // 19. fn_goCostDtl 상세 팝업 이벤트
	    function fn_goCostDtl(billNum) {
	    	popup = window.open("/costDtlView.do?billNum=" + billNum
					+ "&searchYm=" + $("#searchYm").val()
					+ "&searchDtlCd=" + $("#searchDtlCd").val()
					+ "&searchStatusCd=" + $("#searchStatusCd").val()
			   ,"PopupDtl"
			   ,"width=750, height=650");
	    }
	    
	  	//45. 엑셀다운로드 이벤트
	    function fn_costExcelDown() {
			var excelForm = document.excelForm;
			excelForm.searchYm = $("#searchYm").val();
			excelForm.searchDtlCd = $("#searchDtlCd").val();
			excelForm.searchStatusCd = $("#searchStatusCd").val();
			excelForm.action = 'billExcelDown.do';
			excelForm.submit();
	    }
	  	
	 	// 7_2_4. 검색기능 초기화
	  	function fn_searchInit() {
	  		$("#searchYm").val('');
	  		$("#searchDtlCd").val('');
	  		$("#searchStatusCd").val('');
	  		fn_selectCostList();
	  	}
	
	</script>
</head>
  <body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
  
  	<!-- 45_1. 엑셀다운로드 이벤트 -->
  	<form name="excelForm" id="excelForm">
		<input type="hidden" name="searchYm"/>
		<input type="hidden" name="searchDtlCd"/>
		<input type="hidden" name="searchStatusCd"/>
	</form>

    <form:form commandName="CostVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
          
           <!-- 타이틀 -->
           <div id="title">
              <ul>
                 <li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                  	  경비관리
                 </li>
              </ul>
           </div>
           
           <!-- 검색 -->
           <!-- 7_2. 검색 조건  -->
           <div id="search">
           <ul>
				<li>			
					<span class="btn_blue_l">					 
					<a href="javascript:fn_selectCostList();">검색</a>					
					<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>					
					</span>					
				</li>
				<li>			
					<span class="btn_blue_l">					 
					<a href="javascript:fn_searchInit();">초기화</a>					
					<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>					
					</span>					
				</li>
			</ul>
			<ul>			
			    <li><label for="searchStatusCd">처리상태</label>
			    	<select	name="searchStatusCd" id="searchStatusCd">
			    		<option value="">전체</option>
			    		<option value="J" <c:if test="${searchStatusCd eq 'J'}">selected</c:if> >접수</option>
			    		<option value="S" <c:if test="${searchStatusCd eq 'S'}">selected</c:if> >승인</option>
			    		<option value="O" <c:if test="${searchStatusCd eq 'O'}">selected</c:if> >지급완료</option>
			    		<option value="N" <c:if test="${searchStatusCd eq 'N'}">selected</c:if> >반려</option>
			    	</select>		
				</li>				
		    </ul>
            <ul>
		   		<li><label for="searchDtlCd">사용내역</label>
			    	<!-- name id 잊지말기 -->
			    	<select	name="searchDtlCd" id="searchDtlCd">
			    		<option value="">전체</option>
			    		<!-- c태그로 검색 값 유지 -->
			    		<option value="NB" <c:if test="${searchDtlCd eq 'NB'}">selected</c:if> >식대(야근)</option>
			    		<option value="NT" <c:if test="${searchDtlCd eq 'NT'}">selected</c:if> >택시비(야근)</option>
			    		<option value="HT" <c:if test="${searchDtlCd eq 'HT'}">selected</c:if> >택시비(회식)</option>
			    		<option value="S"  <c:if test="${searchDtlCd eq 'S'}">selected</c:if> >사무용품 구매</option>
			    		<option value="G"  <c:if test="${searchDtlCd eq 'G'}">selected</c:if> >교육비</option>
			    		<option value="J"  <c:if test="${searchDtlCd eq 'J'}">selected</c:if> >접대비</option>
			    	</select>		
				</li>
			</ul>
		   	<ul>
		   		<li><label for="searchYm">등록연월</label>			
					<input type="text" name="searchYm" id="searchYm" maxlength="6" value="${searchYm}" class="date-picker" autocomplete="off"/>
				</li>
			</ul>	
		   	
			  	
           </div>
            <!-- 리스트 -->
           <!-- 7_1. List 만들기 (일단 기능 다 빼고 데이터가 잘 나오는지 확인만 가능한 리스트)-->
           <div id="table">
           	  <!-- 총 건수 -->
              <span>${sumAmt.cnt}건</span>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                 <caption style="visibility:hidden"></caption>
                 <colgroup>
                    <col width="40"/>
                    <col width="100"/>
                    <col width="200"/>
                    <col width="100"/>
                    <col width="100"/>
                    <col width="80"/>
                    <col width="100"/>
                 </colgroup>
                 <tr>
                    <th align="center">순번</th>
                    <th align="center">사용일</th>
                    <th align="center">사용내역</th>
                    <th align="center">사용금액</th>
                    <th align="center">승인금액</th>
                    <th align="center">처리상태</th>
                    <th align="center">등록일</th>
                 </tr>
                 <!-- costList 키, list 값 -->
                 <c:forEach var="list" items="${costList}" varStatus="status">
                     <tr>
                        <td align="center">${list.no}</td>
                        <td align="center">
                        	<!-- <%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt"%> 추가 함 -->
                        	<!-- parseDate는 String형을 Date형을 변경, ${list.useDt} 데이터 형식과  yyyymmdd 동일하게 패턴 입력, -->
                        	<fmt:parseDate  value='${list.useDt}' var='tran_useDt' pattern='yyyymmdd'/>
                        	<!-- formatDate는 지정한 패턴(yyyy-mm-dd)에 맞게 노출 -->
                        	<fmt:formatDate value="${tran_useDt}" pattern="yyyy-mm-dd"/>
                        </td>
                        <!-- 18. 상세 href 연결 -->
                        <td align="center"><a href="javascript:fn_goCostDtl('${list.billNum}');">${list.dtlNm}</a></td>
                        <!--  type이 number면 3자리마다 , 설정-->
                      	<td align="center" style="text-align: right;"><fmt:formatNumber type="number" value="${list.useAmt}" /></td>
                        
	                       	<c:if test="${empty list.apprAmt}">
	                       	<!-- 승인금액이 없을 땐 '-' -->
                        <td align="center">
                        	-
                        </td>
	                       	</c:if>
	                       	<c:if test="${ !empty list.apprAmt}">
	                       	<!-- 승인금액이 있을 땐 데이터 -->
                        <td align="center" style="text-align: right;">
                        	<fmt:formatNumber type="number" value="${list.apprAmt}" />
                        </td>
                        	</c:if>
                        
                        <td align="center">${list.statusNm}</td>
                        <td align="center">${list.regDt}</td>
                     </tr>
                 </c:forEach>
                 <!-- 합계 -->
                 	<tr>
	                    <th>합계</th>
	                    <th></th>
	                    <th></th>
	                    <th style="text-align: right;"><fmt:formatNumber type="number" value="${sumAmt.sumUseAmt}" /></th>
	                    <th style="text-align: right;"><fmt:formatNumber type="number" value="${sumAmt.sumApprAmt}" /></th>
	                    <th></th>
	                    <th></th>
                 	</tr>
              </table>
           </div>
           <!-- /btn --> 
           <div id="sysbtn">
             <ul>
             	 <!-- 7_3. 등록버튼 만들기  (function 부르는 부분)-->
                 <li>
                     <span class="btn_blue_l">
	                     <a href="javascript:fn_goCostAdd();">등록</a>
	                     <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                     </span>
                 </li>
                 <!-- 44. 엑셀다운로드 -->
                 <li>
                     <span class="btn_blue_l">
	                     <a href="javascript:fn_costExcelDown();">엑셀다운로드</a>
	                     <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                     </span>
                 </li>
              </ul>
           </div>
        </div>
    </form:form>
</body>
</html>