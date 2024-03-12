package ma.ac.esi.referentielCompetences.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SkillDAO {
	private String url = "jdbc:mysql://localhost:3306/competency_framework";
	private String username = "root";
	private String password = "root";

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}

	public boolean addSkill(Skill skill) {
		String sql = "INSERT INTO Skills (name, description, domain, level) VALUES(?, ?, ?, ?)";
		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, skill.getName());
			pstmt.setString(2, skill.getDescription());
			pstmt.setString(3, skill.getDomain());
			pstmt.setString(4, skill.getLevel());
			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;

		}
	}

	public List<Skill> getAllSkills() {
		List<Skill> skills = new ArrayList<>();
		String sql = "SELECT * FROM Skills";
		try (Connection conn = getConnection();
				Statement stmt = conn.createStatement();

				ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				Skill skill = new Skill();
				skill.setId(rs.getInt("id"));
				skill.setName(rs.getString("name"));
				skill.setDescription(rs.getString("description"));
				skill.setDomain(rs.getString("domain"));
				skill.setLevel(rs.getString("level"));
				skills.add(skill);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return skills;
	}

}
