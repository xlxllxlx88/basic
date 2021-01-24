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
package egovframework.example.cost.service;

import java.util.List;

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
public interface CostService {

	/* 3. service 만들기*/
	/** 경비관리 리스트 */
	List<CostVO> getCostList(CostVO costVO) throws Exception;
	
	// 합계
	Object sumAmt(CostVO costVO) throws Exception;
	
	/* 11. 저장 서비스 만들기*/
	/** 경비등록 */
	void costAdd(CostVO costVO) throws Exception;
	
	/* 21. 경비상세 메서드*/
	/** 상세수정 화면 이동 */
	Object getCostDtl(CostVO costVO) throws Exception;
	
	/* 28. 수정메서드*/
	/** 경비 수정 */
	void costModify(CostVO costVO) throws Exception;
	
	/* 37. 수정메서드*/
	/** 경비 삭제 */
	void costRemove(CostVO costVO) throws Exception;

}
