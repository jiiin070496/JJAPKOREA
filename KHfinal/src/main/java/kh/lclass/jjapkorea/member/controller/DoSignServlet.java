package kh.lclass.jjapkorea.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.lclass.jjapkorea.member.model.service.MemberService;
import kh.lclass.jjapkorea.member.model.vo.BusinessVo;
import kh.lclass.jjapkorea.member.model.vo.MemberVo;

@WebServlet("/signup.do")
public class DoSignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = new MemberService();
		service.insert();
		
		String mid = request.getParameter("U_ID");
		String mpw = request.getParameter("U_PWD");
		MemberVo vo = new MemberVo(mid, mpw);
		service.bSignUp(vo);
		
		String bform = request.getParameter("Corp_Type");
		String brno = request.getParameter("Corp_RegNum");
		String bizname = request.getParameter("Corp_Name");
		String brepName = request.getParameter("Boss_Name");
		String baddress = request.getParameter("Zip_Code");
		String bname = request.getParameter("Mem_Name");
		String btel = request.getParameter("Corp_Phone");
		String bemail = request.getParameter("email");
		BusinessVo vo2 = new BusinessVo(mid, bform, brno, bizname, brepName, baddress, bname, btel, bemail);
		int result = service.businessSignup(vo2);
		if(result < 1) {
			System.out.println("회원가입 실패");
			service.delete(mid);
			response.sendRedirect(request.getContextPath()+"/signup");
		} else {
			System.out.println("회원가입 성공");
			response.sendRedirect(request.getContextPath()+"/index");
		}
	}

}
