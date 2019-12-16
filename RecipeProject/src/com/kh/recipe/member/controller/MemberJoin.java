package com.kh.recipe.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.member.model.service.MemberService;
import com.kh.recipe.member.model.vo.Member;


/**
 * Servlet implementation class MemberJoin
 */
@WebServlet("/mJoin.me")
public class MemberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 로그인정보 받기
		String userid = request.getParameter("userId");
		String upwd = request.getParameter("password");
		String unick = request.getParameter("userName");
		String uphone = request.getParameter("tel1") + "-" + 
					   request.getParameter("tel2") + "-" + 
					   request.getParameter("tel3");
		
		String uadrs = request.getParameter("zipCode") + ", "
					   + request.getParameter("address1") + ", "
					   + request.getParameter("address2");
		
		// 회원가입용 Member확인하기
		 Member m = new Member(userid, upwd, unick, uadrs, uphone);
		 System.out.println(m);
		 // 회원가입 서비스 실행
		 MemberService ms = new MemberService(); 
		 int result = ms.insertMember(m);
		 
		 // result 처리
		 if(result > 1) {
			 // 회원가입 성공!
			 System.out.println("회원가입 성공!");
			 
			 response.sendRedirect("index.jsp");
			 
		 } else {
			 // 회원가입 실패ㅠ_ㅠ
			 request.setAttribute("msg", "회원가입 실패!!");
			 request.getRequestDispatcher("views/common/errorPage.jsp")
			 		.forward(request, response);
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
