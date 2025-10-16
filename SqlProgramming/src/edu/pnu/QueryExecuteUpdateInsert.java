package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class QueryExecuteUpdateInsert {
	

	public static void main(String[] args) {
		
		Connection con = null;
		PreparedStatement psmt = null;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/myfirstdb";
			con = DriverManager.getConnection(url,"musthave","tiger");
			
			String sql = "insert into phonebook(name, moblie) value (?,?)";
			String name = "홍길동";
			String mobile = "010-1111-2222";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, mobile);
			int n = psmt.executeUpdate();
			
			System.out.println(n+"개의 데이터가 업로드되었습니다.");
			
		} catch (Exception e) {
			System.out.println("연결 오류 : "+ e.getMessage());
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				System.out.println("오류 : "+ e.getMessage());
			}
		}
		

	}

}
