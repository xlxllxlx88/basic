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
package egovframework.example.code.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.code.service.CodeService;
import egovframework.example.code.service.CodeVO;
import egovframework.example.cost.service.CostVO;
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

@Service("codeService")
public class CodeServiceImpl extends EgovAbstractServiceImpl implements CodeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CodeServiceImpl.class);

	// TODO mybatis 사용
	@Resource(name="codeMapper")
	private CodeMapper codeMapper;
	

	// 4. 코드그룹 리스트 impl
	@Override
	public List<CodeVO> getCodeList(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/getCodeList");
		System.out.println("------------CodeServiceImpl/getCodeList codeVO=" + codeVO.toString());
		
		List<CodeVO> result = codeMapper.getCodeList(codeVO);
		
		return result;
	}
	
	/*10. 코드그룹 상세팝업 impl*/
	public Object getCodeView(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/getCodeView");
		System.out.println("------------CodeServiceImpl/getCodeView codeVO=" + codeVO.toString());
		
		Object info = codeMapper.getCodeView(codeVO); 

		return info;
	}
	
	/*18. 코드그룹 저장팝업 impl*/
	@Override
	public void codeAdd(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/codeAdd");
		System.out.println("------------CodeServiceImpl/codeAdd codeVO=" + codeVO.toString());
		
		codeMapper.codeAdd(codeVO);
	}
	
	/* 코드그룹 수정팝업 impl*/
	@Override
	public void codeModify(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/codeModify");
		System.out.println("------------CodeServiceImpl/codeModify codeVO=" + codeVO.toString());
		
		codeMapper.codeModify(codeVO);
	}
	
	/* 코드그룹삭제 impl*/
	@Override
	public void codeDelete(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/codeDelete");
		
		codeMapper.codeDelete(codeVO);
	}
	
	// 합계
	/*@Override
	public Object countCdDtl(CodeVO codeVO) throws Exception {
		Object result = codeMapper.countCdDtl(codeVO);
		return result;
	}*/
	
	
	
	// 상세코드 목록 (ajax)
	@Override
	public List<CodeVO> getCodeDtlList(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/getCodeDtlList");
		System.out.println("------------CodeServiceImpl/getCodeDtlList codeVO=" + codeVO.toString());
		
		List<CodeVO> result = codeMapper.getCodeDtlList(codeVO);
		return result;
	}

	/* 상세코드 상세팝업 impl*/
	public Object getCodeDtlView(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/getCodeView");
		System.out.println("------------CodeServiceImpl/getCodeView codeVO=" + codeVO.toString());
		
		Object info = codeMapper.getCodeDtlView(codeVO); 

		return info;
	}
	
	/* 상세코드 수정 impl*/
	public void codeDtlModify(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/codeDtlModify");
		System.out.println("------------CodeServiceImpl/codeDtlModify codeVO=" + codeVO.toString());
		
		codeMapper.codeDtlModify(codeVO);
		
	}
	
	/* 상세코드 저장팝업 impl*/
	@Override
	public void codeDtlAdd(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/codeDtlAdd");
		System.out.println("------------CodeServiceImpl/codeDtlAdd codeVO=" + codeVO.toString());
		
		codeMapper.codeDtlAdd(codeVO);
	}
	
	/* 상세코드 삭제 impl*/
	@Override
	public void codeDtlDelete(CodeVO codeVO) throws Exception {
		System.out.println("------------CodeServiceImpl/codeDtlDelete");
		
		codeMapper.codeDtlDelete(codeVO);
	}
	
	
	
	
}
	

