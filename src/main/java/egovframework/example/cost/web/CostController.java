/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.cost.web;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cost.service.CostService;
import egovframework.example.cost.service.CostVO;

@Controller
public class CostController {

	// 2. controller 만들기
	
	// Controller는 넘어온 요청을 처리하기 위해 Service를 선언
	/** EgovSampleService */
	@Resource(name = "costService")
	private CostService costService;
	
	/** 경비관리 리스트 */
	// 2_2. 리스트 메서드 만들기
	// "/costList.do" 입력받으면 getCostList 메서드를 찾음 
	@RequestMapping(value = "/costList.do")
	public String getCostList(@ModelAttribute("costVO") CostVO costVO, ModelMap model) throws Exception {
		System.out.println("------------CostController/getCostList");
		System.out.println("------------costVO="+costVO.toString());
		
		// 경비관리 리스트 service 호출(파라미터는 costVO) 
		List<CostVO> list = costService.getCostList(costVO);
		// 데이터는 모델에 담음
		model.addAttribute("costList", list);
		
		// 합계
		Object sumAmt = costService.sumAmt(costVO);
		model.addAttribute("sumAmt", sumAmt);
		
	
		// 7_2_3. 검색조건 유지
		model.addAttribute("searchYm", costVO.getSearchYm());
		model.addAttribute("searchDtlCd", costVO.getSearchDtlCd());
		model.addAttribute("searchStatusCd", costVO.getSearchStatusCd());
		
		// list 호출
		return "cost/costList";
	}
	
	
	/** 등록화면 이동 */
	// 8. 등록 메서드 만들기
	// "/costAddView.do" 입력받으면 goCostAdd 메서드를 찾음 (등록화면만 보여줌)
	@RequestMapping(value = "/costAddView.do")
	public String goCostAdd(@ModelAttribute("costVO") CostVO costVO, String insertYn, ModelMap model) throws Exception {
		
		/*15_2 저장 후처리 받는곳*/
		model.addAttribute("insertYn", insertYn);
		
		// costAdd - 저장 호출
		return "cost/costAdd";
	}
	
	
	/*10. 저장 메서드 만들기*/
	/** 경비 등록 */
	// "/costAdd.do" 입력받으면 billAdd 메서드를 찾음
	@RequestMapping(value = "/costAdd.do")
	//jsp에서 보낸 파라미터 받음 @ModelAttribute("costVO") CostVO costVO,
	public String costAdd(@ModelAttribute("costVO") CostVO costVO) throws Exception {
		
		System.out.println("------------CostController/costAdd");
		System.out.println("------------CostVO=" + costVO.toString());
		
		// 사용자 목록 조회하는 service 호출 (파라미터는  CostVO), 리턴 없음
		costService.costAdd(costVO);
		
		/*15_1. 저장 후처리 보내는곳 */
		// insertYn=Y일때 값을 안가지고 /CostAddView.do로 url만 보냄
		return "redirect:/costAddView.do?insertYn=Y";
	}
	
	
	/* 20. 상세팝업 이동하는 메서드*/
	/** 상세수정 화면 이동 */
	// "/costDtlView.do" 입력받으면 getCostDtl 메서드를 찾음 
	@RequestMapping(value = "/costDtlView.do")
	public String getCostDtl(@ModelAttribute("costVO") CostVO costVO, String updateYn, String deleteYn, ModelMap model) throws Exception {
		
		System.out.println("------------CostController/goCostDtl");
		System.out.println("------------costVO=" + costVO.toString());
		System.out.println("------------updateYn=" + updateYn);
		System.out.println("------------deleteYn=" + deleteYn);
		
		Object info = costService.getCostDtl(costVO);
		model.addAttribute("costInfo", info);
		
		/*33. 저장, 삭제 후처리 받는곳 */
		model.addAttribute("updateYn", updateYn);
		model.addAttribute("deleteYn", deleteYn);
		model.addAttribute("searchYm", costVO.getSearchYm());
		model.addAttribute("searchDtlCd", costVO.getSearchDtlCd());
		model.addAttribute("searchStatusCd", costVO.getSearchStatusCd());
		
		return "cost/costDtl";
	}
	
	
	/* 27. 수정 메서드*/
	@RequestMapping(value = "/costModify.do")
	public String costModify(@ModelAttribute("costVO") CostVO costVO) throws Exception {
		
		System.out.println("------------CostController/costModify");
		System.out.println("------------costVO=" + costVO.toString());
		
		costService.costModify(costVO);
		/*32. 저장 후처리 보내는곳 */
		return "redirect:/costDtlView.do?billNum=" + costVO.getBillNum() + "&updateYn=Y";
	}


