package com.kh.recipe.Suggestion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.notice.model.service.NoticeBoardService;
import com.kh.recipe.notice.model.vo.NoticeBoard;

/**
 * Servlet implementation class SuggestionInsertServlet
 */
@WebServlet("/ninsert.su")
public class SuggestionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		NoticeBoard n = new NoticeBoard();
		
		
		System.out.println("uno 확인 : " + request.getParameter("uno"));
		
		n.setUno(Integer.parseInt(request.getParameter("uno")));
		n.setnType("S");
		n.setnTitle(request.getParameter("title"));
		n.setnContent(request.getParameter("content"));
		
		
		System.out.println("서블릿 값 입력 확인 : "+n);
		
		int result = new NoticeBoardService().insertBoard(n);
		
		

		if(result > 0 ) {
			
			response.sendRedirect("selectList.su");
		}else {
			request.setAttribute("msg", "건의사항 작성 실패!");
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
