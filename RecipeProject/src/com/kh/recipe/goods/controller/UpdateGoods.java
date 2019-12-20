package com.kh.recipe.goods.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.recipe.common.MyRenamePolicy;
import com.kh.recipe.goods.model.service.GoodsService;
import com.kh.recipe.goods.model.vo.Goods;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateGoods
 */
@WebServlet("/update.gs")
public class UpdateGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGoods() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿은 왔어요");
		GoodsService gs = new GoodsService();
		// 멀티파트
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "멀티파트 전송이 아닙니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		int maxSize = 1024 * 1024 * 10;
		
		String savePath = request.getServletContext().getRealPath("/resources/GoodsImages/");
		
		MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyRenamePolicy());
		
		// 이전 상품 정보 가져오기
		int pcid = Integer.parseInt(mre.getParameter("pcid"));
		
		Goods gd = gs.selectOne(pcid);

		// 변경사항 덮어 씌우기
		gd.setPcname(mre.getParameter("pcname"));
		gd.setPcgtype(Integer.parseInt(mre.getParameter("pcgtype")));
		gd.setPcurl(mre.getParameter("pcurl"));
		System.out.println(gd);
		
		ArrayList<String> saveFiles = new ArrayList<>();
		
		// Iterator의 조상(쓰레드세잎 기능 등 때문에 좀 더 안전하다..)을 사용하여 
		// 폼(사용자가)이 전송한 파일의 이름들을 불러온다. 
		Enumeration<String> files = mre.getFileNames();
		while (files.hasMoreElements()) {
			// 파일 이름을 통해 실제 파일을 저장하며 DB에 전달할 
			// changeName / originName을 각각 꺼낸다.
			String name = files.nextElement();
			
			System.out.println("전달 받은 파일명 : "+name);
			
			saveFiles.add(mre.getFilesystemName(name));
		}
		System.out.println("파일명 : "+saveFiles);
		
		
		
		// Attachment(DB 테이블 말하는 겁니다.)에 기록할 파일 리스트 생성하기
		// 스택구조로 왔다가 나감
		for (int j = saveFiles.size() - 1; j > -1 ; j--) {
			// 3 2 1 0 
			// 역순으로 들어왔던 파일 재정렬하기
			if(saveFiles.get(j) == null) continue;
			
			gd.setPcfpath(savePath);
			gd.setPcfname(saveFiles.get(j));
		}
		System.out.println(gd);
		
		// 업데이트 시키기
		int result = gs.updateProduct(gd);
		
		if(result > 1) {
			response.sendRedirect("views/goods/goods.jsp");
			System.out.println("성공");
		}else {
			request.setAttribute("msg", "상품 수정 실패!");
			for (int j = 0; j < saveFiles.size(); j++) {
				File f = new File(savePath + saveFiles.get(j));
				System.out.println("파일 삭제 확인 : "+ f.delete());
			}
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
