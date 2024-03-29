package com.kh.recipe.recipeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.BCOMMENT.model.service.CommentService;
import com.kh.recipe.BCOMMENT.model.vo.comment;
import com.kh.recipe.recipeBoard.model.service.RecipeService;

/**
 * Servlet implementation class UpdateView
 */
@WebServlet("/selectOneRecipe.rcp")
public class SelectOneRecipe2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneRecipe2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		HashMap<String, Object> hmap = new RecipeService().selectOne(bno);
		
		ArrayList<comment> clist
		 = new CommentService().selectList(bno);
		
		String page = "";
		
		if(hmap != null) {
			page = "views/recipe/test2.jsp?bno="+bno;
			request.setAttribute("Recipe", hmap.get("Recipe"));
			request.setAttribute("fileList", hmap.get("Bfile"));
			request.setAttribute("clist", clist);
			
			System.out.println(hmap.get("Recipe"));
			System.out.println(hmap.get("Bfile"));
			System.out.println(clist);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사진 게시판 수정 화면 오류");
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
