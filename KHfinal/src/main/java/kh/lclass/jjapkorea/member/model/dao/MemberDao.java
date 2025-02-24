package kh.lclass.jjapkorea.member.model.dao;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kh.lclass.jjapkorea.member.model.vo.BusinessFormVo;
import kh.lclass.jjapkorea.member.model.vo.BusinessVo;
import kh.lclass.jjapkorea.member.model.vo.MemberVo;
import kh.lclass.jjapkorea.member.model.vo.PersonVo;

public class MemberDao {
	public String login(SqlSession session, String mid) {
		String result = null;
		try {
			result = session.selectOne("member.login", mid);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 기업회원로그인
	public String businessLogin(SqlSession session, String mid) {
		String result = null;
		try {
			result = session.selectOne("member.businessLogin", mid);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 개인 회원가입
	public int pSignup(SqlSession session, MemberVo vo) {
		int result = 0;
		try {
			result = session.insert("member.pSignup", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int personSignup(SqlSession session, PersonVo vo) {
		int result = 0;
		try {
			result = session.insert("person.personSignup", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int bSignUp(SqlSession session, MemberVo vo) {
		int result = 0;
		try {
			result = session.insert("member.bSignUp", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void insert(SqlSession session) {
		String namespace = "member";
        String checkQuery = namespace + ".check";

        int count = 0;
        
        try {
        	count = session.selectOne(checkQuery);
            if (count == 0) {
                String insertQuery = namespace + ".insert";
                List<String> list = Arrays.asList(
                    "대기업", "대기업 계열사·자회사", "중소기업(300명이하)", "중견기업(300명이상)",
                    "벤처기업", "외국계(외국 투자기업)", "외국계(외국 법인기업)", "국내 공공기관·공기업",
                    "비영리단체·협회·교육재단", "외국 기관·비영리기구·단체"
                );

                for (int i = 0; i < list.size(); i++) {
                    String name = list.get(i);
                    session.insert(insertQuery, new BusinessFormVo(i + 1, name));
                }
            }
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int businessSignup(SqlSession session, BusinessVo vo) {
		int result = 0;
		try {
			result = session.insert("business.businessSignup", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int delete(SqlSession session, String mid) {
		int result = 0;
		try {
			result = session.delete("member.delete", mid);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

// IndexLogin
	public String indexLogin(SqlSession session, String mid) {
		String result = null;
		try {
			result = session.selectOne("person.indexLogin", mid);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
