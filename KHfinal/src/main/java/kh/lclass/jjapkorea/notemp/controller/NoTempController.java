package kh.lclass.jjapkorea.notemp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.lclass.jjapkorea.common.MybatisTemplate;

@WebServlet("/notemp")
public class NoTempController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// test
//		JdbcTemplate.getConnection();
		MybatisTemplate.getSqlSession();
		request.getRequestDispatcher("/WEB-INF/view/NoTemp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}