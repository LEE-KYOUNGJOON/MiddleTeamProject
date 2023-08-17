package spms.dto;

import java.sql.Date;

public class BoardDto {
	
	private int bNo;
	private int no;
	private String id;
	private String cTitle;
	private String bContents;
	private Date bCreateDate;
	private Date bModifiedDate;
	private int bViewsNo;
	private int bReplyNo;
	
	public BoardDto() {
		super();
	}
	
	public BoardDto(String id, String cTitle, String bContents) {
		super();
		this.id = id;
		this.cTitle = cTitle;
		this.bContents = bContents;
	}

	public BoardDto(int no, String id, String cTitle, String bContents) {
		super();
		this.no = no;
		this.id = id;
		this.cTitle = cTitle;
		this.bContents = bContents;
	}

	public BoardDto(int bNo, int no, String cTitle, String id, Date bModifiedDate, int bViewsNo, int bReplyNo) {
		super();
		this.bNo = bNo;
		this.no = no;
		this.id = id;
		this.cTitle = cTitle;
		this.bModifiedDate = bModifiedDate;
		this.bViewsNo = bViewsNo;
		this.bReplyNo = bReplyNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getbContents() {
		return bContents;
	}

	public void setbContents(String bContents) {
		this.bContents = bContents;
	}

	public Date getbCreateDate() {
		return bCreateDate;
	}

	public void setbCreateDate(Date bCreateDate) {
		this.bCreateDate = bCreateDate;
	}

	public Date getbModifiedDate() {
		return bModifiedDate;
	}

	public void setbModifiedDate(Date bModifiedDate) {
		this.bModifiedDate = bModifiedDate;
	}

	public int getbViewsNo() {
		return bViewsNo;
	}

	public void setbViewsNo(int bViewsNo) {
		this.bViewsNo = bViewsNo;
	}

	public int getbReplyNo() {
		return bReplyNo;
	}

	public void setbReplyNo(int bReplyNo) {
		this.bReplyNo = bReplyNo;
	}

	
	@Override
	public String toString() {
		return "MemberDto [bNo=" + bNo + ", no=" + no + ", id=" + id + ", cTitle=" + cTitle + ", bContents="
				+ bContents + ", bCreateDate=" + bCreateDate + ", bModifiedDate=" + bModifiedDate + ", bViewsNo="
				+ bViewsNo + ", bReplyNo=" + bReplyNo + "]";
	}
	
	

	
	
}
