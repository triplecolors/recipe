package com.kh.recipe.recipeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.recipeBoard.model.service.RecipeService;
import com.kh.recipe.recipeBoard.model.vo.Recipe;

/**
 * Servlet implementation class MyPageRecipeServlet
 */
@WebServlet("/myrecipe.se")
public class MyPageRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageRecipeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uno = Integer.parseInt(request.getParameter("uno"));
		ArrayList<Recipe> list = null;
		list = new RecipeService().myPageRecipe(uno);
		
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			
			page="views/mypage/myPageRecipe.jsp";
		}else {
			request.setAttribute("msg", "회원 정보 수정 중 에러가 발생하였습니다.");
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
