package spms.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.sql.Connection;

import spms.dto.MemberDto;

public class MemberDao {
	
	private Connection connection;
	
	public void setConnection(Connection conn) {
		this.connection = conn;
	}
	
	public int memberInsert(MemberDto memberDto) throws Exception{
		int resultNum = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String name = memberDto.getMname();
			String id = memberDto.getMid();
			String pwd = memberDto.getPwd();
			int phoneNo = memberDto.getPhoneNum();
//			int phoneNo = Integer.parseInt(phoneNum);
			String email = memberDto.getEmail();
			Date creDate = memberDto.getCre_date();
			Date modifiedDate = memberDto.getMod_date();
			String select1 = memberDto.getSelect1();
	        String select2 = memberDto.getSelect2();
	        String select3 = memberDto.getSelect3();
	        String select4 = memberDto.getSelect4();
			
			System.out.println("name = " + name);
			System.out.println("id = " + id);
			System.out.println("pwd = " + pwd);
			System.out.println("phoneNo = " + phoneNo);
			System.out.println("email = " + email);
			System.out.println("creDate = " + creDate);
			System.out.println("modifiedDate = " + modifiedDate);
			System.out.println("select1 = " + select1);
			System.out.println("select2 = " + select2);
			System.out.println("select3 = " + select3);
			System.out.println("select4 = " + select4);
			
			String sql = "";

			sql += "INSERT INTO MEMBERS";
			sql += " (MNO, MNAME, MID, PWD, PHONENO, EMAIL, CRE_DATE";
			sql	+= ", MOD_DATE, SELECT1, SELECT2, SELECT3, SELECT4)";
			sql += " VALUES(MEMBERS_MNO_SEQ.NEXTVAL, ?, ?, ?, ?, ?";
			sql += ", SYSDATE, SYSDATE, ?, ?, ?, ?)";
			
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pwd);
			pstmt.setInt(4, phoneNo);
			pstmt.setString(5, email);
			pstmt.setString(6, select1);
	        pstmt.setString(7, select2);
	        pstmt.setString(8, select3);
	        pstmt.setString(9, select4);
			
			resultNum = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}// pstmt if end
			
		}// finally end
		
		return resultNum;
	}
	
	
	public MemberDto memberLogin(String mid, String pwd) throws SQLException{
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 1;
		
		String sql = "";
		sql += "SELECT MNO, MID, MNAME";
				sql += " FROM MEMBERS";
				sql += " WHERE MID = ?";
				sql += " AND PWD = ?";
		
		try {
			pstmt = connection.prepareStatement(sql);
			
			System.out.println(mid);
			System.out.println(pwd);
			
			pstmt.setString(num++, mid);
			pstmt.setString(num, pwd);
			
			rs = pstmt.executeQuery();
			
			System.out.println(rs);
			
//			System.out.println(rs.next());
			
			if (rs.next()) {
				int mno = rs.getInt("MNO");
				String id = rs.getString("MID");
				String mname = rs.getString("MNAME");
				
				System.out.println(mno);
				System.out.println(mname);
				MemberDto memberDto = new MemberDto();
				memberDto.setMno(mno);
				memberDto.setMid(id);
				memberDto.setMname(mname);
			
				return memberDto;
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	
	
	public MemberDto memberFindID(String mname, int phonenum) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 1;
		
		String sql = "SELECT MID FROM MEMBERS WHERE MNAME = ? AND PHONENO = ?";
				
		try {
			pstmt = connection.prepareStatement(sql);
			
			System.out.println(mname);
			System.out.println(phonenum);
			
			pstmt.setString(num++, mname);
			pstmt.setInt(num, phonenum);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String id = rs.getString("MID");
				
				MemberDto memberDto = new MemberDto();
				
				memberDto.setMid(id);
			
				return memberDto;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	public MemberDto memberFindPW(String id) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT PWD FROM MEMBERS WHERE MID = ?";
				
		try {
			pstmt = connection.prepareStatement(sql);
			
			System.out.println(id);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String pw = rs.getString("PWD");
				
				System.out.println(pw);
				
				MemberDto memberDto = new MemberDto();
				
				memberDto.setPwd(pw);
			
				return memberDto;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		return null;
	}

}
