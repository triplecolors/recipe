package com.kh.recipe.notice.model.service;

import static com.kh.recipe.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.recipe.common.PageInfo;
import com.kh.recipe.notice.model.dao.NoticeBoardDAO;
import com.kh.recipe.notice.model.vo.NoticeBoard;
import static com.kh.recipe.common.PageInfo.*;

public class NoticeBoardService {

	private NoticeBoardDAO nbdao = new NoticeBoardDAO();
	Connection con;
	public static PageInfo pi2 = new PageInfo();
	
	public int insertBoard(NoticeBoard n) {
		int result = 0;
		
		con = getConnection();
		System.out.println("DAO 넘기기전 확인 : " + n);
		result = nbdao.insertBoard(con, n);
		if(result>0) commit(con);
		else rollback(con);
		close(con);
		
		
		return result;
	}
	
	public NoticeBoard selectOne(int bno) {
		con = getConnection();
		
		NoticeBoard n = nbdao.selectOne(con, bno);
		
		if(n != null) commit(con);
		else rollback(con);
		
		close(con);
		
		
		return n;
		
	}
	
	public ArrayList<NoticeBoard> selectList(PageInfo pi) {
		con = getConnection();
		
		int rowNum[] = pi.getRowNum();
		
		ArrayList<NoticeBoard> list = nbdao.selectList(con, rowNum[0], rowNum[1]);
		
		close(con);
		
		
		return list;
	}
	
	
	public int updateBoard(NoticeBoard n) {
		int result = 0;
		con = getConnection();
		
		result = nbdao.updateBoard(con, n);
		
		if(result >0)commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int deleteBoard(int bno) {
		int result = 0;
		con = getConnection();
		
		result = nbdao.deleteBoard(con, bno);
		
		if(result >0)commit(con);
		else rollback(con);
		
		close(con);
		
		
		return result;
	}
	
	public int getListCount() {
		con = getConnection();
		
		int result = nbdao.getListCount(con);
		
		close(con);
		
		return result;
	}
	
	
	
}