package com.kh.recipe.recipeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.recipe.recipeBoard.model.service.MenuSearchService;
import com.kh.recipe.recipeBoard.model.vo.Menu;

/**
 * Servlet implementation class MenuSearchServlet
 */
@WebServlet("/menuPage.do")
public class MenuSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String keywords = request.getParameter("menu").trim();
		
		String[] keywordArr = keywords.split(",");
		
		for(String menu : keywordArr) {
			
			System.out.println(menu);
			
		}
		
		// 서비스 가서 메뉴 가져올 예정 (공사 중)
		ArrayList<Menu> list = new ArrayList<>();
		list = new MenuSearchService().selectList(keywordArr);
		
		System.out.println("keywordArr (MenuSearchServlet 도착 했음): " + keywordArr); // 확인용.
		
		// 결과 확인 용, 삭제할 예정
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
		
		System.out.println("list(list 확인) : " + list);
		System.out.println("response(확인하기) : " + response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
