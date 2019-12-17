package com.kh.recipe.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kh.recipe.notice.model.service.NoticeBoardService;
import com.kh.recipe.notice.model.vo.NoticeBoard;

/**
 * Servlet implementation class SelectOneBoardServlet
 */
@WebServlet("/selectOne.no")
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
		// TODO Auto-generated method stub
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		NoticeBoard n = new NoticeBoardService().selectOne(bno);
		
		System.out.println(n);
	
		String page="";
		
		if(n !=null) {
			page="views/notice/noticeDetail.jsp";
			request.setAttribute("notice", n);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 에러!!");
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
