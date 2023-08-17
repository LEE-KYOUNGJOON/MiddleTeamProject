package spms.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spms.dto.BoardDto;

public class BoardDao {

	private Connection connection;

	public void setConnection(Connection conn) {
		this.connection = conn;
	}

	public List<BoardDto> selectList() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		try {

			sql = "SELECT BNO, MNO, CTITLE, WMID, BMOD_DATE, BVIEWS, BREPLY" 
			+ " FROM SAMPLEBOARD" 
			+ " ORDER BY BNO DESC";

			pstmt = connection.prepareStatement(sql);

			rs = pstmt.executeQuery();

			ArrayList<BoardDto> boardList = new ArrayList<BoardDto>();

			int bno = 0;
			int no = 0;
			String title = "";
			String id = "";
			Date bModifiedDate = null;
			int bViewsNo = 0;
			int bReplyCount = 0;

			while (rs.next()) {

				bno = rs.getInt("BNO");
				no = rs.getInt("MNO");
				title = rs.getString("CTITLE");
				id = rs.getString("WMID");
				bModifiedDate = rs.getDate("BMOD_DATE");
				bViewsNo = rs.getInt("BVIEWS");
				bReplyCount = rs.getInt("BREPLY");

				BoardDto boardDto = new BoardDto(bno, no, title, id, bModifiedDate, bViewsNo, bReplyCount);

				boardList.add(boardDto);

			}
			
			
			return boardList;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;

		} finally { // 6.자원 연결 해제(메모리 회수)
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} // finally end

	}// 회원 목록 public list end

	public int BoardInsert(BoardDto boardDto) throws Exception {
		int resultNum = 0;

		PreparedStatement pstmt = null;

		try {
			int no = boardDto.getNo();
			String id = boardDto.getId();
			String title = boardDto.getcTitle();
			String contents = boardDto.getbContents();

			String sql = " INSERT INTO SAMPLEBOARD" + " VALUE(BNO, MNO, WMID, CTITLE, BCONTENTS, BCRE_DATE"
					+ ", BMOD_DATE, BVIEWS, BREPLY)" + " VALUES(SAMPLEBOARD_BNO_SEQ.NEXTVAL, ?, ?"
					+ ", ?,?,SYSDATE, SYSDATE,0,0)";

			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, no);
			pstmt.setString(2, id);
			pstmt.setString(3, title);
			pstmt.setString(4, contents);

			resultNum = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

		return resultNum;
	}

	public BoardDto boardDetailView(int no,int hitCnt) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		
		try {
			System.out.println("디테일뷰메서드 실행됬어 그럼 hitCnt는?"+hitCnt);
			System.out.println("디테일뷰메서드 실행됬어 그럼 bno는?"+no);
			if(hitCnt == 1) {
			sql = "UPDATE SAMPLEBOARD SET BVIEWS = BVIEWS+?" + 
					" WHERE BNO = ?";
			
			
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, hitCnt);
			pstmt.setInt(2, no);
			
			pstmt.executeUpdate();
			System.out.println("그래서 조회수 업뎃된겨?");
			}
			sql = "SELECT BNO, WMID, CTITLE, BCONTENTS" + 
					" FROM SAMPLEBOARD" + 
					" WHERE BNO = ?";
			
			
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			
			rs = pstmt.executeQuery();
			
			int bno = 0;
			String id ="";
			String title = "";
			String contents = "";
			
			if(rs.next()) {
				bno = rs.getInt("BNO");
				id = rs.getString("WMID");
				title = rs.getString("CTITLE");
				contents = rs.getString("BCONTENTS");
				
				BoardDto boardDto = new BoardDto(id, title, contents);
				boardDto.setbNo(bno);
				
				return boardDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public BoardDto boardSelectOne(int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		
		try {
			sql = "SELECT BNO, WMID, CTITLE, BCONTENTS" + 
					" FROM SAMPLEBOARD" + 
					" WHERE BNO = ?";
			
			
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			
			rs = pstmt.executeQuery();
			
			int bno=0;
			String id ="";
			String title = "";
			String contents = "";
			
			if(rs.next()) {
				bno = rs.getInt("BNO");
				id = rs.getString("WMID");
				title = rs.getString("CTITLE");
				contents = rs.getString("BCONTENTS");
				
				BoardDto boardDto = new BoardDto( id, title, contents);
				boardDto.setbNo(bno);
				return boardDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public int boardUpdate(BoardDto boardDto) throws Exception{
		int resultNum = 0;
		PreparedStatement pstmt = null;
		
		String sql ="";
		
		try {
			sql = "UPDATE SAMPLEBOARD SET CTITLE = ?, BCONTENTS = ?, BMOD_DATE = SYSDATE" + 
					" WHERE BNO = ?";
			
			
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, boardDto.getcTitle());
			pstmt.setString(2, boardDto.getbContents());
			pstmt.setInt(3, boardDto.getbNo());
			
			
			resultNum = pstmt.executeUpdate();
			
			System.out.println(resultNum);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultNum;
	}
	public int boardDelete(int no) throws Exception{
		int resultNum = 0;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			
			sql = "DELETE FROM SAMPLEBOARD WHERE BNO = ?";
			
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			resultNum = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return resultNum;
	}
}
