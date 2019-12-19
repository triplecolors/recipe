package com.kh.recipe.hidden;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.google.gson.Gson;
import com.kh.recipe.hidden.battleShipGame.controller.Point;
import com.kh.recipe.hidden.battleShipGame.controller.SetLocation;
import com.kh.recipe.hidden.battleShipGame.view.GameScreen;
import com.kh.recipe.hidden.battleShipGame.view.Menu;

/**
 * Servlet implementation class GameConnection
 */
@WebServlet("/battleship.gm")
public class GameConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameConnection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<StringBuilder[]> list = null;
		ArrayList<StringBuilder[]> list2 = null;
		ArrayList<Point[]> target= new ArrayList<>();
		GameScreen gs = new GameScreen();
		
		if(session.getAttribute("list")==null) {
			// 게임 기본판 저장
			list = gs.MainScreen(new Menu());
		}else {
			list = (ArrayList<StringBuilder[]>) session.getAttribute("list");
		}
		if(session.getAttribute("target")==null) {
			// 타겟 좌표값 저장
			target = gs.randomLocation();
		}else {
			target = (ArrayList<Point[]>) session.getAttribute("target");
		}
		
		
	
		
		
		int x = Integer.parseInt(request.getParameter("x"));
		int y = Integer.parseInt(request.getParameter("y"));
		
		

		list.set(0, gs.playerInput(x, y,list));
		
		System.out.println(list);
		System.out.println(target.get(0));
		System.out.println(target.get(1));
		System.out.println("x : " + x + "/" +"y : " +y);
		
		session.setAttribute("list",list);
		session.setAttribute("target", target);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
