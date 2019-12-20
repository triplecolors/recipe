package com.kh.recipe.BCOMMENT.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.recipe.common.JDBCTemplate.*;
import com.kh.recipe.BCOMMENT.model.dao.CommentDAO;
import com.kh.recipe.BCOMMENT.model.vo.comment;

public class CommentService {
	
	Connection con;
	private CommentDAO cdao = new CommentDAO();

	public int insertComment(comment c) {
		con = getConnection();
		System.out.println(c);
		int result = cdao.insertComment(con, c);
		
		if( result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<comment> selectList(int bno) {
		con = getConnection();
		
		ArrayList<comment> list = cdao.selectList(con, bno);
		
		close(con);
		
		return list;
	}

	public int deleteComment(int cno) {
		con = getConnection();
		
		int result = cdao.deleteComment(con, cno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
