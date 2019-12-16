package com.kh.recipe.msg.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.recipe.msg.model.service.MsgService;
import com.kh.recipe.msg.model.vo.Msg;

/**
 * Servlet implementation class MsgSendServlet
 */
@WebServlet("/sendmsg.sm")
public class MsgSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MsgSendServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		int mSender = Integer.parseInt(request.getParameter("mSender"));
		int mReceiver = Integer.parseInt(request.getParameter("mReceiver"));
		String mContent = request.getParameter("mContent");
		
		Msg smsg = new Msg(mSender, mReceiver, mContent);
		
		
		MsgService ms = new MsgService();
		
		int result  = ms.sendMsg(smsg);
		
		String page = "";
		
		
		if(result > 0) {
			page ="views/myPage/myPageMsgWriteForm.jsp";
			
					request.setAttribute("msg", smsg);
		
		} else {
			
			response.sendRedirect("views/common/errorPage.jsp");
			
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
