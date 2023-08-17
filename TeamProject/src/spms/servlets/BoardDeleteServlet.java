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

import spms.dao.BoardDao;
@WebServlet("/sampleBoard/delete")
public class BoardDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse res) 
			throws ServletException, IOException {
		
		
		Connection conn= null;
		String mNo = req.getParameter("no");
		int no = Integer.parseInt(mNo);
		try {

			ServletContext sc = this.getServletContext();
			
			conn = (Connection)sc.getAttribute("conn");
			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);
			boardDao.boardDelete(no);
			
			res.sendRedirect("./list");
		
			
		}	catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "삭제오류발생");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Error.jsp");
			//포워딩
			dispatcher.forward(req, res);
		} 	
		
	}
	
}
