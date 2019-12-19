package com.kh.recipe.goods.model.dao;

import static com.kh.recipe.common.JDBCTemplate.close;

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
import java.util.Map;
import java.util.Properties;

import com.kh.recipe.goods.model.vo.Goods;
import com.kh.recipe.recipeBoard.model.dao.commonDAO;

public class GoodsDAO {
	private Properties prop = new Properties();
	
	public GoodsDAO() {
		try {
			prop.load( new FileReader( commonDAO.class.getResource("/mappers/goods.properties").getPath() ) );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertRecipe(Connection con, Goods g) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			// INSERT INTO PRODUCT VALUES(SEQ_PCID.NEXTVAL, ? PCGTYPE, ? PCNAME, ? PCFNAME, ? PCFPATH);
			pstmt = con.prepareStatement(prop.getProperty("insertRecipePr"));
			pstmt.setInt(1, g.getUno());
			pstmt.setInt(2, g.getPcgtype());
			pstmt.setString(3, g.getPcname());
			pstmt.setString(4, g.getPcfname());
			pstmt.setString(5, g.getPcfpath());
			result = pstmt.executeUpdate();
			
			
			
			// INSERT INTO SALE VALUES(PCID, ? PCURL);
			pstmt = con.prepareStatement(prop.getProperty("insertRecipeSa"));
			pstmt.setString(1, g.getPcurl());
			
			result += pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DAO에러!");
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Goods> selectProducts(Connection con) {
		ArrayList<Goods> goodsList = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(prop.getProperty("selectProducts"));
			goodsList = new ArrayList<>();
			while (rset.next()) {
				Goods g = new Goods();

				g.setPcid(Integer.parseInt(rset.getString("PCID")));
				g.setUno(Integer.parseInt(rset.getString("UNO")));
				g.setPcgtype(Integer.parseInt(rset.getString("PCGTYPE")));
				g.setPcname(rset.getString("PCNAME"));
				
				g.setPcfname(rset.getString("PCFNAME"));
				g.setPcfpath(rset.getString("PCFPATH"));
				
				g.setPcgname(rset.getString("PCGNAME"));
				
				g.setPcurl(rset.getString("PCURL"));
				System.out.println(g);
				goodsList.add(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DAO에러!");
		} finally {
			close(stmt);
		}
		return goodsList;
	}

	

}