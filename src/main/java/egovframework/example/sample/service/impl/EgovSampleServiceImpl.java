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
package egovframework.example.sample.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.sample.service.EgovSampleService;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

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

@Service("sampleService")
public class EgovSampleServiceImpl extends EgovAbstractServiceImpl implements EgovSampleService {

//	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleServiceImpl.class);
//
//	// TODO mybatis 사용
//	  @Resource(name="sampleMapper")
//		private SampleMapper mapper;
//
//	/** ID Generation */
//	@Resource(name = "egovIdGnrService")
//	private EgovIdGnrService egovIdGnrService;
//	
//
//	// impl에서 mapper호출
//	@Override
//	public List<SampleVO> selectSampleList(SampleVO vo) throws Exception{
//		// 사용자 목록 조회하는 mapper 호출	
//		List<SampleVO> result = mapper.selectSampleList(vo);
//		return result;
//	}
//	
//	// impl에서 mapper호출
//	@Override
//	public int selectSampleListCnt(SampleVO vo) throws Exception {
//		// 페이징cnt mapper 호출	
//		int result = mapper.selectSampleListCnt(vo);
//		return result;
//	}
//	
//	/**
//	 * 사원 상세 조회
//	 * @param memberno - 조회할 사원 번호
//	 * @return SampleVO - 사원 상세 정보
//	 * @exception Exception
//	 */
//	// impl에서 mapper호출
//	@Override
//	public SampleVO selectSampleView(SampleVO sampleVO) throws Exception {
//		System.out.println("-------------EgovSampleServiceImpl/selectSampleview");
//		// 사용자 상세 조회하는 mapper 호출	
//		return mapper.selectSampleView(sampleVO);
//	}
//	
//	// impl에서 mapper호출
//	/**등록*/
//	@Override
//	public int selectSampleAdd(SampleVO sampleVO) throws Exception {
//		System.out.println("-------------EgovSampleServiceImpl/selectSampleAdd");
//		
//		// 파일을 객체화
//		MultipartFile mf = sampleVO.getUploadFile();
//	
//		// 파일이 존재한다면
//		if (mf != null) {
//			//업로드한 파일 이름, 저장할 위치
//			String fileNm = mf.getOriginalFilename();
//			String filePath = "C:\\img\\";
//			
//			// update에 필요한 정보 세팅
//			sampleVO.setFilename(fileNm);		
//			sampleVO.setFilepath(filePath);
//			
//			try {
//				// 파일생성
//				mf.transferTo(new File(filePath + fileNm));
//			} catch (Exception e) {
//				// try문에서 에러 발생되면 오류 출력
//				e.printStackTrace();
//			}
//		}
//		
//		// 사용자 상세 등록하는 mapper 호출
//		int result = mapper.selectSampleAdd(sampleVO);
//		return result;
//	}
//
//	// impl에서 mapper호출
//	@Override
//	public void updateSample(SampleVO sampleVO) throws Exception {
//		System.out.println("-------------EgovSampleServiceImpl/selectSampleAdd");
//		
//		// 파일을 객체화
//		MultipartFile mf = sampleVO.getUploadFile();
//	
//		// 파일이 존재한다면(없거나 공백이 아닌 경우)
//		if (mf != null && !mf.equals("")) {
//			//업로드한 파일 이름, 저장할 위치
//			String fileNm = mf.getOriginalFilename();
//			String filePath = "C:\\img\\";
//			
//			// update에 필요한 정보 세팅
//			sampleVO.setFilename(fileNm);		
//			sampleVO.setFilepath(filePath);
//			
//			try {
//				// 파일생성
//				mf.transferTo(new File(filePath + fileNm));
//			} catch (Exception e) {
//				// try문에서 에러 발생되면 오류 출력
//				e.printStackTrace();
//			}
//		}
//		
//		// 사용자 수정하는 mapper 호출 // void 이기때문에 리턴하지 않음
//		mapper.updateSample(sampleVO);
//	}
//
//	// impl에서 mapper호출
//	@Override
//	public void deleteSample(SampleVO sampleVO) throws Exception {
//		// 사용자 삭제하는 mapper 호출 // void 이기때문에 리턴하지 않음
//		mapper.deleteSample(sampleVO);
//	}


	
}