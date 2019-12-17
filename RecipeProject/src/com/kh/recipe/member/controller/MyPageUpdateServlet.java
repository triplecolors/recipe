package com.kh.recipe.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.recipe.member.model.service.MemberService;
import com.kh.recipe.member.model.vo.Member;

/**
 * Servlet implementation class MyPageUpdateViewServlet
 */
@WebServlet("/update.vi")
public class MyPageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String userid = request.getParameter("userid");
		String upwd = request.getParameter("upwd");
		String unick = request.getParameter("unick");
		String uadrs = 
					request.getParameter("zipCode") + ", "
				+ request.getParameter("address1") + ", "
				+ request.getParameter("address2");
		String uphone = request.getParameter("tel1") + "-" + 
				   request.getParameter("tel2") + "-" + 
				   request.getParameter("tel3");
		
		
		
		MemberService ms = new MemberService();
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		m.setUpwd(upwd);
		m.setUnick(unick);
		m.setUphone(uphone);
		m.setUadrs(uadrs);
		
		System.out.println("회원 기존 정보 : " + session.getAttribute("member"));
		
		System.out.println("회원 정보 수정 시 전달 받은 값 : " + m);
		
		if(ms.updateMember(m) != 0) {
			
			System.out.println("회원 정보 수정 완료! : " + m);
			response.sendRedirect("myPageList.jsp");
			
		} else {
			
			request.setAttribute("msg", "회원 정보 수정 중 에러가 발생하였습니다.");
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
