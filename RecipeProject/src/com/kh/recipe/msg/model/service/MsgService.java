package com.kh.recipe.msg.model.service;


import java.sql.Connection;

import com.kh.recipe.msg.model.dao.MsgDao;
import com.kh.recipe.msg.model.vo.Msg;

import static com.kh.recipe.common.JDBCTemplate.*;

public class MsgService {
	
	private MsgDao mDao = new MsgDao();
	Connection con;
	
	public int sendMsg(Msg smsg) {
		con = getConnection();
		
		int result = mDao.sendMsg(con, smsg);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int receiveMsg(Msg rmsg) {
		con = getConnection();
		
		int result = mDao.receiveMsg(con, rmsg);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}



	
	

}
