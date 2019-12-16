package com.kh.recipe.msg.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.recipe.msg.model.service.MsgService;
import com.kh.recipe.msg.model.vo.Msg;

/**
 * Servlet implementation class MsgReceiveServlet
 */
@WebServlet("/receivemsg.rm")
public class MsgReceiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MsgReceiveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mSender = Integer.parseInt(request.getParameter("mSender"));
		int mReceiver = Integer.parseInt(request.getParameter("mReceiver"));
		String mType = request.getParameter("mType");
		String mContent = request.getParameter("mContent");
		String mRecvDate = request.getParameter("mRecvDate");
		
		
		Msg rmsg = new Msg();
		
		MsgService ms= new MsgService();
		
		int result = ms.receiveMsg(rmsg);
		
		String page = "";
		
		if(result > 0) {
			page = "views/myPage/myPageMsgReceive";
			
			request.setAttribute("msg", rmsg);
		} else {
			
			response.sendRedirect("view/common/errorPage.jsp");
		}
		request.getRequestDispatcher(page)
						.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
