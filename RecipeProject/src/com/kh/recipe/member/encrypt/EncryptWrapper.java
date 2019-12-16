package com.kh.recipe.member.encrypt;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {


	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public String getParameter(String name) {
		// 비밀번호만 뽑아서 암호화하기
		if(name != null && name.equals("password")) {
			// 암호처리
			System.out.println(getSHA512(super.getParameter("password")));
			
			return getSHA512(super.getParameter("password"));
		} else {
			return super.getParameter(name);
		}
	}
	   private static String getSHA512(String pwd) {
		      
		      try {
		         
		         MessageDigest md = MessageDigest.getInstance("SHA-512");
		         byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
		         md.update(bytes);
		         
		         return Base64.getEncoder().encodeToString(md.digest());
		         
		      } catch (NoSuchAlgorithmException e) {
		         
		         System.out.println("암호화 에러 발생");
		         e.printStackTrace();
		         
		         return null;
		      }
		      
	   }

}
