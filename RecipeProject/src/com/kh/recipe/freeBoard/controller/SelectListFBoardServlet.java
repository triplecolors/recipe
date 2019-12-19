package com.kh.recipe.freeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.common.PageInfo;
import com.kh.recipe.freeBoard.model.service.FreeBoardService;
import com.kh.recipe.freeBoard.model.vo.FreeBoard;

/**
 * Servlet implementation class SelectListFBoardServlet
 */
@WebServlet("/selectList.fb")
public class SelectListFBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectListFBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<FreeBoard> list = null;
		FreeBoardService fbs = new FreeBoardService();
		PageInfo pi = new PageInfo();
				if(request.getParameter("currentPage") != null) {
			pi.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}
				pi.calcPage(fbs.getListCount());
				
		list = fbs.selectList(pi);
		
			String page="";
		
		if(list !=null) {
			page="views/fboard/fBoardList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "자유게시판 조회 에러!");
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
