package com.kh.recipe.recipeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.common.PageInfo;
import com.kh.recipe.recipeBoard.model.service.MenuSearchService;
import com.kh.recipe.recipeBoard.model.vo.Menu;

/**
 * Servlet implementation class SelectListMenu
 */
@WebServlet("/selectList.do")
public class SelectListMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectListMenu() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Menu> list = null;
		MenuSearchService mss = new MenuSearchService();
		
		// -- 페이징 처리 (데이터를 일정량 씩 끊어서 읽어오는 기술) -- //
		
		int startPage;
		// 각 페이지들의 시작점 (1, 2, 3, . . . 10/ 11, 12, 13 . . . 20)
		int endPage;
		// 각 페이지들의 종료지점
		int maxPage;
		// 전체 게시글 기준 마지막 페이지
		int currentPage;
		// 현재 페이지
		int limit;
		// 페이지도 10개 씩, 게시글도 10개 씩 (재한)
		
		// 게시판은 첫페이지가 항상 1로 시작한다.
		currentPage = 1;
		
		// 한 번에 표시할 내용
		limit = 10;
		
		// 만약에 사용자가 현재 페이지의 정보를 가지고 있다면,
		// 해당 정보 가져오기
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 게시글 수
		int listCount = mss.getListCount();
		
		System.out.println("전체 게시글 수 : " + listCount);
	
		// 페이지 처리 로직 작성
		
		// 1. 마지막 페이지 계산하기
		// 13 / 10 . . . 1.3 + 0.9 = 2.2 --> 2페이지
		// 10 / 10 . . . 1.0 + 0.9 = 1.9 --> 1페이지
		maxPage = (int)((double)listCount/limit + 0.9); // 1하게되면 숫자가 차기가나기때문에 정확한 페이징 처리가 안될수있어서 0.1 모자르게 진행하여 정확한 페이징 처리 진행
		
		// 2. 시작페이지, 끝 페이지 구하기
		// 1 ~ 10 ---> 1, 10 / 11 ~ 20 ---> 11, 20
		//   7 ------> 1, 10
		//   7/10 ---> 0.7 + 0.9 --> 1.6 ---> 1 * limit(10) + 1 // 11
		//   15/10 --> 1.5 + 0.9 --> 2.4 ---> 2 * limit(10) + 1 // 21
		startPage = (int)((double)currentPage/limit + 0.9) * limit - 9;
		
		endPage = startPage + limit - 1;
		
		// 만약에 maxPage가 endPage보다 작다면..?
		// 1 ~ 10 / 4페이지가 끝이라면..?
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		list = mss.selectList(currentPage, limit);
		
		String page = "";
		
		if(list != null) {
			
			PageInfo pi = new PageInfo(startPage, endPage,
						  maxPage, currentPage, limit, listCount);
			
			page = "views/test/menuList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 목록 조회 에러!");
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
