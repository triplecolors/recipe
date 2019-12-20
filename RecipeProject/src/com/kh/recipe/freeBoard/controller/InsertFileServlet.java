package com.kh.recipe.freeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.kh.recipe.common.MyRenamePolicy;
import com.kh.recipe.freeBoard.model.vo.FreeBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertFileServlet
 */
@WebServlet("/fiinsert.fb")
public class InsertFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "멀티파트 전송이 아닙니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} 
		
		int maxSize = 1024 * 1024 * 10;
		
		String savePath = request.getServletContext().getRealPath("/resources/FreeBoardFiles/");
		
		MultipartRequest mr = new MultipartRequest(
													request, 
													savePath,
													maxSize,
													"UTF-8",
													new MyRenamePolicy());
		
		Enumeration<String> files = mr.getFileNames(); 
		
		String uploadPath="";
		
		String name = files.nextElement();
		String fileName = mr.getFilesystemName(name);
		
		String serverPath = "http://192.168.20.156:8088/recipe/resources/FreeBoardFiles/"; 
		
		System.out.println(serverPath);
		
		uploadPath = serverPath + fileName;
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(uploadPath, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
