package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.BoardDao;
import spms.dto.BoardDto;



@WebServlet("/sampleBoard/list")
public class BoardListServlet extends HttpServlet{
	
	private static final long SerialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, 
		HttpServletResponse response) 
		throws ServletException, IOException {
		Connection conn = null;
		try {
			ServletContext sc = this.getServletContext();
			
			
			if(request.getParameter("pno") == null ) {
				int pno = 0;
				request.setAttribute("bi", (pno*5)+0);
				request.setAttribute("ei", (pno*5)+4);

			} 
//			else if(request.getParameter("pno").equals("1")){
//				int pno = 0;
//				request.setAttribute("bi", (pno*5)+0);
//				request.setAttribute("ei", (pno*5)+4);
//			} 
			else {
				String pnoStr = request.getParameter("pno");
				int pno = Integer.parseInt(pnoStr);
				request.setAttribute("bi", ((pno)*5)+0);
				request.setAttribute("ei", ((pno)*5)+4);
			}
			
			conn = (Connection)sc.getAttribute("conn");
			
			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);
			
			ArrayList<BoardDto> boardList = null;
			
			boardList = (ArrayList<BoardDto>)boardDao.selectList();
			int showPageCnt = 5;
			int totalPages = (int) Math.ceil(boardList.size()/showPageCnt);
			
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("boardList", boardList);
			
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("/sampleBoard/BoardListView.jsp");
			//인클루딩
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
			request.setAttribute("error", e);
			request.setAttribute("msg", "Sorry but I love you");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Error.jsp");
			//포워딩
			dispatcher.forward(request, response);
		}
	}//doget 끝
	
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp) 
			throws ServletException, IOException {
			
			
	}
	

}
