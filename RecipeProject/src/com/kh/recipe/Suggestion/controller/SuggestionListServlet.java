package com.kh.recipe.Suggestion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.common.PageInfo;
import com.kh.recipe.notice.model.service.NoticeBoardService;
import com.kh.recipe.notice.model.vo.NoticeBoard;

/**
 * Servlet implementation class SuggestionListServlet
 */
@WebServlet("/selectList.su")
public class SuggestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestionListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<NoticeBoard> list = null;
		NoticeBoardService nbs = new NoticeBoardService();
		PageInfo pi = new PageInfo();
		
		if(request.getParameter("currentPage") != null) {
			pi.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}
		System.out.println("건의사항글 게시수 : " + nbs.getListCount_S());
		pi.calcPage(nbs.getListCount_S());
		list = nbs.selectList_S(pi);
		//System.out.println(list);
		String page= "";
		
		if(list != null) {
			page = "views/notice/suggestListForm.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 목록 조회 에러");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
