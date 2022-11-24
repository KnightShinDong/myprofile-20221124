package com.sdhcompany.home.Dao;


import com.sdhcompany.home.Dto.MemberDto;

public interface IDao {

	public int memberJoinDao(String mid, String mpw, String mname, String memail);
	public int checkId(String mid);
	public int checkIdPwDao(String mid, String mpw);
	public MemberDto memberNameDao(String mid);
}
