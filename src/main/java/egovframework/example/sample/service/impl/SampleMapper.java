/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("sampleMapper")
public interface SampleMapper {

//	// 리스트 쿼리 불러옴
//	List<SampleVO> selectSampleList(SampleVO vo) throws Exception;
//	
//	//페이징 쿼리 불러옴
//	int selectSampleListCnt(SampleVO vo) throws Exception;
//	
//	/**
//	 * 사원 상세 조회
//	 * @param memberno - 조회할 사원 번호
//	 * @return SampleVO - 사원 상세 정보
//	 * @exception Exception
//	 */
//	//상세 조회 쿼리 불러옴
//	SampleVO selectSampleView(SampleVO sampleVO) throws Exception;
//	
//	/**등록*/
//	//insert 쿼리 불러옴
//	int selectSampleAdd(SampleVO sampleVO) throws Exception;
//
//	/**수정*/
//	//update / // void 이기때문에 리턴하지 않음
//	void updateSample(SampleVO sampleVO) throws Exception;
//
//	/**삭제*/
//	//delete / // void 이기때문에 리턴하지 않음
//	void deleteSample(SampleVO sampleVO) throws Exception;
	

}
