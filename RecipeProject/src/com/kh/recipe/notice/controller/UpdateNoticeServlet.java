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
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UpdateBoardServlet
 */
@WebServlet("/nUpdate.no")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		NoticeBoardService nb = new NoticeBoardService();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String ntype = request.getParameter("ntype");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		NoticeBoard n = new NoticeBoard(title,content);
		n.setBno(bno);
		System.out.println("수정내용 확인 : " + n);
		
		int result = nb.updateBoard(n);
		
		
		//System.out.println("목적지 분류 확인 , ntype :  " + ntype);
		if( result > 0) {
			if(ntype.contains("N")) {
				//System.out.println("공지사항으로 갑니다~");
				response.sendRedirect("selectList.no");
			}else {
				//System.out.println("건의사항으로 갑니다~");
				response.sendRedirect("selectList.su");
			}
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
