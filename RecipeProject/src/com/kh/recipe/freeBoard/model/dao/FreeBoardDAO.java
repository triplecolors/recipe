package com.kh.recipe.freeBoard.model.dao;

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

import com.kh.recipe.freeBoard.model.vo.FreeBoard;
import com.kh.recipe.notice.model.dao.NoticeBoardDAO;
import static com.kh.recipe.common.JDBCTemplate.*;
public class FreeBoardDAO {

private Properties prop = new Properties();
	
	public FreeBoardDAO() {
		String filePath = NoticeBoardDAO.class.getResource("/mappers/fBoard.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int insertBoard(Connection con, FreeBoard f) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, f.getUno());
			pstmt.setString(2, f.getpTitle());
			pstmt.setString(3, f.getpContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<FreeBoard> selectList(Connection con, int startRow , int endRow){
		ArrayList<FreeBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				FreeBoard f = new FreeBoard();
				
				f.setBno(rset.getInt("POSTNO"));
				f.setUno(rset.getInt("UNO"));
				f.setpType(rset.getString("PTYPE"));
				f.setpTitle(rset.getString("PTITLE"));
				f.setpContent(rset.getString("PCONTENT"));
				f.setpDate(rset.getDate("PDATE"));
				f.setpCount(rset.getInt("PCOUNT"));
				f.setpStatus(rset.getString("PSTATUS"));
				
				list.add(f);
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
	
	public FreeBoard selectOne(Connection con, int bno) {
		FreeBoard f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f = new FreeBoard();
				
				f.setBno(bno);
				f.setUno(rset.getInt("UNO"));
				f.setpType(rset.getString("PTYPE"));
				f.setpTitle(rset.getString("PTITLE"));
				f.setpContent(rset.getString("PCONTENT"));
				f.setpDate(rset.getDate("PDATE"));
				f.setpCount(rset.getInt("PCOUNT"));
				f.setpStatus(rset.getString("PSTATUS"));
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
	}
	
	public int updateBoard(Connection con, FreeBoard f) {
		int result= 0;
		PreparedStatement pstmt =null;
		
		String sql = prop.getProperty("updateOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, f.getpTitle());
			pstmt.setString(2, f.getpContent());
			pstmt.setInt(3, f.getBno());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
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
		
		String sql = prop.getProperty("listCount");
		
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
	
	
	
	
}
