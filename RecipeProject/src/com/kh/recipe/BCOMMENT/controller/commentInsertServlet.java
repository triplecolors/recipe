package com.kh.recipe.BCOMMENT.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.BCOMMENT.model.service.CommentService;
import com.kh.recipe.BCOMMENT.model.vo.comment;

/**
 * Servlet implementation class commentInsertServlet
 */
@WebServlet("/insert.co")
public class commentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int uno = Integer.parseInt(request.getParameter("uno"));
		String ccontent = request.getParameter("ccontent");
		int clevel = Integer.parseInt(request.getParameter("clevel"));
		int ref_cno = Integer.parseInt(request.getParameter("ref_cno"));
		
		comment c = new comment(bno, uno, ccontent, clevel, ref_cno);
		System.out.println("서블릿"+c);
		int result = new CommentService().insertComment(c);
		
		if(result > 0 ) {
			response.sendRedirect("selectOneRecipe.rcp?bno="+bno);
		}else {
			request.setAttribute("msg", "댓글 작성 실패");
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
