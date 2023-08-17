package spms.dto;

import java.sql.Date;

public class MemberDto {
	
	private int mno;
	private String mid;
	private String mname;
	private String email;
	private String pwd;
	private Date cre_date;
	private Date mod_date;
	private int phoneNum;
	private String select1;
	private String select2;
	private String select3;
	private String select4;
	
	
	public MemberDto() {
		super();
	}
	
	
	public MemberDto(String mname, String mid, String pwd,  int phoneNum, String email) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.email = email;
		this.pwd = pwd;
		this.phoneNum = phoneNum;
	}


	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getCre_date() {
		return cre_date;
	}
	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}
	public Date getMod_date() {
		return mod_date;
	}
	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}
	public int getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(int phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getSelect1() {
		return select1;
	}
	public void setSelect1(String select1) {
		this.select1 = select1;
	}
	public String getSelect2() {
		return select2;
	}
	public void setSelect2(String select2) {
		this.select2 = select2;
	}
	public String getSelect3() {
		return select3;
	}
	public void setSelect3(String select3) {
		this.select3 = select3;
	}
	public String getSelect4() {
		return select4;
	}
	public void setSelect4(String select4) {
		this.select4 = select4;
	}

}
