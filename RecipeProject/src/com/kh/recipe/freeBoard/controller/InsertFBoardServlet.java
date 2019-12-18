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
 * Servlet implementation class InsertFBoardServlet
 */
@WebServlet("/finsert.fb")
public class InsertFBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FreeBoard f = new FreeBoard();
		
		System.out.println("uno 확인 : " + request.getParameter("uno"));
		
		f.setUno(Integer.parseInt(request.getParameter("uno")));
		f.setpType("P");
		f.setpTitle(request.getParameter("title"));
		f.setpContent(request.getParameter("editordata"));
		
		System.out.println("서블릿 입력값 확인  : " + f);
		
		int result = new FreeBoardService().insertBoard(f);
		
		if(result > 0) {
			response.sendRedirect("selectList.fb");
		}else {
			request.setAttribute("msg", "게시글 작성 실패!");
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
