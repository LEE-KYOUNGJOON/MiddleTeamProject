package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spms.dao.BoardDao;
import spms.dao.MemberDao;
import spms.dto.BoardDto;
import spms.dto.MemberDto;



@WebServlet("/sampleBoard/detail")
public class BoardDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection conn = null;

		String bnoStr = "";
		String no2Str = "";
		RequestDispatcher rd = null;
		
		try {
			bnoStr = req.getParameter("no1");//bNo
			int bno = Integer.parseInt(bnoStr);
			no2Str = req.getParameter("no2");//게시물의 회원no
			int no2 = Integer.parseInt(no2Str);
			
			ServletContext sc = this.getServletContext();

			conn = (Connection) sc.getAttribute("conn");

			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);
			HttpSession session = req.getSession();
			MemberDto memberDto = (MemberDto)session.getAttribute("member");
			int LoginNo = memberDto.getMno();
			if(LoginNo == no2) {

				BoardDto boardDto = boardDao.boardDetailView(bno, 0);
				
				req.setAttribute("boardDto", boardDto);

				rd = req.getRequestDispatcher("./BoardDetailForm.jsp");
				
			}else {
				BoardDto boardDto = boardDao.boardDetailView(bno, 1);
				
				req.setAttribute("boardDto", boardDto);

				rd = req.getRequestDispatcher("./BoardDetailForm2.jsp");
				
			}
			
			rd.forward(req, res);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			req.setAttribute("msg", "회원추가하다 오류남");

			rd = req.getRequestDispatcher("/Error.jsp");
			// 포워딩
			rd.forward(req, res);
		}

	}// doget end

}
