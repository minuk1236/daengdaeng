package dto;

public class BoardBean {
	private int noticeNum; // �� ��ȣ
	private int noticeType; // �� ����
	private String noticeTitle; // ����
	private String noticeContents; // ����
	private String noticeWirter; // �ۼ���
	private String noticeCreateDate; // �ۼ���
	private String noticeModifyDate; // ������
	private int noticeViewsnum; // ��ȸ��
	private String noticeFileName; // ���� �̸�
	private String noticeFileRealName; // ���� real �̸�
	public String getNoticeFileName() {
		return noticeFileName;
	}

	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}

	public String getNoticeFileRealName() {
		return noticeFileRealName;
	}

	public void setNoticeFileRealName(String noticeFileRealName) {
		this.noticeFileRealName = noticeFileRealName;
	}

	private String noticeFileurl; // ���� URL
	
	public BoardBean () {
		
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public int getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContents() {
		return noticeContents;
	}

	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}

	public String getNoticeWirter() {
		return noticeWirter;
	}

	public void setNoticeWirter(String noticeWirter) {
		this.noticeWirter = noticeWirter;
	}

	public String getNoticeCreateDate() {
		return noticeCreateDate;
	}

	public void setNoticeCreateDate(String noticeCreateDate) {
		this.noticeCreateDate = noticeCreateDate;
	}

	public String getNoticeModifyDate() {
		return noticeModifyDate;
	}

	public void setNoticeModifyDate(String noticeModifyDate) {
		this.noticeModifyDate = noticeModifyDate;
	}

	public int getNoticeViewsnum() {
		return noticeViewsnum;
	}

	public void setNoticeViewsnum(int noticeViewsnum) {
		this.noticeViewsnum = noticeViewsnum;
	}

	public String getNoticeFileurl() {
		return noticeFileurl;
	}

	public void setNoticeFileurl(String noticeFileurl) {
		this.noticeFileurl = noticeFileurl;
	}
	
}
