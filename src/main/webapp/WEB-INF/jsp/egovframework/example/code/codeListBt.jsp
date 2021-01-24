<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>공통코드관리</title>

  <!-- Custom fonts for this template -->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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

<body id="page-top">

<!-- 검색 -->
<!-- 7_2. 검색 조건  -->
<div class="row">
<div id="search" class="col-12 border">
    <ul>			
     	<label for="searchId" style="visibility:hidden;"></label>
   		<select id="searchId" name="searchId" class="use">
    	   	<option value="groupId" label="그룹ID" />
    	   	<option value="cdId" label="코드ID" />
   		</select>
   		
		<label for="idKeyword" style="visibility:hidden;display:none;"></label>
        	<input type="text" name="idKeyword" id="idKeyword"/>

		<label for="searchNm" style="visibility:hidden;"></label>
    	<select id="searchNm" name="searchNm" class="use">
	   	    <option value="groupNm" label="그룹명" />
	   	    <option value="cdNm" label="코드명" />
    	</select>
		
		<label for="nameKeyword" style="visibility:hidden;display:none;"></label>
              <input type="text" name="nameKeyword" id="nameKeyword"/>
        
		<label for="searchUseYn">사용여부:</label>
		<label for="searchUseYn" style="visibility:hidden;display:none;"></label>			
			<input type="radio" name="searchUseYn" id="searchUseYn_Y" value="Y"/>
			<label for="searchUseYn_Y">사용</label>
			<input type="radio" name="searchUseYn" id="searchUseYn_N" value="N"/>
			<label for="searchUseYn_N">사용안함</label>

		<a href="javascript:fn_selectCodeList();" class="btn btn-light btn-icon-split">
	        <span class="icon text-white-50">
	        	<i class="fas fa-arrow-right"></i>
	        </span>
	        <span class="text">검색</span>
        </a>
        <a href="javascript:fn_searchCdInit();" class="btn btn-secondary btn-icon-split">
	        <span class="icon text-gray-600">
	        	<i class="fas fa-arrow-right"></i>
	        </span>
	        <span class="text">초기화</span>
        </a>
	</ul>
</div>
</div>

<!-- Begin Page Content -->
<div class="container-fluid" style="float: left;margin: 0 0 20px 0;padding: 0 0 0 0;width: 750px;">
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
    <h1 class="h3 mb-2 text-gray-800">코드그룹</h1>
    <!-- /btn --> 
	<div id="sysbtn">
		<a href="javascript:fn_goCodeAddView();" class="btn btn-primary btn-icon-split">
            <span class="icon text-white-50">
               <i class="fas fa-check"></i>
            </span>
            <span class="text">등록</span>
         </a>
        <a href="javascript:fn_codeDelete();" class="btn btn-warning btn-icon-split">
           <span class="icon text-white-50">
               <i class="fas fa-trash"></i>
           </span>
           <span class="text">선택삭제</span>
        </a>
	  </div>
	
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
      </div>
    </div>
  </div>
  


<!-- Page Wrapper TB_2 (ajax)-->
<!-- Begin Page Content -->
<div class="container-fluid" style="float: right;margin: 0 0 20px 0;padding: 0 0 0 0;width: 750px;">
   <!-- DataTales Example -->
   <div class="card shadow mb-4">
   <h1 class="h3 mb-2 text-gray-800">상세코드</h1>
   <!-- /btn --> 
	<div id="sysbtn">
		<a href="javascript:fn_goCodeDtlAddView();" class="btn btn-primary btn-icon-split">
            <span class="icon text-white-50">
               <i class="fas fa-check"></i>
            </span>
            <span class="text">등록</span>
         </a>
        <a href="javascript:fn_codeDtlDelete();" class="btn btn-warning btn-icon-split">
           <span class="icon text-white-50">
               <i class="fas fa-trash"></i>
           </span>
           <span class="text">선택삭제</span>
        </a>
	  </div>
     <div class="card-body">
       <div class="table-responsive">
         <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
       </div>
     </div>
   </div>
 </div>


  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="resources/js/demo/datatables-demo.js"></script>

</body>

</html>
