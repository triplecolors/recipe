package com.kh.recipe.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.notice.model.service.NoticeBoardService;
import com.kh.recipe.notice.model.vo.NoticeBoard;

/**
 * Servlet implementation class insertNoticeServlet
 */
@WebServlet("/ninsert.bo")
public class insertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html; charset=UTF-8");
		
		NoticeBoard n = new NoticeBoard();
		
//		String isLogin = request.getParameter("uno");
//		System.out.println("uno 들어옴? : "+isLogin);
//		if(isLogin == null) {
//			request.setAttribute("msg", "로그인전 작성 불가!");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//		}
//		n.setnContent(request.getParameter("editordata"));
		
		System.out.println("uno 확인 : " + request.getParameter("uno"));
		
		n.setUno(Integer.parseInt(request.getParameter("uno")));
		n.setnType("N");
		n.setnTitle(request.getParameter("title"));
		n.setnContent(request.getParameter("content"));
		
		
	
		
		
		System.out.println("서블릿 값 입력 확인 : "+n);
		
		int result = new NoticeBoardService().insertBoard(n);
		
		
//	
		if(result > 0 ) {
			System.out.println("버튼 연결 확인!");
			//request.setAttribute(name, o);
			response.sendRedirect("selectList.no");
		}else {
			request.setAttribute("msg", "공지 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
