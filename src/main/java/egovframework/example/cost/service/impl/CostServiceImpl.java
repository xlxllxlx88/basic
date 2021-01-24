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
package egovframework.example.cost.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.cost.service.CostService;
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

@Service("costService")
public class CostServiceImpl extends EgovAbstractServiceImpl implements CostService {

	// 4. 서비스임플 만들기
	private static final Logger LOGGER = LoggerFactory.getLogger(CostServiceImpl.class);

	// impl은 넘어온 요청을 처리하기 위해 mapper를 호출하기 위해 mapper선언
	// TODO mybatis 사용
	@Resource(name="costMapper")
	private CostMapper costMapper;
	

	/** 리스트 */
	@Override
	public List<CostVO> getCostList(CostVO costVO) throws Exception {
		System.out.println("------------CostServiceImpl/getCostList");
		System.out.println("------------CostServiceImpl/getCostList costVO=" + costVO.toString());
		
		// 경비관리 리스트 조회하는 mapper 호출
		List<CostVO> result = costMapper.getCostList(costVO);
		
		return result;
	}
	
	
	/*12. 저장 서비스임플 만들기*/
	/** 경비 등록 */
	@Override
	public void costAdd(CostVO costVO) throws Exception {
		System.out.println("------------CostServiceImpl/costAdd");
		System.out.println("------------CostServiceImpl/costAdd costVO=" + costVO.toString());
		
		/*12_1. 파일저장*/
		//파일첨부
		MultipartFile mf = costVO.getUploadFile();
		
		// 파일이 존재한다면
		if(mf != null) {
			//업로드한 파일 이름, 저장할 위치
			String fileNm = mf.getOriginalFilename();
			String filePath = "bill\\";
			
			// update에 필요한 정보 세팅
			costVO.setFileNm(fileNm);		
			costVO.setFilePath(filePath);
			
			try {
				// 파일생성 "C:\\img\\" 밑에 실제 경로 "bill\\" + 파일이름
				mf.transferTo(new File("C:\\img\\" + filePath + fileNm));
			} catch (Exception e) {
				// try문에서 에러발생 시 오류 출력
				e.printStackTrace();
			}
		}
		
		/*12_2. 데이터 저장*/
		// 경비관리 등록하는 mapper 호출
		costMapper.costAdd(costVO);
	}

	// 합계
	@Override
	public Object sumAmt(CostVO costVO) throws Exception {
		Object result = costMapper.sumAmt(costVO);
		return result;
	}
	
	/*22. 경비상세 메서드*/
	/** 상세수정 화면 이동 */
	public Object getCostDtl(CostVO costVO) throws Exception {
		System.out.println("------------CostServiceImpl/getCostDtl");
		System.out.println("------------CostServiceImpl/getCostDtl costVO=" + costVO.toString());
		Object info = costMapper.getCostDtl(costVO);
		return info; 
	}
	
	
	/*29. 수정 서비스임플 만들기*/
	/** 경비 수정 */
	@Override
	public void costModify(CostVO costVO) throws Exception {
		System.out.println("------------CostServiceImpl/costModify");
		System.out.println("------------CostServiceImpl/costModify costVO=" + costVO.toString());
		
		/*29_1. 파일저장 복붙*/
		//파일첨부
		MultipartFile mf = costVO.getUploadFile();
		
		// 파일이 존재한다면
		if(mf != null) {
			//업로드한 파일 이름, 저장할 위치
			String fileNm = mf.getOriginalFilename();
			String filePath = "bill\\";
			
			// update에 필요한 정보 세팅
			costVO.setFileNm(fileNm);		
			costVO.setFilePath(filePath);
			
			try {
				// 파일생성 "C:\\img\\" 밑에 실제 경로 "bill\\" + 파일이름
				mf.transferTo(new File("C:\\img\\" + filePath + fileNm));
			} catch (Exception e) {
				// try문에서 에러발생 시 오류 출력
				e.printStackTrace();
			}
		}
		
		/*29_2. 데이터 수정*/
		// 경비 수정하는 mapper 호출
		costMapper.costModify(costVO);
	}
	
	
	/* 38. 삭제메서드*/
	@Override
	public void costRemove(CostVO costVO) throws Exception {
		costMapper.costRemove(costVO);
	}
}
	

