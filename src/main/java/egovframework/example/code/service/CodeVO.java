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
public class CodeVO extends SampleDefaultVO {

	// 1. vo만들기
	static final long serialVersionUID = 1L;

	private String groupId;			//코드그룹id
	private String groupNm;			//코드그룹명
	private String cdNote;			//코드그룹설명
	private String cdRegDt;   		//코드그룹등록일시
	private String cdUpdateDt;		//코드그룹수정일시
	private String cdRegNm;			//코드그룹등록자
	private String cdUpdateNm;		//코드그룹수정자
	private String cdId;			//상세코드id
	private String cdNm;			//상세코드명
	private String reference1;		//상세코드참조값1
	private String reference2;		//상세코드참조값2
	private String useYn;			//상세코드사용여부
	private String dtlNote;			//상세코드설명
	private String dtlRegDt;		//상세코드등록일시
	private String dtlUpdateDt;		//상세코드수정일시
	private String dtlRegNm;		//상세코드등록자
	private String dtlUpdateNm;		//상세코드수정자
	
	
	// 검색조건
	private String searchId;
	private String idKeyword;
	private String searchNm;
	private String nameKeyword;
	private String searchUseYn;
	
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getGroupNm() {
		return groupNm;
	}
	public void setGroupNm(String groupNm) {
		this.groupNm = groupNm;
	}
	public String getCdNote() {
		return cdNote;
	}
	public void setCdNote(String cdNote) {
		this.cdNote = cdNote;
	}
	public String getCdRegDt() {
		return cdRegDt;
	}
	public void setCdRegDt(String cdRegDt) {
		this.cdRegDt = cdRegDt;
	}
	public String getCdUpdateDt() {
		return cdUpdateDt;
	}
	public void setCdUpdateDt(String cdUpdateDt) {
		this.cdUpdateDt = cdUpdateDt;
	}
	public String getCdRegNm() {
		return cdRegNm;
	}
	public void setCdRegNm(String cdRegNm) {
		this.cdRegNm = cdRegNm;
	}
	public String getCdUpdateNm() {
		return cdUpdateNm;
	}
	public void setCdUpdateNm(String cdUpdateNm) {
		this.cdUpdateNm = cdUpdateNm;
	}
	public String getCdId() {
		return cdId;
	}
	public void setCdId(String cdId) {
		this.cdId = cdId;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	public String getReference1() {
		return reference1;
	}
	public void setReference1(String reference1) {
		this.reference1 = reference1;
	}
	public String getReference2() {
		return reference2;
	}
	public void setReference2(String reference2) {
		this.reference2 = reference2;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getDtlNote() {
		return dtlNote;
	}
	public void setDtlNote(String dtlNote) {
		this.dtlNote = dtlNote;
	}
	public String getDtlRegDt() {
		return dtlRegDt;
	}
	public void setDtlRegDt(String dtlRegDt) {
		this.dtlRegDt = dtlRegDt;
	}
	public String getDtlUpdateDt() {
		return dtlUpdateDt;
	}
	public void setDtlUpdateDt(String dtlUpdateDt) {
		this.dtlUpdateDt = dtlUpdateDt;
	}
	public String getDtlRegNm() {
		return dtlRegNm;
	}
	public void setDtlRegNm(String dtlRegNm) {
		this.dtlRegNm = dtlRegNm;
	}
	public String getDtlUpdateNm() {
		return dtlUpdateNm;
	}
	public void setDtlUpdateNm(String dtlUpdateNm) {
		this.dtlUpdateNm = dtlUpdateNm;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	public String getIdKeyword() {
		return idKeyword;
	}
	public void setIdKeyword(String idKeyword) {
		this.idKeyword = idKeyword;
	}
	public String getSearchNm() {
		return searchNm;
	}
	public void setSearchNm(String searchNm) {
		this.searchNm = searchNm;
	}
	public String getNameKeyword() {
		return nameKeyword;
	}
	public void setNameKeyword(String nameKeyword) {
		this.nameKeyword = nameKeyword;
	}
	public String getSearchUseYn() {
		return searchUseYn;
	}
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
	@Override
	public String toString() {
		return "CodeVO [groupId=" + groupId + ", groupNm=" + groupNm + ", cdNote=" + cdNote + ", cdRegDt=" + cdRegDt
				+ ", cdUpdateDt=" + cdUpdateDt + ", cdRegNm=" + cdRegNm + ", cdUpdateNm=" + cdUpdateNm + ", cdId="
				+ cdId + ", cdNm=" + cdNm + ", reference1=" + reference1 + ", reference2=" + reference2 + ", useYn="
				+ useYn + ", dtlNote=" + dtlNote + ", dtlRegDt=" + dtlRegDt + ", dtlUpdateDt=" + dtlUpdateDt
				+ ", dtlRegNm=" + dtlRegNm + ", dtlUpdateNm=" + dtlUpdateNm + ", searchId=" + searchId + ", idKeyword="
				+ idKeyword + ", searchNm=" + searchNm + ", nameKeyword=" + nameKeyword + ", searchUseYn=" + searchUseYn
				+ "]";
	}
	

}
