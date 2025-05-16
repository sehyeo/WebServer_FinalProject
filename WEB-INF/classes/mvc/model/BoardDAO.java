package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {

    private static BoardDAO instance;

    private BoardDAO() {}

    public static BoardDAO getInstance() {
        if (instance == null)
            instance = new BoardDAO();
        return instance;
    }

    // board 테이블의 레코드 개수
    public int getListCount(String items, String text) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = 0;
        String sql;

        if (items == null && text == null)
            sql = "SELECT COUNT(*) FROM board";
        else
            sql = "SELECT COUNT(*) FROM board WHERE " + items + " LIKE ?";
        
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            if (items != null && text != null) {
                pstmt.setString(1, "%" + text + "%");
            }
            rs = pstmt.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return x;
    }

    // board 테이블의 레코드 가져오기
    public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;
        int start = (page - 1) * limit;
        
        if (items == null && text == null)
            sql = "SELECT * FROM board ORDER BY num DESC LIMIT ?, ?";
        else
            sql = "SELECT * FROM board WHERE " + items + " LIKE ? ORDER BY num DESC LIMIT ?, ?";

        ArrayList<BoardDTO> list = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            if (items != null && text != null) {
                pstmt.setString(1, "%" + text + "%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, limit);
            } else {
                pstmt.setInt(1, start);
                pstmt.setInt(2, limit);
            }
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setNum(rs.getInt("num"));
                board.setId(rs.getString("id"));
                board.setName(rs.getString("name"));
                board.setSubject(rs.getString("subject"));
                board.setContent(rs.getString("content"));
                board.setRegist_day(rs.getString("regist_day"));
                board.setHit(rs.getInt("hit"));
                board.setIp(rs.getString("ip"));
                list.add(board);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return list;
    }

    // member 테이블에서 인증된 id의 사용자명 가져오기
    public String getLoginNameById(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String name = null;
        String sql = "SELECT name FROM member WHERE id = ?";
        
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return name;
    }

    // board 테이블에 새로운 글 삽입하기
    public void insertBoard(BoardDTO board) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO board(id, name, subject, content, regist_day, hit, ip) VALUES(?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getId());
            pstmt.setString(2, board.getName());
            pstmt.setString(3, board.getSubject());
            pstmt.setString(4, board.getContent());
            pstmt.setString(5, board.getRegist_day());
            pstmt.setInt(6, board.getHit());
            pstmt.setString(7, board.getIp());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    // 선택된 글 상세 내용 가져오기
    public BoardDTO getBoardByNum(int num, int page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDTO board = null;
        updateHit(num);
        String sql = "SELECT * FROM board WHERE num = ?";
        
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                board = new BoardDTO();
                board.setNum(rs.getInt("num"));
                board.setId(rs.getString("id"));
                board.setName(rs.getString("name"));
                board.setSubject(rs.getString("subject"));
                board.setContent(rs.getString("content"));
                board.setRegist_day(rs.getString("regist_day"));
                board.setHit(rs.getInt("hit"));
                board.setIp(rs.getString("ip"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return board;
    }

    // 선택된 글 내용 수정하기
    public void updateBoard(BoardDTO board) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            String sql = "UPDATE board SET name=?, subject=?, content=? WHERE num=?";
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getName());
            pstmt.setString(2, board.getSubject());
            pstmt.setString(3, board.getContent());
            pstmt.setInt(4, board.getNum());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    // 선택된 글 삭제하기
    public void deleteBoard(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            String sql = "DELETE FROM board WHERE num=?";
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    // 선택된 글의 조회 수 증가시키기
    public void updateHit(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT hit FROM board WHERE num = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            int hit = 0;
            if (rs.next())
                hit = rs.getInt("hit") + 1;
            sql = "UPDATE board SET hit=? WHERE num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, hit);
            pstmt.setInt(2, num);
            pstmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
