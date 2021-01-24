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
package egovframework.example.code.service;

import java.util.List;

import egovframework.example.cost.service.CostVO;
import egovframework.example.sample.service.SampleVO;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface CodeService {

	/* 3.  코드그룹 리스트 service 만들기*/
	List<CodeVO> getCodeList(CodeVO codeVO) throws Exception;
	
	/* 9. 코드그룹 상세팝업 service 만들기*/
	Object getCodeView(CodeVO codeVO) throws Exception;
	
	/* 17. 코드그룹  저장 service 만들기*/
	void codeAdd(CodeVO codeVO) throws Exception;
	
	/* 코드그룹 수정*/
	void codeModify(CodeVO codeVO) throws Exception;
	
	/* 코드그룹  삭제*/
	void codeDelete(CodeVO codeVO) throws Exception;
	
	// 합계
	/*Object countCdDtl(CodeVO codeVO) throws Exception;*/
	
	
	
	/* 상세코드 목록 (ajax)*/
	List<CodeVO> getCodeDtlList(CodeVO codeVO) throws Exception;
	
	/* 상세코드 상세팝업 */
	Object getCodeDtlView(CodeVO codeVO) throws Exception;
	
	/* 상세코드 수정 */
	void codeDtlModify(CodeVO codeVO) throws Exception;
	
	/* 상세코드 저장 */
	void codeDtlAdd(CodeVO codeVO) throws Exception;
	
	/* 상세코드 삭제 */
	void codeDtlDelete(CodeVO codeVO) throws Exception;
	
}
