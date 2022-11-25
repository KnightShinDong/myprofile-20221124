package com.sdhcompany.home.Dao;


import com.sdhcompany.home.Dto.MemberDto;

public interface IDao {

	public int memberJoinDao(String mid, String mpw, String mname, String memail); //회원가입
	public int checkIdDao(String mid); //아이디 존재여부 확인 select
	public int checkIdPwDao(String mid, String mpw);//아이디와 비밀번호의 존재 및 일치 여부
	public MemberDto getMemberInfoDao(String mid);//아이디로 조회하여 회원정보 가져오기
	public void memberModifyDao(String mid, String mpw, String mname, String memail);

}