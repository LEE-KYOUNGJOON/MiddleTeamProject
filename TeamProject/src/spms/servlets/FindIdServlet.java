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

import spms.dao.MemberDao;
import spms.dto.MemberDto;

@WebServlet(value = "/auth/findId")
public class FindIdServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		RequestDispatcher rd = req.getRequestDispatcher("./FindID.jsp");
		rd.forward(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			res.setContentType("text/html;charset=UTF-8");
			req.setCharacterEncoding("UTF-8");
			
			String mname = req.getParameter("mname");
			int phonenum = Integer.parseInt(req.getParameter("phoneno"));
			
			System.out.println(mname);
			System.out.println(phonenum);
			
			ServletContext sc = this.getServletContext();
			
			conn = (Connection) sc.getAttribute("conn");
			
			MemberDao memberDao = new MemberDao();
			memberDao.setConnection(conn);
			
			MemberDto memberDto = memberDao.memberFindID(mname, phonenum);
			
			
//			System.out.println(memberDto.getMid());
			
			if (memberDto != null) {
//				res.sendRedirect("./ShowID.jsp");
				 RequestDispatcher rd = null;
				 req.setAttribute("memberDto", memberDto);
				 rd = req.getRequestDispatcher("./ShowID.jsp");
				 rd.forward(req, res);
			}
			else if(memberDto == null) {
				res.sendRedirect("./FindIDFail.jsp");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			res.sendRedirect("./FindIDFail.jsp");
		}
	}
	
}
