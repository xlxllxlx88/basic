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
package egovframework.example.survey.web;

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
import egovframework.example.survey.service.SurveyService;
import egovframework.example.survey.service.SurveyVO;

@Controller
public class SurveyController {

	/** EgovSampleService */
	@Resource(name = "surveyService")
	private SurveyService surveyService;
	
	// 2. 설문조사 controller 만들기
	@RequestMapping(value = "/surveyList.do")
	public String getServeyList(@ModelAttribute("surveyVO") SurveyVO surveyVO, ModelMap model) throws Exception {
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println("-----------surveyController/surveyList.do");
		System.out.println("-----------surveyVO="+surveyVO.toString());
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		
		
		List<SurveyVO> surveyList = surveyService.getServeyList(surveyVO);
		model.addAttribute("surveyList", surveyList);
		
		return "survey/surveyList";
	}
	
	@RequestMapping(value = "/surveyDtl.do")
	public String getServeyDtl(@ModelAttribute("surveyVO") SurveyVO surveyVO, ModelMap model) throws Exception {
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println("-----------surveyController/surveyDtl.do");
		System.out.println("-----------surveyVO="+surveyVO.toString());
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		
		
		List<SurveyVO> surveyDtl = surveyService.getServeyDtl(surveyVO);
		model.addAttribute("surveyDtl", surveyDtl);
		
		return "survey/surveyDtl";
	}
	

}