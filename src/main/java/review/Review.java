package review;

import java.util.Date;

public class Review {
	private int rId;
	private String mId;
	private String mName;
	private String rPassword;
	private String rContent;
	private Date rCreatedat;
	private Date rUpdatedat;
	
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getrPassword() {
		return rPassword;
	}
	public void setrPassword(String rPassword) {
		this.rPassword = rPassword;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public Date getrCreatedat() {
		return rCreatedat;
	}
	public void setrCreatedat(Date rCreatedat) {
		this.rCreatedat = rCreatedat;
	}
	public Date getrUpdatedat() {
		return rUpdatedat;
	}
	public void setrUpdatedat(Date rUpdatedat) {
		this.rUpdatedat = rUpdatedat;
	}
	
	
}
