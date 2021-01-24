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
package egovframework.example.survey.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.survey.service.SurveyService;
import egovframework.example.survey.service.SurveyVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("surveyService")
public class SurveyServiceImpl extends EgovAbstractServiceImpl implements SurveyService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SurveyServiceImpl.class);

	// TODO mybatis 사용
	@Resource(name="surveyMapper")
	private SurveyMapper surveyMapper;
	

	// 4. 설문조사 리스트 impl
	@Override
	public List<SurveyVO> getServeyList(SurveyVO surveyVO) throws Exception {
		System.out.println("□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□");
		System.out.println("-----------SurveyServiceImpl/getServeyList");
		System.out.println("-----------surveyVO="+surveyVO.toString());
		System.out.println("□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□");
		
		List<SurveyVO> result = surveyMapper.getServeyList(surveyVO);
		
		return result;
	}
	
	
	@Override
	public List<SurveyVO> getServeyDtl(SurveyVO surveyVO) throws Exception {
		System.out.println("□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□");
		System.out.println("-----------SurveyServiceImpl/getServeyDtl");
		System.out.println("-----------surveyVO="+surveyVO.toString());
		System.out.println("□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□");
		
		List<SurveyVO> result = surveyMapper.getServeyDtl(surveyVO);
		
		return result;
	}
	
}
	

