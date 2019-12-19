package com.kh.recipe.goods.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.goods.model.service.GoodsService;
import com.kh.recipe.goods.model.vo.Goods;

/**
 * Servlet implementation class SelectOneProduct
 */
@WebServlet("/selectOne.gs")
public class SelectOneProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿");
		int pcid = Integer.parseInt(request.getParameter("pcid"));
		Goods gd = new GoodsService().selectOne(pcid);
		
		String page = "";
		if(gd != null) {
			page = "views/goods/goodsUpdate.jsp";
			request.setAttribute("goods", gd );
			System.out.println("성공");
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 수정 실패!");
			System.out.println("실패");
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
