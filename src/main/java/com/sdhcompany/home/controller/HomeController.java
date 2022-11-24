package com.sdhcompany.home.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sdhcompany.home.Dao.IDao;
import com.sdhcompany.home.Dto.MemberDto;

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
	public String question() {
		
		return "question";
	}
	@RequestMapping(value = "/list")
	public String list() {
		
		return "list";
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
	public String loginOk(HttpServletRequest request, HttpSession session) {
		IDao dao = sqlSession.getMapper(IDao.class);
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		int checkFlag = dao.checkIdPwDao(mid, mpw);
			
		if(checkFlag == 1) {
			session.setAttribute("memberId", mid);
			String cid=(String) session.getAttribute("memberId");
			MemberDto dto = dao.memberNameDao(cid);
			session.setAttribute("memberName", dto.getMname());
		}
		
		
		
		
		return "loginOk";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
				
		return "login";
	}
}
