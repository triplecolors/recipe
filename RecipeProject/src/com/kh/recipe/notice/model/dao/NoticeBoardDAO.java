package com.kh.recipe.notice.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.recipe.notice.model.vo.NoticeBoard;
import static com.kh.recipe.common.JDBCTemplate.*;


public class NoticeBoardDAO {
	
	private Properties prop = new Properties();
	
	public NoticeBoardDAO() {
		String filePath = NoticeBoardDAO.class.getResource("/mappers/nBoard.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int insertBoard(Connection con, NoticeBoard n) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNotice");
		System.out.println("DAO DB 연결전");
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, n.getUno());
			pstmt.setString(2, n.getnType());
			pstmt.setString(3, n.getnTitle());
			pstmt.setString(4, n.getnContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("DAO DB 연결후 결과  : " + result );
		
		return result;
	}
	
	public ArrayList<NoticeBoard> selectList(Connection con, int startRow , int endRow){
		ArrayList<NoticeBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				NoticeBoard n = new NoticeBoard();
				
				n.setBno(rset.getInt("BNO"));
				n.setUno(rset.getInt("UNO"));
				n.setnType(rset.getString("NTYPE"));
				n.setnTitle(rset.getString("NTITLE"));
				n.setnContent(rset.getString("NCONTENT"));
				n.setnDate(rset.getDate("NDATE"));
				n.setnStatus(rset.getString("NSTATUS"));
				n.setBnum(rset.getInt("RNUM"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
	}
	
	public NoticeBoard selectOne(Connection con, int bno) {
		NoticeBoard n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt= con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new NoticeBoard();
				
				n.setBno(bno);
				n.setUno(rset.getInt("UNO"));
				n.setnType(rset.getString(3));
				n.setnTitle(rset.getString(4));
				n.setnContent(rset.getString(5));
				n.setnDate(rset.getDate(6));
				n.setnStatus(rset.getString(7));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return n;
		
	}
	
	public int updateBoard(Connection con , NoticeBoard n) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setInt(3, n.getBno());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
	
	public int deleteBoard(Connection con, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		
		
		
		return result;
	}

	public int getListCount(Connection con) {
		int result = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount_S");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	public ArrayList<NoticeBoard> selectList_S(Connection con, int startRow, int endRow) {
		ArrayList<NoticeBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList_S");
		
		try {
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				NoticeBoard n = new NoticeBoard();
				
				n.setBno(rset.getInt("BNO"));
				n.setUno(rset.getInt("UNO"));
				n.setnType(rset.getString("NTYPE"));
				n.setnTitle(rset.getString("NTITLE"));
				n.setnContent(rset.getString("NCONTENT"));
				n.setnDate(rset.getDate("NDATE"));
				n.setnStatus(rset.getString("NSTATUS"));
				n.setBnum(rset.getInt("RNUM"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
	}
	
	
	
}
