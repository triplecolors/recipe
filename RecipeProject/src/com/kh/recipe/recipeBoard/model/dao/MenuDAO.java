package com.kh.recipe.recipeBoard.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.recipe.recipeBoard.model.vo.Menu;
import static com.kh.recipe.common.JDBCTemplate.*;
public class MenuDAO {
	private Properties prop = new Properties();
	
	public MenuDAO() {
		try {
			prop.load(new FileReader(MenuDAO.class.getResource("/mappers/menuPage.properties").getPath()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Menu> selectSearchList(Connection con, String[] keywordArr) {
		ArrayList<Menu> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchList");
		
		// 미완성 쿼리 마저 완성하기
		String plusSql = ""; // appender
		String[] columArr = {"RKIND IN (", "RSITUATION IN (", "RWAY IN (", "RINGRED IN ("};
		for (int j = 0; j < 4; j++) {
			plusSql += columArr[j];
			for(int i = 0 ; i < keywordArr.length; i++) {
				if(keywordArr.length == 1 || i == keywordArr.length - 1) {
					plusSql += keywordArr[i] + ")";
				} else {
					plusSql += keywordArr[i] + ", ";
				}
			}
			if(j<3) {
				plusSql += " OR ";
			}
		}
		
		sql += plusSql + " ORDER BY RTITLE";
		
		System.out.println("sql : " + sql);
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<>();
			while(rset.next()) {
				
				Menu ms = new Menu();
			
				ms.setRno(rset.getInt("RNO"));
				ms.setBno(rset.getInt("BNO"));
				ms.setUno(rset.getInt("UNO"));
				ms.setRtitle(rset.getString("RTITLE"));
				ms.setRsource(rset.getString("RSOURCE"));
				ms.setRprocess(rset.getString("RPROCESS"));
				ms.setRdate(rset.getDate("RDATE"));
				ms.setRgoods(rset.getString("RGOODS"));
				ms.setRcontent(rset.getString("rcontent"));
				ms.setRvideo(rset.getString("RVIDEO"));
				ms.setRkind(rset.getInt("RKIND"));
				ms.setRsituation(rset.getInt("RSITUATION"));
				ms.setRway(rset.getInt("RWAY"));
				ms.setRingred(rset.getInt("RINGRED"));
				ms.setRtime(rset.getInt("RTIME"));
				ms.setRlevel(rset.getInt("RLEVEL"));
				ms.setRtip(rset.getString("RTIP"));
				ms.setRstatus(rset.getString("RSTATUS"));
				
				list.add(ms);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;		
	}

		public int insertMenu(Connection con, Menu m) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertMenu");
			
			try {
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, m.getRtitle());
				pstmt.setString(2,  m.getRsource());
				pstmt.setString(3, m.getRprocess());
				pstmt.setString(4, m.getRgoods());
				pstmt.setString(5, m.getRcontent());
				pstmt.setString(6, m.getRvideo());
				pstmt.setInt(7, m.getRtime());
				pstmt.setInt(8, m.getRlevel());
				pstmt.setString(9, m.getRtip());
		
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		public int selectCurrentRno(Connection con) {
			int result = 0;
			Statement stmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectCurrentRno");
			
			try {
				
				stmt = con.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					result = rset.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
			return result;
		}

		public ArrayList<Menu> selectList(Connection con, int startRow, int endRow) {
			ArrayList<Menu> list = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectList");
			
			try {
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, endRow);
				pstmt.setInt(1, startRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<>();
				while(rset.next()) {
					Menu m = new Menu();
					
					m.setRno(rset.getInt("rno"));
					m.setBno(rset.getInt("bno"));
					m.setUno(rset.getInt("uno"));
					m.setRtitle(rset.getString("4"));
					m.setRsource(rset.getString("5"));
					m.setRprocess(rset.getString("6"));
					m.setRdate(rset.getDate("7"));
					m.setRgoods(rset.getString("8"));
					m.setRcontent(rset.getString("9"));
					m.setRvideo(rset.getString("10"));
					m.setRkind(rset.getInt("11"));
					m.setRsituation(rset.getInt("12"));
					m.setRway(rset.getInt("13"));
					m.setRingred(rset.getInt("14"));
					m.setRtime(rset.getInt("15"));
					m.setRlevel(rset.getInt("16"));
					m.setRtip(rset.getString("17"));
					m.setRstatus(rset.getString("18"));
					
					list.add(m);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
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
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return result;
		}
		
		
}






