	/* 36. 삭제 메서드*/
	@RequestMapping(value = "/costRemove.do")
	public String costRemove(@ModelAttribute("costVO") CostVO costVO) throws Exception {
		
		System.out.println("------------CostController/costRemove");
		System.out.println("------------costVO=" + costVO.toString());
		
		costService.costRemove(costVO);
		
		return "redirect:/costDtlView.do?deleteYn=Y";
	}
	
	
	//43. 엑셀다운로드 컨트롤러
	@RequestMapping(value = "/costExcelDown.do")
	public void costExcelDown(@ModelAttribute("costVO") CostVO costVO, HttpServletResponse response) throws Exception {
		
		OutputStream out = null;
        
		// 엑셀 파일 저장
        try {
            HSSFWorkbook workbook = CostExcelDownload(costVO);
            
            Date today = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmm");
            System.out.println("--------------------" + format.format(today));
            response.reset();
            response.setHeader("Content-Disposition", "attachment;filename=bill_" + format.format(today) + ".xls");
            response.setContentType("application/vnd.ms-excel");
            out = new BufferedOutputStream(response.getOutputStream());
            
            workbook.write(out);
            out.flush();
            
        } catch (Exception e) {
        	System.out.println("exception during downloading excel file");
        	e.printStackTrace();
        } finally {
            if(out != null) out.close();
        }    
		
	}
		
	
	//42. 엑셀다운로드 객체 생성
	public HSSFWorkbook CostExcelDownload(CostVO costVO) throws Exception {
	    
		// workbook 생성
		HSSFWorkbook workbook = new HSSFWorkbook();
	        
		// sheet 생성
	    HSSFSheet sheet = workbook.createSheet("엑셀시트명");
	        
	    // 엑셀 행
	    HSSFRow row = null;
	        
	    // 엑셀 셀
	    HSSFCell cell = null;
	        
	    // 리스트 추출
	    List<CostVO> list = costService.getCostList(costVO);
	        
	    // 헤더 생성
	    row = sheet.createRow(0);
	    String[] headerKey = {"순번", "사용일", "사용내역", "사용금액", "승인금액", "처리상태", "등록일"};
	        
	    for(int i=0; i<headerKey.length; i++) {
	    	cell = row.createCell(i);
	        cell.setCellValue(headerKey[i]);
	    }
	        
	    for(int i=0; i<list.size(); i++) {
	    	row = sheet.createRow(i + 1);
	        Map<String, Object> vo = (Map<String, Object>)list.get(i);
	        // 순번
	        cell = row.createCell(0);
	        cell.setCellValue(String.valueOf(vo.get("no")));
	            
	        // 사용일
	        cell = row.createCell(1);
	        cell.setCellValue((String)vo.get("useDt"));
	            
	        // 사용내역
	        cell = row.createCell(2);
	        cell.setCellValue((String)vo.get("dtlNm"));
	            
	        // 사용금액
	        cell = row.createCell(3);
	        cell.setCellValue(String.valueOf(vo.get("useAmt")));
	            
	        // 승인금액
	        cell = row.createCell(4);
	        cell.setCellValue(String.valueOf(vo.get("apprAmt")));
	            
	        // 처리상태
	        cell = row.createCell(5);
	        cell.setCellValue((String)vo.get("statusNm"));
	            
	        // 등록일
	        cell = row.createCell(6);
	        cell.setCellValue((String)vo.get("regDt"));
	 
	    }
	        
	    return workbook;
	}
		
}