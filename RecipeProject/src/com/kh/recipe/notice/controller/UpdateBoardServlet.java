package com.kh.jsp.board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UpdateBoardServlet
 */
@WebServlet("/update.bo")
public class UpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 저장할 폴더가 있는지 확인 ( O / X )
		// 2. multipart 형태로 전송되었는지 확인 ( O / X )
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "멀티파트 형태로 보내세요");
			request.getRequestDispatcher("views/common/errorPage.jsp")
				   .forward(request, response);
		}
		
		// -- 파일 업로드 통신 시작! -- //
		
		// 1. 전송할 파일 최대 사이즈 설정하기
		int maxSize = 1024 * 1024 * 10;
		
		// 2. 저장할 폴더의 최상위 경로 가져오기(C:/program . . / .. /)
		String root = request.getServletContext().getRealPath("/");
		
		String savePath = root + "resources/bUpFiles";
		
		// 3. request -> MultipartRequest
		MultipartRequest mre = new MultipartRequest(
					request,
					savePath,
					maxSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
				);
		
		// 4. 수정 기능 작성하기
		
		BoardService bs = new BoardService();
		
		int bno = Integer.parseInt(mre.getParameter("bno"));
		
		Board b = bs.updateView(bno);
		
		String title = mre.getParameter("title");
		String content = mre.getParameter("content");
		
		b.setBtitle(title);
		b.setBcontent(content);
		
		String fileName = mre.getFilesystemName("bfile");
		// bfile에 등록한 파일을 savePath에 저장하며, 해당 
		// 파일명을 가져온다.
		// 만약 등록한 파일이 없다면 null을 가져온다.
		
		if( fileName != null ) {
			File oldFile = new File(savePath + "/" + b.getBfile());
			
			oldFile.delete();
			
			b.setBfile(fileName);
		}
		
		int result = bs.updateBoard(b);
		
		if( result > 0) {
			response.sendRedirect("selectList.bo");
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
