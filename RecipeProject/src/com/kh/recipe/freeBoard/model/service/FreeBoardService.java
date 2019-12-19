package com.kh.recipe.freeBoard.model.service;

import com.kh.recipe.common.GetUserNameDAO;
import com.kh.recipe.common.PageInfo;
import com.kh.recipe.freeBoard.model.dao.FreeBoardDAO;
import com.kh.recipe.freeBoard.model.vo.FreeBoard;
import com.kh.recipe.notice.model.vo.NoticeBoard;

import static com.kh.recipe.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class FreeBoardService {
	
	private FreeBoardDAO fdao = new FreeBoardDAO();
	Connection con;
	
	public int insertBoard(FreeBoard f) {
		int result = 0;
		con = getConnection();
		
		result = fdao.insertBoard(con,f);
		
		if(result > 0 ) commit(con);
		else rollback(con);
				
		close(con);
				
		return result;
	}
	
	public FreeBoard selectOne(int bno) {
		con = getConnection();
		
		FreeBoard f = fdao.selectOne(con,bno);
		
		f.setWriter(new GetUserNameDAO().getOneName(con, f.getUno()));
		
		int result = 0;
		
		if(f!=null) {
			result = fdao.addReadCount(con,bno);
		}
		
		if(result>0)commit(con);
		else rollback(con);
		
		close(con);
		
		return f;
	}
	
	
	
	public ArrayList<FreeBoard> selectList(PageInfo pi ){
	con = getConnection();
		
		
		
		ArrayList<FreeBoard> list = fdao.selectList(con, pi.getStartRow(), pi.getEndRow());
		
		for(int i = 0;i<list.size();i++) {
			list.get(i).setWriter(new GetUserNameDAO().getOneName(con, list.get(i).getUno()));
		}
		
		
		close(con);
		
		
		return list;
	}
	
	public int updateBoard(FreeBoard n) {
		int result = 0;
		con = getConnection();
		
		result = fdao.updateBoard(con, n);
		
		if(result >0)commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int deleteBoard(int bno) {
		int result = 0;
		con = getConnection();
		
		result = fdao.deleteBoard(con, bno);
		
		if(result >0)commit(con);
		else rollback(con);
		
		close(con);
		
		
		return result;
	}
	
	
	
	
	public int getListCount() {
		con = getConnection();
		
		int result = fdao.getListCount(con);
		
		close(con);
		
		return result;
	}
	
	public FreeBoard updateView(int bno) {
		con = getConnection();
		
		FreeBoard f = fdao.selectOne(con, bno);
		
		close(con);
		
		return f;
	}
	

}
