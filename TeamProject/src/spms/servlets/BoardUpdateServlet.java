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

import spms.dao.BoardDao;
import spms.dto.BoardDto;


@WebServlet("/sampleBoard/update")
public class BoardUpdateServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection conn = null;

		String bNo = "";
		RequestDispatcher rd = null;

		try {
			bNo = req.getParameter("no");
			System.out.println("업데이트번호 오는지확인:"+bNo);
			int no = Integer.parseInt(bNo);
			ServletContext sc = this.getServletContext();

			conn = (Connection) sc.getAttribute("conn");

			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);

			BoardDto boardDto = boardDao.boardSelectOne(no);
			req.setAttribute("boardDto", boardDto);

			rd = req.getRequestDispatcher("/sampleBoard/BoardUpdateForm.jsp");
			rd.forward(req, res);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			req.setAttribute("msg", "회원추가하다 오류남");

			rd = req.getRequestDispatcher("/Error.jsp");
			// 포워딩
			rd.forward(req, res);
		}

	}// doget end

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {

//			req.setCharacterEncoding("UTF-8");
		Connection conn = null;
		RequestDispatcher rd = null;
		
		String contents ="";
		String title ="";
		String bNo = "";
		try {
			bNo = req.getParameter("no");
			int no = Integer.parseInt(bNo);
			contents = req.getParameter("contents");
			title = req.getParameter("title");
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);
			
			BoardDto boardDto = new BoardDto();
			boardDto.setbNo(no);
			boardDto.setbContents(contents);
			boardDto.setcTitle(title);
			
			int resultNum = 0;
			resultNum = boardDao.boardUpdate(boardDto);//resultNum 으로 반환됨 ( 유효성검사시활용할수있을까?)
			
			if(resultNum ==0) {
				System.out.println("게시물수정실패");
			} else if(resultNum ==1) {
				System.out.println("게시물수정성공");
			}
			res.sendRedirect("./list");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", e);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Error.jsp");
			//포워딩
			dispatcher.forward(req, res);
		} 

	}
}
