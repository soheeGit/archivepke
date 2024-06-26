package cart;

import java.util.Date;

public class Cart {
	private int cId;
	private String mId;
	private String pName;
	private Date cDate;
	
	public Cart(){}
	
	public Cart(int cId, String mId, Date cDate, String pName){
		super();
		this.cId=cId;
		this.mId=mId;
		this.pName=pName;
		this.cDate=cDate;
	}
	
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
}
