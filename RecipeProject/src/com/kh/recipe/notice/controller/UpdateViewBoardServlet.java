package com.kh.jsp.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;

/**
 * Servlet implementation class UpdateViewBoardServlet
 */
@WebServlet("/bUpView.bo")
public class UpdateViewBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateViewBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		///response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		Board b = new BoardService().updateView(bno);
		
		String page = "";
		if(b != null) {
			page = "views/board/boardUpdateForm.jsp";
			request.setAttribute("board", b);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정화면 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
