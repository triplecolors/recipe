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
		//request.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html; charset=UTF-8");
		
		String nTitle = request.getParameter("title");
		String nContent = request.getParameter("content");
		
		System.out.println("제목 : " + nTitle + "내용 : " + nContent);
		
		NoticeBoard n = new NoticeBoard(nTitle,nContent);
		
		int result = new NoticeBoardService().insertBoard(n);
		System.out.println("뷰 > 서블릿 전달 확인  : "+n);
		if(result > 0 ) {
			response.sendRedirect("");
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
