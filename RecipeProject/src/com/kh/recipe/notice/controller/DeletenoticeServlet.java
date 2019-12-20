package com.kh.recipe.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.recipe.notice.model.service.NoticeBoardService;
import com.kh.recipe.notice.model.vo.NoticeBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class DeleteBoardServlet
 */
@WebServlet("/delete.no")
public class DeletenoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletenoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String ntype = request.getParameter("ntype");
		NoticeBoardService nbs = new NoticeBoardService();
		
		int result = nbs.deleteBoard(bno);
		//System.out.println(ntype);
		
		if(result > 0) {
			
			if(ntype.contains("N")) {
				//System.out.println("공지사항으로 갑니다~");
				response.sendRedirect("selectList.no");
			}else {
				//System.out.println("건의사항으로 갑니다~");
				response.sendRedirect("selectList.su");
			}
		} else {
			
			request.setAttribute("msg", "게시글 삭제 실패!");
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
