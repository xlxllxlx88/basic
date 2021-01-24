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
package egovframework.example.survey.service;

import org.springframework.web.multipart.MultipartFile;

import egovframework.example.sample.service.SampleDefaultVO;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
public class SurveyVO extends SampleDefaultVO {

	 static final long serialVersionUID = 1L;

	 // 1. 설문조사 vo 만들기 
	 
	 private int surveyNo;		 // 설문no 
	 private String surveyNm; 	 // 설문명
	 private String useYn;  	 // 사용여부
	 private String surveyStDt;  // 설문시작일
	 private String surveyEdDt;  // 설문종료일
	 private int qstNo;			 // 질문no
	 private int qstSeq; 		 // 질문순번
	 private String qstCont; 	 // 질문내용
	 private String qstType;	 // 질문유형
	 private int expNo;			 // 보기no
	 private int expSeq;		 // 보기순번
	 private String expCont;	 // 보기내용
	 private int rspNo;		     // 답변번호
	 private String rspSelNo;    // 답변선택번호
	 private String rspCont;     // 답변내용
	 private String rspDt;		 // 답변일시
	 
	 private String sed;		 // 설문기간
	 private String qqn;		 // 질문수
	 private String rrn;		 // 답변수
	 private String gubun;
	 private String cont;
	
	 
	 
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getQqn() {
		return qqn;
	}
	public void setQqn(String qqn) {
		this.qqn = qqn;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getSed() {
		return sed;
	}
	public void setSed(String sed) {
		this.sed = sed;
	}
	public int getSurveyNo() {
		return surveyNo;
	}
	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}
	public String getSurveyNm() {
		return surveyNm;
	}
	public void setSurveyNm(String surveyNm) {
		this.surveyNm = surveyNm;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getSurveyStDt() {
		return surveyStDt;
	}
	public void setSurveyStDt(String surveyStDt) {
		this.surveyStDt = surveyStDt;
	}
	public String getSurveyEdDt() {
		return surveyEdDt;
	}
	public void setSurveyEdDt(String surveyEdDt) {
		this.surveyEdDt = surveyEdDt;
	}
	public int getQstNo() {
		return qstNo;
	}
	public void setQstNo(int qstNo) {
		this.qstNo = qstNo;
	}
	public int getQstSeq() {
		return qstSeq;
	}
	public void setQstSeq(int qstSeq) {
		this.qstSeq = qstSeq;
	}
	public String getQstCont() {
		return qstCont;
	}
	public void setQstCont(String qstCont) {
		this.qstCont = qstCont;
	}
	public String getQstType() {
		return qstType;
	}
	public void setQstType(String qstType) {
		this.qstType = qstType;
	}
	public int getExpNo() {
		return expNo;
	}
	public void setExpNo(int expNo) {
		this.expNo = expNo;
	}
	public int getExpSeq() {
		return expSeq;
	}
	public void setExpSeq(int expSeq) {
		this.expSeq = expSeq;
	}
	public String getExpCont() {
		return expCont;
	}
	public void setExpCont(String expCont) {
		this.expCont = expCont;
	}
	public int getRspNo() {
		return rspNo;
	}
	public void setRspNo(int rspNo) {
		this.rspNo = rspNo;
	}
	public String getRspSelNo() {
		return rspSelNo;
	}
	public void setRspSelNo(String rspSelNo) {
		this.rspSelNo = rspSelNo;
	}
	public String getRspCont() {
		return rspCont;
	}
	public void setRspCont(String rspCont) {
		this.rspCont = rspCont;
	}
	public String getRspDt() {
		return rspDt;
	}
	public void setRspDt(String rspDt) {
		this.rspDt = rspDt;
	}

	@Override
	public String toString() {
		return "SurveyVO [surveyNo=" + surveyNo + ", surveyNm=" + surveyNm + ", useYn=" + useYn + ", surveyStDt="
				+ surveyStDt + ", surveyEdDt=" + surveyEdDt + ", qstNo=" + qstNo + ", qstSeq=" + qstSeq + ", qstCont="
				+ qstCont + ", qstType=" + qstType + ", expNo=" + expNo + ", expSeq=" + expSeq + ", expCont=" + expCont
				+ ", rspNo=" + rspNo + ", rspSelNo=" + rspSelNo + ", rspCont=" + rspCont + ", rspDt=" + rspDt + ", sed="
				+ sed + "]";
	}
	 
}
