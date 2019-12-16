package com.kh.recipe.recipeBoard.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.recipe.BoardCommon.model.vo.Bfile;
import com.kh.recipe.recipeBoard.model.vo.Recipe;

import static com.kh.recipe.common.JDBCTemplate.*;

public class RecipeDAO {
	private Properties prop = new Properties();
	public RecipeDAO() {
		try {
			prop.load( new FileReader(RecipeDAO.class.getResource("/mappers/recipe.properties").getPath()));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("prop파일을 못찾았어요!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("prop IO에서 문제가 생겼어요!");
		}
	}

	public int insertRecipe(Connection con, Recipe rcp) {
		int result = 0;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		try {
			// pstmt = con.prepareStatement(prop.getProperty("insertThumbnail"));
			stmt = con.createStatement();
			result = stmt.executeUpdate("INSERT INTO board VALUES(SEQ_BNO.nextval, 1)");
			commit(con);
			pstmt = con.prepareStatement("INSERT INTO recipe VALUES(SEQ_RNO.nextval, SEQ_BNO.currval, ?, ?, ?, ?, DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'N')");
						
			pstmt.setInt(1, rcp.getUno());
			pstmt.setString(2, rcp.getRtitle());
			pstmt.setString(3, rcp.getRsource());
			pstmt.setString(4, rcp.getRprocess());
			pstmt.setString(5, rcp.getRgoods());
			pstmt.setString(6, rcp.getRcontent());
			pstmt.setString(7, rcp.getRvideo());
			pstmt.setInt(8, rcp.getRkind());
			pstmt.setInt(9, rcp.getRsituation());
			pstmt.setInt(10, rcp.getRway());
			pstmt.setInt(11, rcp.getRingred());
			pstmt.setInt(12, rcp.getRtime());
			pstmt.setInt(13, rcp.getRlevel());
			pstmt.setString(14, rcp.getRtip());
			result += pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DAO에서 에러 발생!!");
		} finally {
			close(pstmt);
		}
		return result;
	}

	public HashMap<String, Object> selectOne(Connection con, int bno) {
		HashMap<String, Object> hmap = null;
		Recipe r = null;
		ArrayList<Bfile> fList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("selectOne"));
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			fList = new ArrayList<Bfile>();
			
			while(rset.next()) {
				
				r = new Recipe();
				r.setRno(rset.getInt("RNO"));
				r.setBno(bno);
				r.setUno(rset.getInt("UNO"));
				r.setUnick(rset.getString("UNICK"));
				r.setRtitle(rset.getString("RTITLE"));
				r.setRsource(rset.getString("RSOURCE"));
				r.setRprocess(rset.getString("RPROCESS"));
				r.setRdate(rset.getDate("RDATE"));
				r.setRgoods(rset.getString("RGOODS"));
				r.setRcontent(rset.getString("RCONTENT"));
				r.setRvideo(rset.getString("RVIDEO"));
				r.setRkind(rset.getInt("RKIND"));
				r.setRsituation(rset.getInt("RSITUATION"));
				r.setRway(rset.getInt("RWAY"));
				r.setRingred(rset.getInt("RINGRED"));
				r.setRtime(rset.getInt("RTIME"));
				r.setRlevel(rset.getInt("RLEVEL"));
				r.setRtip(rset.getString("RTIP"));
				r.setRstatus(rset.getString("RSTATUS"));
				
				Bfile f = new Bfile();
				f.setFno(rset.getInt("FNO"));
				f.setBno(bno);
				f.setFname(rset.getString("FNAME"));
				f.setFpath(rset.getString("FPATH"));
				f.setFdate(rset.getDate("FDATE"));
				f.setFlevel(rset.getInt("FLEVEL"));
				
				fList.add(f);				
			}
			hmap = new HashMap<String, Object>();
			
			hmap.put("Recipe", r);
			hmap.put("Bfile", fList);
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO에서 에러발생!!");
		} finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}

	public int updateRecipe(Connection con, Recipe rcp) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			// pstmt = con.prepareStatement(prop.getProperty("updateRecipe"));
			pstmt = con.prepareStatement("UPDATE recipe SET RTITLE = ? , RSOURCE = ? , RPROCESS = ? , RGOODS = ? , RCONTENT = ? , RVIDEO = ? , "
										+ "RKIND = ? , RSITUATION = ? , RWAY = ? , RINGRED= ? , RTIME = ? , RLEVEL = ? , RTIP = ? WHERE BNO = ?");
						
			pstmt.setString(1, rcp.getRtitle());
			pstmt.setString(2, rcp.getRsource());
			pstmt.setString(3, rcp.getRprocess());
			pstmt.setString(4, rcp.getRgoods());
			pstmt.setString(5, rcp.getRcontent());
			pstmt.setString(6, rcp.getRvideo());
			pstmt.setInt(7, rcp.getRkind());
			pstmt.setInt(8, rcp.getRsituation());
			pstmt.setInt(9, rcp.getRway());
			pstmt.setInt(10, rcp.getRingred());
			pstmt.setInt(11, rcp.getRtime());
			pstmt.setInt(12, rcp.getRlevel());
			pstmt.setString(13, rcp.getRtip());
			
			pstmt.setInt(14, rcp.getBno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO에서 에러발생!");
		}finally {
			close(pstmt);
		}
		return result;
	}



}
