package com.kh.recipe.BCOMMENT.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.recipe.common.JDBCTemplate.*;
import com.kh.recipe.BCOMMENT.model.vo.comment;

public class CommentDAO {
	private Properties prop = new Properties();
	
	public CommentDAO() {
		String filePath = CommentDAO.class
						.getResource("/mappers/comment.properties")
						.getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int insertComment(Connection con, comment c) {
		int result = 0;
		PreparedStatement pstmt = null;

		System.out.println(c);
		String sql = prop.getProperty("insertComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, c.getBno());
			pstmt.setInt(2, c.getUno());
			pstmt.setString(3, c.getCcontent());
			pstmt.setInt(4, c.getClevel());

			System.out.println(c);
			if(c.getRef_cno() > 0) {
				pstmt.setInt(5, c.getRef_cno());
			}else {
				pstmt.setNull(5, 0);
			}
			
			result = pstmt.executeUpdate();

			System.out.println(c);
			}catch(SQLException e) {
				e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<comment> selectList(Connection con, int bno) {
		ArrayList<comment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				/*
				 * // 생성자에 변수 넣기 방법 
				 * int cno = rset.getInt("cno"); 
				 * bno = rset.getInt("bno"); 
				 * int uno = rset.getInt("uno"); 
				 * String ccontent = rset.getString("ccontent"); 
				 * int clevel = rset.getInt("clevel"); 
				 * int ref_cno = rset.getInt("ref_cno"); 
				 * Date cdate = rset.getDate("cdate"); 
				 * String cstatus = rset.getString("cstatus");
				 * String unick = rset.getString("unick");
				 * 
				 * comment c = new comment(cno, bno, uno, ccontent, clevel, ref_cno, cdate, cstatus, unick);
				 */
				
				// 객체 먼저 만들고 setting 해주기
				comment c = new comment();
				
				c.setCno(rset.getInt("cno"));
				c.setBno(bno);
				c.setUno(rset.getInt("uno"));
				c.setCcontent(rset.getString("CCONTENT"));
				c.setRef_cno(rset.getInt("ref_cno"));
				c.setCstatus(rset.getString("cstatus").trim());
				c.setUnick(rset.getString("unick"));
				c.setClevel(rset.getInt("clevel"));
				c.setCdate(rset.getDate("cdate"));
				
				list.add(c);
			}
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int deleteComment(Connection con, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,  cno);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
