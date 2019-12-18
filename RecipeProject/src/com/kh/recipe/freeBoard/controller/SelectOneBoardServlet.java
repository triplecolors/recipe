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
 * Servlet implementation class SelectOneBoardServlet
 */
@WebServlet("/selectOne.fb")
public class SelectOneBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int bnum =  Integer.parseInt(request.getParameter("bnum"));
		FreeBoard f = new FreeBoardService().selectOne(bno);
		f.setBnum(bnum);
		System.out.println(f);
		
		String page = "";
		
		if(f.getpDate()!=null) {
			page="views/fboard/fboardDetail.jsp";
			request.setAttribute("fboard", f);
		}else {
			page= "views/common/errorPage.jsp";
			request.setAttribute("msg", "자유게시판 상세보기 에러!");
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
