package com.sdhcompany.home.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QBoardDto {

	private int qnum;//게시판 글번호(기본키)
	private String qid;// 글쓴이 아이디
	private String qname;// 글쓴이 이름
	private String qcontent;//질문 내용
	private String qemail;// 글쓴이 이메일
	private String qdate;// 글 등록일시
	
	
}
