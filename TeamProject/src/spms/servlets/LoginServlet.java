package spms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;

import spms.dao.MemberDao;
import spms.dto.MemberDto;

@WebServlet(value = "/auth/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("./Login.jsp");
		rd.forward(req, res);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			String mid = req.getParameter("mid");
			String pwd = req.getParameter("pwd");
			
			ServletContext sc = this.getServletContext();
			
			conn = (Connection) sc.getAttribute("conn");
			
			MemberDao memberDao = new MemberDao();
			memberDao.setConnection(conn);
			
			MemberDto memberDto = memberDao.memberLogin(mid, pwd);
			
			System.out.println(memberDto);
			if (memberDto.getMname() == null) {
				
			} else {
				System.out.println("Not Error");
				System.out.println(memberDto.getMno());
				System.out.println(memberDto.getMname());
				System.out.println(memberDto.getMid());
			}
			HttpSession session = req.getSession();
			session.setAttribute("member", memberDto);
			res.sendRedirect("../sampleBoard/list");
//			System.out.println(memberDto);
		}catch(Exception e) {
			e.printStackTrace();
			res.sendRedirect("./LoginFail.jsp");
		}
	}
	
}
