package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class QueryPreparedStatement {
	
	private static void method1(Connection con, Scanner sc) throws Exception{
		
		System.out.print("인구 수를 입력해주세요 : ");
		int popul = sc.nextInt();
		System.out.println();
		
		PreparedStatement psmt = con.prepareStatement("select name, population from city where population > ?");
		psmt.setInt(1, popul);
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()) {
			System.out.printf("city: %20s, population: %d \n", rs.getString("name"), rs.getInt("population"));
		}
		
		rs.close();
		psmt.close();
	}
	
	private static void method2(Connection con, Scanner sc) throws Exception {
		
		System.out.print("국가 코드를 입력해주세요 : ");
		String code = sc.next();
		System.out.println();
		
		PreparedStatement psmt = con.prepareStatement("select name, population from city where countrycode = ?");
		psmt.setString(1, code);
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("city: %20s, population: %d \n", rs.getString("name"), rs.getInt("population"));
		}
		
		rs.close();
		psmt.close();
	}
	
	private static void method2_1(Connection con, Scanner sc) throws Exception {
		
		System.out.print("국가명의 일부를 입력해주세요: ");
		String country = sc.next();
		System.out.println();
		
		PreparedStatement psmt = con.prepareStatement("select country.name, city.name, city.population from country, city where country.name like ? and country.code = city.countrycode");
		psmt.setString(1, "%"+country+"%");
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("country: %20s, city: %20s, population: %d \n", rs.getString("country.name"), rs.getString("city.name"), rs.getInt("city.population"));
		}
		rs.close();
		psmt.close();
		
	}
	
	private static void method2_2(Connection con, Scanner sc) throws Exception {
		
		System.out.print("국가 코드 또는 국가명의 일부를 입력하세요: ");
		String codeOrCountry = sc.next();
		System.out.println();
		
		PreparedStatement psmt = con.prepareStatement("select country.name, city.name, city.population from country, city where country.name like ? or countrycode like ? and country.code = city.countrycode");
		psmt.setString(1, "%"+codeOrCountry+"%");
		psmt.setString(2, "%"+codeOrCountry+"%");
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("country: %20s, city: %20s, population: %d \n", rs.getString("country.name"), rs.getString("city.name"), rs.getInt("city.population"));
		}
		rs.close();
		psmt.close();
	}
	
	private static void method3(Connection con, Scanner sc) throws Exception {
		
		System.out.print("대륙명을 입력해주세요: ");
		String continent = sc.next();
		System.out.println();
		
		PreparedStatement psmt = con.prepareStatement("select code, name from country where continent = ?");
		psmt.setString(1, continent);
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("country code: %s, country: %s \n", rs.getString("code"), rs.getString("name"));
		}
		rs.close();
		psmt.close();
	}
	
	private static void method4(Connection con, Scanner sc) throws Exception {
		
		System.out.print("국가 면적을 입력해주세요: ");
		Double area = sc.nextDouble();
		System.out.println();
		
		PreparedStatement psmt = con.prepareStatement("select name, surfacearea from country where surfacearea < ?");
		psmt.setDouble(1, area);
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("country: %20s, area: %.2f \n", rs.getString("name"), rs.getDouble("surfacearea"));
		}
		rs.close();
		psmt.close();
	}
	
	private static void method5(Connection con, Scanner sc) throws Exception {
		
		System.out.print("대한민국의 행정구역을 입력해주세요: ");
		String district = sc.next();
		System.out.println();
		
		
		PreparedStatement psmt = con.prepareStatement("select name from city where countrycode = ? and district = ?");
		psmt.setString(1, "KOR");
		psmt.setString(2, district);
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("city : %s \n", rs.getString("name"));
		}
		rs.close();
		psmt.close();
	}
	
	private static void method6(Connection con, Scanner sc) throws Exception {
		
		System.out.print("국가에서 사용하는 언어를 입력해주세요: ");
		String language = sc.next();
		System.out.println();
		
		PreparedStatement psmt = con.prepareStatement("select countrycode from countrylanguage where language = ?");
		psmt.setString(1, language);
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("country code: %s \n", rs.getString("countrycode"));
		}
		rs.close();
		psmt.close();
	}
	
	private static void method6_1(Connection con, Scanner sc) throws Exception {
		System.out.print("국가에서 사용하는 언어를 입력해주세요: ");
		String language = sc.next();
		System.out.println();
		
		PreparedStatement psmt = con.prepareStatement("select country.name from countrylanguage, country where language = ? and countrycode = code");
		psmt.setString(1, language);
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("country: %s \n", rs.getString("country.name"));
		}
		rs.close();
		psmt.close();
	}
	
	private static void method7(Connection con, Scanner sc) throws Exception {
		
		System.out.print("국가에서 사용하는 언어와 언어 사용 비율을 입력해주세요: ");
		String temp = sc.next();
		System.out.println();
		
		String language = temp.split(",")[0];
		Double rate = Double.parseDouble(temp.split(",")[1]);
		PreparedStatement psmt = con.prepareStatement("select countrycode, c.name, language, percentage from countrylanguage, country c where language = ? and percentage >= ? and countrycode = c.code");
		psmt.setString(1, language);
		psmt.setDouble(2, rate);
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			System.out.printf("code: %s, country: %20s, language: %10s, rate: %.2f \n", rs.getString("countrycode"), rs.getString("c.name"), rs.getString("language"), rs.getDouble("percentage"));
		}
		rs.close();
		psmt.close();
	}
	
	private static void showMenu() {
		System.out.println();
		System.out.println("=======================Menu=======================");
		System.out.println("1번 : 입력한 인구 수보다 많은 도시 출력");
		System.out.println("2번 : 국가 코드로 해당 국가의 도시와 인구수 출력");
		System.out.println("3번 : 국가명의 일부로 해당 국가의 도시와 인구수 출력");
		System.out.println("4번 : 국가명 혹은 국가코드의 일부로 해당 국가의 도시와 인구수 출력");
		System.out.println("5번 : 대륙명으로 해당 대륙에 속한 국가 출력");
		System.out.println("6번 : 입력한 면적보다 작은 국가 출력");
		System.out.println("7번 : 입력한 대한민국의 행정구 내 모든 도시 출력");
		System.out.println("8번 : 입력한 언어를 공식적으로 사용하는 국가코드 출력");
		System.out.println("9번 : 입력한 언어를 공식적으로 사용하는 국가명 출력");
		System.out.println("10번 : 입력한 언어 사용 비율보다 높은 언어 사용을 가진 국가 출력");
		System.out.println("0번 : 종료");
		System.out.println("==================================================");
		System.out.println();
	}

	public static void main(String[] args) {
		
		Connection con = null;
		Scanner sc = new Scanner(System.in);
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/world";
			con = DriverManager.getConnection(url, "musthave", "tiger");
			
			
			while (true) {
				
				showMenu();
				System.out.print("메뉴를 선택해주세요 : ");
				int menu = sc.nextInt();
				System.out.println();
				switch(menu) {
				case 1 -> method1(con, sc);
				case 2 -> method2(con, sc);
				case 3 -> method2_1(con, sc);
				case 4 -> method2_2(con, sc);
				case 5 -> method3(con, sc);
				case 6 -> method4(con, sc);
				case 7 -> method5(con, sc);
				case 8 -> method6(con, sc);
				case 9 -> method6_1(con, sc);
				case 10 -> method7(con, sc);
				case 0 -> {
                    System.out.println("프로그램을 종료합니다.");
                    return; // main 종료
                }
                default -> System.out.println("잘못된 메뉴 번호입니다.");
				}
			}
			
		} catch (Exception e) {
			System.out.println("연결 실패 : "+ e.getMessage());
		} finally {
			try {
				if (con != null) {
					con.close();
					sc.close();
				}
			} catch (Exception e) {
				System.out.println("오류 : "+ e.getMessage());
			}
		}

	}

}
