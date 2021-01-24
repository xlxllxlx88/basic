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
package egovframework.example.code.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.code.service.CodeService;
import egovframework.example.code.service.CodeVO;
import egovframework.example.sample.service.SampleVO;

@Controller
public class CodeController {

	/** EgovSampleService */
	@Resource(name = "codeService")
	private CodeService codeService;
	
	// 2. 코드그룹 controller 만들기
	@RequestMapping(value = "/codeList.do")
	public String getCodeList(@ModelAttribute("codeVO") CodeVO codeVO
							 , String deleteYn
							 , ModelMap model) throws Exception {
		System.out.println("------------CodeController/getCodeList");
		System.out.println("------------codeVO="+codeVO.toString());
		
		List<CodeVO> list = codeService.getCodeList(codeVO);
		model.addAttribute("codeList", list);
		model.addAttribute("deleteYn", deleteYn);
		
		return "code/codeList";
	}
	
	// 8. 코드그룹 상세팝업 
	@RequestMapping(value = "/codeView.do")
	public String getCodeView(@ModelAttribute("codeVO") CodeVO codeVO
			                , String updateYn
			                , ModelMap model) throws Exception {
		System.out.println("------------CodeController/getCodeView");
		System.out.println("------------codeVO="+codeVO.toString());
		
		Object info = codeService.getCodeView(codeVO);
		model.addAttribute("info", info);
		model.addAttribute("updateYn", updateYn);
		
		return "code/codeView";
	}
	
	
	// 15. 코드그룹 상세 등록화면 (화면만)
	@RequestMapping(value = "/codeAddView.do")
	public String goCodeAdd(@ModelAttribute("codeVO") CodeVO codeVO
			              , String insertYn
			              , ModelMap model) throws Exception {
		System.out.println("------------CodeController/goCodeAdd");
		System.out.println("---------groupid="+ codeVO.getGroupId());
		
		model.addAttribute("insertYn", insertYn);
		
		
		return "code/codeAdd";
	}
	
	// 16. 코드그룹 상세 등록 (저장)
	@RequestMapping(value = "/codeAdd.do")
	public String CodeAdd(@ModelAttribute("codeVO") CodeVO codeVO, ModelMap model) throws Exception {
		System.out.println("------------CodeController/CodeAdd");
		System.out.println("------------codeVO="+codeVO.toString());
		
		codeService.codeAdd(codeVO);
		
		return "redirect:/codeAddView.do?insertYn=Y";
	}
	
	// 코드그룹  상세팝업 수정
	@RequestMapping(value = "/codeModify.do")
	public String codeModify(@ModelAttribute("codeVO") CodeVO codeVO) throws Exception {
		System.out.println("------------CostController/codeModify");
		
		codeService.codeModify(codeVO);

		return "redirect:/codeView.do?updateYn=Y";
		}	
	
	// 코드그룹 삭제
	@RequestMapping(value = "/codeDelete.do")
	public String codeDelete(CodeVO codeVO, String delStr, ModelMap model) throws Exception {
		System.out.println("------------CodeController/codeDelete");
		System.out.println("------------delStr="+delStr);
		
		String[] delArr = delStr.split("\\|");
		CodeVO vo = new CodeVO();
		for (int i=0; i < delArr.length; i++) {
			vo.setGroupId(delArr[i]);
			
			/*Object cnt = codeService.countCdDtl(codeVO);
			model.addAttribute("cnt", cnt);*/
			
			codeService.codeDelete(vo);
		}
		
		return "redirect:/codeList.do?deleteYn=Y";
	}
	
	
	
	
	// 상세코드 목록 (ajax)
	@RequestMapping("/codeDtlList.do")
    protected ModelAndView getCodeDtlList(CodeVO codeVO, String deleteYn) throws Exception{
        
		ModelAndView modelAndView = new ModelAndView("jsonView");
        List<CodeVO> codeDtlList = codeService.getCodeDtlList(codeVO);
        modelAndView.addObject("codeDtlList", codeDtlList);
        modelAndView.addObject("deleteYn", deleteYn);
        
        return modelAndView;
    }
	
	// 8. 상세코드 상세팝업 
	@RequestMapping(value = "/codeDtlView.do")
	public String getCodeDtlView(@ModelAttribute("codeVO") CodeVO codeVO
								, String updateYn
								, ModelMap model) throws Exception {
		System.out.println("------------CodeController/getCodeDtlView");
		System.out.println("------------codeVO="+codeVO.toString());
		
		Object dtl = codeService.getCodeDtlView(codeVO);
		model.addAttribute("dtl", dtl);
		model.addAttribute("updateYn", updateYn);
		
		return "code/codeDtlView";
	}
	
	// 상세코드 상세팝업 수정
	@RequestMapping(value = "/codeDtlModify.do")
	public String codeDtlModify(@ModelAttribute("codeVO") CodeVO codeVO) throws Exception {
		System.out.println("------------CostController/codeDtlModify");
		System.out.println("------------costVO=" + codeVO.toString());
		
		codeService.codeDtlModify(codeVO);

		return "redirect:/codeDtlView.do?groupId=" + codeVO.getGroupId() + "&cdId=" + codeVO.getCdId() + "&updateYn=Y";
	}	
	
	
	// 상세코드 상세 등록화면 (화면만) 
	@RequestMapping(value = "/codeDtlAddView.do")
	public String codeDtlAddView(@RequestParam("groupId") String groupId
			                   , String insertYn
			                   , ModelMap model) throws Exception {
		System.out.println("------------CodeController/codeDtlAddView");
		System.out.println("------------groupId=" + groupId);
		System.out.println("------------groupId=" + groupId);
		
		model.addAttribute("groupId", groupId);
		model.addAttribute("insertYn", insertYn);
		
		return "code/codeDtlAdd";
	}
		
	
	// 상세코드 상세 등록 (저장) 
	@RequestMapping(value = "/codeDtlAdd.do")
	public String codeDtlAdd(@ModelAttribute("codeVO") CodeVO codeVO, String groupId, ModelMap model) throws Exception {
		System.out.println("------------CodeController/codeDtlAdd");
		System.out.println("------------codeVO="+codeVO.toString());
		System.out.println("---------groupid="+ codeVO.getGroupId());
		
		codeService.codeDtlAdd(codeVO);
		model.addAttribute("groupId", groupId);
		
		return "redirect:/codeDtlAddView.do?insertYn=Y";
	}
	
	// 상세코드 삭제
	@RequestMapping(value = "/codeDtlDelete.do")
	public String codeDtlDelete(String delStr, ModelMap model) throws Exception {
		System.out.println("------------CodeController/codeDtlDelete");
		System.out.println("------------delStr="+delStr);
		
		String[] delArr = delStr.split("\\|");
		CodeVO vo = new CodeVO();
		for (int i=0; i < delArr.length; i++) {
			vo.setCdId(delArr[i]);
			codeService.codeDtlDelete(vo);
		}
		
		return "redirect:/codeDtlList.do?deleteYn=Y";
	}
	

}