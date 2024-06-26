package bbs;

import java.util.Date;

public class Bbs {

    private int bId;
    private String bTitle;
    private String mId;
    private Date bDate;
    private String bContent;
    private int bAvailable;
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getbAvailable() {
		return bAvailable;
	}
	public void setbAvailable(int bAvailable) {
		this.bAvailable = bAvailable;
	}
}