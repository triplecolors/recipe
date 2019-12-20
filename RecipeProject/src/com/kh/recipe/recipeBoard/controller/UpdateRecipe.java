package com.kh.recipe.recipeBoard.controller;

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

import com.kh.recipe.BoardCommon.model.vo.Bfile;
import com.kh.recipe.common.MyRenamePolicy;
import com.kh.recipe.recipeBoard.model.service.RecipeService;
import com.kh.recipe.recipeBoard.model.vo.Recipe;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateRecipe
 */
@WebServlet("/update.rcp")
public class UpdateRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRecipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "폼 태그에 '멀티파트 인코딩 타입'을 추가해주세요~ : <form enctype='multipart/form-data'>");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		RecipeService rs = new RecipeService();
		int maxSize = 1024 * 1024 * 10;
		
		String savePath = request.getServletContext().getResource("/resources/RecipeBoardImages/").getPath();
		
		MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyRenamePolicy());
		
		int bno = Integer.parseInt(mre.getParameter("bno"));
		
		HashMap<String, Object> originRecipe = rs.selectOne(bno);
		

		ArrayList<String> saveFiles = new ArrayList<String>();
		ArrayList<String> originFiles = new ArrayList<String>();
		
		// form으로 전달된 다중 파일 업로드
		Enumeration<String> files = mre.getFileNames();
		
		while (files.hasMoreElements()) {
			String name = files.nextElement();

			saveFiles.add(mre.getFilesystemName(name));
			originFiles.add(mre.getOriginalFileName(name));
		}
		
		Recipe rcp = (Recipe) originRecipe.get("Recipe");

		rcp.setRtitle(mre.getParameter("rtitle"));
		rcp.setRcontent(mre.getParameter("rcontent"));
		rcp.setRvideo(mre.getParameter("rvideo"));
		rcp.setRkind(Integer.parseInt(mre.getParameter("rkind")));
		rcp.setRsituation(Integer.parseInt(mre.getParameter("rsituation")));
		rcp.setRway(Integer.parseInt(mre.getParameter("rway")));
		rcp.setRingred(Integer.parseInt(mre.getParameter("ringred")));
		rcp.setRtime(Integer.parseInt(mre.getParameter("rtime")));
		rcp.setRlevel(Integer.parseInt(mre.getParameter("rlevel")));		
		rcp.setRsource(mre.getParameter("rsource"));
		rcp.setRprocess(mre.getParameter("rprocess"));
		rcp.setRtip(mre.getParameter("rtip"));
		rcp.setRgoods(mre.getParameter("rgoods"));
		System.out.println(rcp);
		
		System.out.println(saveFiles.size());
		// Attachment(DB 테이블 말하는 겁니다.)에 기록할 파일 리스트 생성하기
		ArrayList<Bfile> fList = new ArrayList<Bfile>();
		// 스택구조로 왔다가 나감
		for (int j = saveFiles.size() - 1; j > -1 ; j--) {
			// 3 2 1 0 
			// 역순으로 들어왔던 파일 재정렬하기
			if(saveFiles.get(j) == null) continue;
			Bfile bf = new Bfile();
			
			bf.setFpath(savePath);
			bf.setFname(saveFiles.get(j));
			bf.setFlevel(saveFiles.size() - 1 - j);
			
			System.out.println("bf 확인 : "+ bf);
			fList.add(bf);
		}
		ArrayList<Bfile> list = (ArrayList<Bfile>) originRecipe.get("Bfile");
		int result = rs.updateRecipe(rcp, fList);
		
		if(result>0) {
			response.sendRedirect("selectOneRecipe.rcp?bno="+bno);
			// 성공했다면 [이전 파일] 모두 삭제하기
		}else {
			request.setAttribute("msg", "파일 전송 및 수정 실패");
			// 실패했다면 [새로 등록한 파일] 모두 삭제하기
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
