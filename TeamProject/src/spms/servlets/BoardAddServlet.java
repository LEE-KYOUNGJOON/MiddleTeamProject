package spms.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spms.dao.BoardDao;
import spms.dto.BoardDto;
import spms.dto.MemberDto;

/**
 * Servlet implementation class MemberAddServlet
 */
@WebServlet("/sampleBoard/add")
public class BoardAddServlet extends HttpServlet {
    
	//? 회원등록화면
	@Override
	protected void doGet(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.sendRedirect("./BoardAddForm.jsp");
		
	}
	// 데이터베이스에 데이터 추가, 회원정보를 저장
	@Override
	protected void doPost(HttpServletRequest req
			, HttpServletResponse res) throws ServletException, IOException {
		
		Connection conn = null;
		
		HttpSession session = req.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("member");
		int no = memberDto.getMno();
		

		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		
		
		try {
			BoardDto boardDto = new BoardDto(no, id, title, contents);
			
			ServletContext sc = this.getServletContext();
			
			conn = (Connection)sc.getAttribute("conn");
			
			BoardDao boardDao = new BoardDao();
			
			boardDao.setConnection(conn);
			
			
			int resultNum = 0;
			
			
			resultNum = boardDao.BoardInsert(boardDto);
			
			if(resultNum == 0 ) {
				System.out.println("게시물등록실패");
			} else if(resultNum ==1) {
				System.out.println("게시물등록성공");
			}
			res.sendRedirect("./list");
	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
//			throw new ServletException(e);
			
			req.setAttribute("msg", "게시판추가하다 오류남");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Error.jsp");
			//포워딩
			dispatcher.forward(req, res);
		} 	
	}

}
