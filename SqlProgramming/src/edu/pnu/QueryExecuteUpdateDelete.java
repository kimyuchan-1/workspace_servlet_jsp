package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class QueryExecuteUpdateDelete {

	public static void main(String[] args) {

		Connection con = null;
		PreparedStatement psmt = null;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/myfirstdb";
			con = DriverManager.getConnection(url,"musthave","tiger");
			
			String sql = "delete from phonebook where id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, 1);
			int n = psmt.executeUpdate();
			
			System.out.println(n+"개의 데이터가 삭제되었습니다.");
			
			
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
