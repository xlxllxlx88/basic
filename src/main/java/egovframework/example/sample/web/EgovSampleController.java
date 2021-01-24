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
package egovframework.example.sample.web;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.EgovSampleService;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class EgovSampleController {

//	/** EgovSampleService */
//	//Controller는 넘어온 요청을 처리하기 위해 Service를 호출
//	@Resource(name = "sampleService")
//	private EgovSampleService sampleService;
//
//	/** EgovPropertyService */
//	@Resource(name = "propertiesService")
//	protected EgovPropertyService propertiesService;
//
//	/** Validator */
//	@Resource(name = "beanValidator")
//	protected DefaultBeanValidator beanValidator;
//
//	/**
//	 * 글 목록을 조회한다. (pageing)
//	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
//	 * @param model
//	 * @return "egovSampleList"
//	 * @exception Exception
//	 */
//	// @RequestMapping : controller가 처리할 요청 url 명시
//	// "/list.do" 입력받으면  selectSampleList 메서드 찾고
//	@RequestMapping(value = "/list.do")
//	//jsp에서 보낸 파라미터 받고 @ModelAttribute("searchVO") SampleVO vo,
//	public String selectSampleList(@ModelAttribute("searchVO") SampleVO vo, ModelMap model) throws Exception {
//			
//		// 페이징은 eGov공통 사용		
//		/** EgovPropertyService.sample */
//		vo.setPageUnit(propertiesService.getInt("pageUnit"));
//		vo.setPageSize(propertiesService.getInt("pageSize"));
//
//		/** pageing setting */
//		PaginationInfo paginationInfo = new PaginationInfo();
//		// paginationInfo.에 현재페이지 넣어준다
//		paginationInfo.setCurrentPageNo(vo.getPageIndex());
//		// paginationInfo.에 게시물 건수 넣어준다  <entry key="pageUnit" value="10"/>
//		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
//		// paginationInfo.에 페이지 갯수 넣어준다  <entry key="pageSize" value="10"/>
//		paginationInfo.setPageSize(vo.getPageSize());
//
//		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
//		vo.setLastIndex(paginationInfo.getLastRecordIndex());
//		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
//		
//		// 사용자 목록 조회하는 service 호출 (파라미터는 vo)
//		List<SampleVO> list = sampleService.selectSampleList(vo);
//		// 데이터는 모델에 담고
//		model.addAttribute("list", list);
//		
//		// 페이징 카운트 서비스 호출
//		int listCnt = sampleService.selectSampleListCnt(vo);
//		// TotalRecordCount 받고
//		paginationInfo.setTotalRecordCount(listCnt);
//		// 모델에 담아서
//		model.addAttribute("paginationInfo", paginationInfo);
//		
//		// list 호출
//		return "sample/list";
//	}
//	
//	
//	/**
//	 * 사원 상세 조회
//	 * @param sampleVO - 조회할 정보가 담긴 VO
//	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
//	 * @return "view"
//	 * @exception Exception
//	 */
//	// "/view.do" 입력받으면  selectSampleView 메서드 찾고
//	@RequestMapping(value="/view.do")
//	public String selectSampleView(@ModelAttribute("sampleVO") SampleVO sampleVO, ModelMap model) throws Exception {
//		System.out.println("-------------EgovSampleController/selectSampleview");
//		System.out.println("--------------sampleVO" + sampleVO.toString());
//		
//		// 사용자 상세화면 조회하는 service 호출	
//		SampleVO info = sampleService.selectSampleView(sampleVO);
//		model.addAttribute("info", info);
//
//		return "sample/view";
//	}
//	
//	
//	// 등록화면만 보여줌
//	// "/add.do" 입력받으면  SampleAdd 메서드 찾고
//	@RequestMapping(value="/add.do")
//	public String SampleAdd(@ModelAttribute("searchVO") SampleDefaultVO searchVO, SampleVO sampleVO, ModelMap model) throws Exception {
//		System.out.println("-----------EgovSampleController/add.do");
//
//		return "sample/add";
//	}
//		
//	
//	/**
//	 * 글을 등록한다.
//	 * @param sampleVO - 등록할 정보가 담긴 VO
//	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
//	 * @param status
//	 * @return "forward:/egovSampleList.do"
//	 * @exception Exception
//	 */
//	// "/addSample.do" 입력받으면  selectSampleAdd메서드 찾고
//	@RequestMapping(value = "/addSample.do", method = RequestMethod.POST)
//	public String selectSampleAdd(@ModelAttribute("searchVO") SampleDefaultVO searchVO, SampleVO sampleVO, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
//
//		// 사용자 정보 등록하는 service 호출		
//		sampleService.selectSampleAdd(sampleVO);
//		status.setComplete();
//		
//		// 등록하고 나서 값을 안가지고 /list.do로 url만 보냄
//		// 등록 후에는 다시 상세창으로 전송
//		return "redirect:/list.do"; 
//	}
//
//	
//	/**
//	 * 글을 수정한다.
//	 * @param sampleVO - 수정할 정보가 담긴 VO
//	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
//	 * @param status
//	 * @return "forward:/egovSampleList.do"
//	 * @exception Exception
//	 */
//	@RequestMapping("/updateSample.do")
//	public String updateSample(@ModelAttribute("searchVO") SampleVO sampleVO, Model model) throws Exception {
//		System.out.println("-------uspdateSample");
//		
//		// 사용자 정보 수정하는 service 호출
//		// 수정하는 service 메서드는 return값이 없음 
//		sampleService.updateSample(sampleVO);
//
//		//  수정 후에는 다시 상세창으로 전송 /list.do로 url만 보냄
//		//
//		return "redirect:/list.do";
//	}
//	
//
//	/**
//	 * 글을 삭제한다.
//	 * @param sampleVO - 삭제할 정보가 담긴 VO
//	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
//	 * @param status
//	 * @return "forward:/egovSampleList.do"
//	 * @exception Exception
//	 *//**/
//	@RequestMapping("/deleteSample.do")
//	public String deleteSample(@ModelAttribute("sampleVO") SampleVO sampleVO, Model model) throws Exception {
//		System.out.println("delete ####dddd");
//		
//		// 사용자 정보 삭제하는 service 호출
//		// 삭제는 service 메서드는 return값이 없음 
//		sampleService.deleteSample(sampleVO);
//		
//		// 삭제후에는 상세가 존재하지 않으므로 리스트페이지로 이동 /list.do로 url만 보냄
//		return "redirect:/list.do";
//	}
}
