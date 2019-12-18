package com.kh.recipe.recipeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
		int part = 0;
		String keywords = request.getParameter("menu").trim();
		String word = request.getParameter("word").trim();
		System.out.println(word);
		String[] keywordArr = keywords.split(",");
		
		if(word.length() == 0 && keywordArr[0].length() == 0) {
			part = 0;
			System.out.println("전체 검색");
		} else if (word.length() == 0) {
			part = 1;
			System.out.println("카테 검색");
		} else if (keywordArr[0].length() == 0) {
			part = 2;
			System.out.println("단어 검색");
		} else {
			part = 3;
			System.out.println("단어 + 카테 검색");
		}
		
		// 서비스 가서 메뉴 가져올 예정 (공사 중)
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		list = new MenuSearchService().selectList(keywordArr, word, part);
		
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
