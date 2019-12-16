package com.kh.recipe.freeBoard.model.service;

import com.kh.recipe.common.PageInfo;
import com.kh.recipe.freeBoard.model.dao.FreeBoardDAO;
import com.kh.recipe.freeBoard.model.vo.FreeBoard;


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
		
		if(f!=null) commit(con);
		else rollback(con);
		
		close(con);
		
		return f;
	}
	
	
	
	public ArrayList<FreeBoard> selectList(PageInfo pi ){
	con = getConnection();
		
		int rowNum[] = pi.getRowNum();
		
		ArrayList<FreeBoard> list = fdao.selectList(con, rowNum[0], rowNum[1]);
		
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
	
	

}
