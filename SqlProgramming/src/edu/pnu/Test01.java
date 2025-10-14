package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

class CountryDTO {
	String code;
	String name;
	int population;
	
	@Override
	public String toString() {
		return "code : " + code + ", name : "+name+", population : "+ population;
	}
}

public class Test01 {

	public static void main(String[] args) throws Exception{
		//
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//
		String url = "jdbc:mysql://localhost:3306/world";
		Connection con = DriverManager.getConnection(url, "musthave", "tiger");
		
		//
		Statement st = con.createStatement();
		
		//
		ResultSet rs = st.executeQuery("select code, name, population from country limit 10");
		
		List<CountryDTO> countList = new ArrayList<>();
		
		// 
		while (rs.next()) {
			CountryDTO temp = new CountryDTO();
			temp.code = rs.getString(1);
			temp.name = rs.getString(2);
			temp.population = rs.getInt(3);
			countList.add(temp);
		}
		
		for (CountryDTO dto : countList) {
			System.out.println(dto.toString());
		}
	}

}
