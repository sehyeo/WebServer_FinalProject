// LectureRepository.java
package dao;

import dto.Lecture;
import java.sql.*;
import java.util.ArrayList;

public class LectureRepository {
    private static LectureRepository instance = new LectureRepository();
    
    public static LectureRepository getInstance() {
        return instance;
    }
    
    private LectureRepository() {
    }

    public Lecture getLectureByLectureNameAndFilename(String lectureName, String filename) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Lecture lecture = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
            String sql = "SELECT * FROM lecture WHERE l_lectureName = ? AND l_filename = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, lectureName);
            pstmt.setString(2, filename);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                lecture = new Lecture();
                lecture.setLectureName(rs.getString("l_lectureName"));
                lecture.setCategory(rs.getString("l_category"));
                lecture.setDescription(rs.getString("l_description"));
                lecture.setUnitPrice(rs.getInt("l_unitPrice"));
                lecture.setFilename(rs.getString("l_filename"));
                lecture.setUploadDate(rs.getString("l_uploadDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return lecture;
    }

    // 기타 메서드들
}
