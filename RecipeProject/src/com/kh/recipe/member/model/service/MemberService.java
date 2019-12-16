package com.kh.recipe.member.model.service;

import java.sql.Connection;
import static com.kh.recipe.common.JDBCTemplate.*;

import com.kh.recipe.member.model.dao.MemberDAO;
import com.kh.recipe.member.model.vo.Member;

// Service : Commit처리
public class MemberService {
	private MemberDAO mDao = new MemberDAO();
	private Connection con;

	public Member selectOne(Member m) {
		con = getConnection();
		Member result = null;
		
		result = mDao.selectOneMember(con,m);
		
		if (result != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int insertMember(Member m) {
		// 준비
		int result = 0;
		// con Open
		con = getConnection();
		
		// 실행
		result = mDao.insertMember(con,m);
		
		// commit처리
		if (result > 1) {
			commit(con);
		} else {
			rollback(con);
		}
		// con Close
		close(con);
		
	 	return result;
	}

   
}
