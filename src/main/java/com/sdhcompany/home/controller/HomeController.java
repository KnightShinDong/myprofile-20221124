package com.sdhcompany.home.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sdhcompany.home.Dao.IDao;
import com.sdhcompany.home.Dto.Criteria;
import com.sdhcompany.home.Dto.MemberDto;
import com.sdhcompany.home.Dto.PageDto;
import com.sdhcompany.home.Dto.QBoardDto;

import oracle.net.aso.m;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/")
	public String home() {
		
		return "index";
	}
	@RequestMapping(value = "/profile")
	public String profile() {
		
		return "profile";
	}
	@RequestMapping(value = "/contact")
	public String contact() {
		
		return "contact";
	}
	@RequestMapping(value = "/index")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		
		return "login";
	}
	@RequestMapping(value = "/join")
	public String join() {
		
		return "join";
	}
	@RequestMapping(value = "/question")
	public String question(HttpSession session,Model model) {
		
		String sessionId = (String) session.getAttribute("memberId");
		
		if(sessionId == null) { //로그인 상태확인
			
			model.addAttribute("memberId", "GUEST");
		} else {
			model.addAttribute("memberId", sessionId);
		}
		
		
		return "question";
	}

	@RequestMapping(value = "/joinOk")
	public String joinOk(HttpServletRequest request,HttpSession session,Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		int joinFlag = dao.memberJoinDao(mid, mpw, mname, memail);
		
		if(joinFlag ==1) {
			session.setAttribute("memberId", mid);
			session.setAttribute("memberName", mname);
			
			model.addAttribute("mname", mname);
			model.addAttribute("mid", mid);
			
			return "joinOk";
		} else {
			return "joinFail";
		}
		
	}
	
	@RequestMapping(value = "/loginOk")
	public String loginOk(HttpServletRequest request, HttpSession session, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		int checkIdFlag = dao.checkIdDao(mid);
		//로그인하려는 아이디 존재시 1, 로그인하려는 아이디가 존재하지 않으면 0이 반환
		int checkIdPwFlag = dao.checkIdPwDao(mid, mpw);
		//로그인하려는 아이디와 비밀번호가 모두 일치하는 데이터가 존재하면 1 아니면 0
		
		model.addAttribute("checkIdFlag", checkIdFlag);
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if(checkIdPwFlag==1) { //로그인실행
			session.setAttribute("memberId", mid);
			
			MemberDto dto =  dao.getMemberInfoDao(mid);
			String mname = dto.getMname();
			session.setAttribute("memberName", mname);
			
			
			MemberDto memberDto= dao.getMemberInfoDao(mid);
			
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("mid", mid);
			
		}
		
		return "loginOk";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
				
		return "login";
	}
	
	
	@RequestMapping(value = "/memberModify")
	public String memberModify(HttpServletRequest request, Model model, HttpSession session) {
		
		String sessionId = (String) session.getAttribute("memberId");

		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto memberDto = dao.getMemberInfoDao(sessionId);
		
		model.addAttribute("memberDto", memberDto);
		return "memberModify";
		
		}
	
	@RequestMapping(value = "/memberModifyOk")
	public String memberModifyOk(HttpServletRequest request,Model model) {
		 
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.memberModifyDao(mid, mpw, mname, memail);
		
		MemberDto memberDto = dao.getMemberInfoDao(mid);
		model.addAttribute("memberDto", memberDto);
		
		return "memberModifyOk";
		
	}
	
	@RequestMapping(value = "questionOk")
	public String questionOk(HttpServletRequest request, Model model) {
		
		String qid = request.getParameter("qid");
		String qname = request.getParameter("qname");
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.writeQuestionDao(qid, qname, qcontent, qemail);
		
		
		return "redirect:questionList";
	}
	
	@RequestMapping(value = "questionList")
	public String list(HttpServletRequest request, Model model, Criteria cri) {
		
		int pageNumInt= 0;
		if(request.getParameter("pageNum") == null) {
			pageNumInt = 1;
			cri.setPageNum(pageNumInt);
			
		} else {
			pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
		//처음 넘어온 값이 null값이라  if문사용
			cri.setPageNum(pageNumInt);
		}
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		//페이징관련
		int totalRecord = dao.boardAllCount(); 
		
		// cri.setPageNum(totalRecord);
		cri.setStartNum(cri.getPageNum()-1 * cri.getAmount());
		//크리객체에 스타트넘 공식 -- 해당 페이지의 시작번호를 설정
		
		PageDto pageDto = new PageDto(cri, totalRecord);
		
		
		//리스트관련
		ArrayList<QBoardDto> boardDtos =  dao.boardListDao(cri);
		
		model.addAttribute("pageMaker", pageDto);//페이징관련
		model.addAttribute("currPage", pageNumInt);
		
		model.addAttribute("boardDtos", boardDtos);
		
		
		return "questionList";
	}
	
	@RequestMapping(value = "boardView")
	public String boardView(HttpServletRequest request,Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String qnum =request.getParameter("qnum");
		
		QBoardDto Qdto = dao.boardViewDao(qnum);
		
		model.addAttribute("Qdto", Qdto);
		model.addAttribute("qid", Qdto.getQid());
		return "boardView";
	}
	
	@RequestMapping(value = "questionModify")
	public String questionModify(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		String qnum =request.getParameter("qnum");
		
		QBoardDto Qdto = dao.boardViewDao(qnum);
		
		model.addAttribute("Qdto", Qdto);
		
		
		return "questionModify";
	}
	
	@RequestMapping(value = "/questionModifyOk")
	public String questionModifyOk(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		String qnum = request.getParameter("qnum");
		String qcontent = request.getParameter("qcontent");
		
		dao.modifyDao(qnum, qcontent);
		
		return "redirect:questionList";
	}
	@RequestMapping(value = "/questionDelete")
	public String questionDelete(HttpServletRequest request) {
		IDao dao = sqlSession.getMapper(IDao.class);
		String qnum = request.getParameter("qnum");
		
		
		dao.deletedao(qnum);
		
		return "redirect:questionList";
	}
	
	
	
}
