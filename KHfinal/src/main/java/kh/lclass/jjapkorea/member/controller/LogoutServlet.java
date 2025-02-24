package kh.lclass.jjapkorea.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("SsLoginId");
		request.getSession().removeAttribute("SsLoginId2");
		request.getSession().removeAttribute("pname");
		request.getSession().removeAttribute("pname2");
		request.getSession().setAttribute("successFailMsg", "로그아웃되었습니다.");
		response.sendRedirect(request.getContextPath()+"/index");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
