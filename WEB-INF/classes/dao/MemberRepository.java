package dao;

import dto.Member;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberRepository {
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/LifeDB";
        String user = "root";
        String password = "1234";
        return DriverManager.getConnection(url, user, password);
    }

    public List<Member> listMembers() {
        List<Member> membersList = new ArrayList<>();
        String sql = "SELECT * FROM member";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Member member = new Member();
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
                member.setName(rs.getString("name"));
                member.setGender(rs.getString("gender"));
                member.setBirth(rs.getString("birth"));
                member.setMail(rs.getString("mail"));
                member.setPhone(rs.getString("phone"));
                member.setTimestamp(rs.getTimestamp("timestamp"));
                membersList.add(member);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return membersList;
    }
}
