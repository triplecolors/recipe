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
 * Servlet implementation class UpdateFBoardServlet
 */
@WebServlet("/UpdateFBoardServlet")
public class UpdateFBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FreeBoardService fbs = new FreeBoardService();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		//String ptype = request.getParameter("ptype");
		String title = request.getParameter("title");
		String content = request.getParameter("editdata");
		
		FreeBoard f = new FreeBoard(title,content);
		f.setBno(bno);
		System.out.println("수정확인 : " + f);
		
		int result = fbs.updateBoard(f);
		
		if( result > 0) {
				response.sendRedirect("selectList.fb");
		} else {
			request.setAttribute("msg", "게시글 수정 중 오류 발생");
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
