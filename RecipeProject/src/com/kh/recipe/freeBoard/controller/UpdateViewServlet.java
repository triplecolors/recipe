package com.kh.recipe.freeBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.freeBoard.model.service.FreeBoardService;
import com.kh.recipe.freeBoard.model.vo.FreeBoard;

/**
 * Servlet implementation class UpdateViewServlet
 */
@WebServlet("/fUpView.fb")
public class UpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		FreeBoard f = new FreeBoardService().updateView(bno);
		String page = "";
		if(f != null) {
			page = "views/fboard/fboardUpdateForm2.jsp";
			request.setAttribute("fboard", f);
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
