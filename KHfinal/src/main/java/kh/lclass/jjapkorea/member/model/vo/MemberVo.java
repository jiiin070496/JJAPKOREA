package kh.lclass.jjapkorea.member.model.vo;

public class MemberVo {
	private String mid;
	private String mpw;
	private int mtype;
	public MemberVo() {
	}
	public MemberVo(String mid, String mpw) {
		super();
		this.mid = mid;
		this.mpw = mpw;
	}
	public MemberVo(String mid, String mpw, int mtype) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mtype = mtype;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public int getMtype() {
		return mtype;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}
}
