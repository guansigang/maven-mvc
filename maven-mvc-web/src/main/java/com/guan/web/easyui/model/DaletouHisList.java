package com.guan.web.easyui.model;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
@Alias("DaletouHisList")
public class DaletouHisList {
	String daletou_id;
	String daletou_no;
	Date open_date;
	String week_date;
	int front_one;
	int front_sec;
	int front_third;
	int front_four;
	int front_five;
	int back_one;
	int back_sec;
	int first_diff;
	int sec_diff;
	int thir_diff;
	int four_diff;
	int five_diff;
	BigDecimal in_all_money;
	int first_num;
	BigDecimal first_money;
	int sec_num;
	BigDecimal sec_money;
	BigDecimal all_money;
	public String getDaletou_id() {
		return daletou_id;
	}
	public void setDaletou_id(String daletou_id) {
		this.daletou_id = daletou_id;
	}
	public String getDaletou_no() {
		return daletou_no;
	}
	public void setDaletou_no(String daletou_no) {
		this.daletou_no = daletou_no;
	}
	/*public Date getOpen_date() {
		return open_date;
	}*/
	
	public String getOpen_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(open_date==null){
			return "--";
		}else{
			return sdf.format(open_date);
		}
		
	}
	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	public String getWeek_date() {
		return week_date;
	}
	public void setWeek_date(String week_date) {
		this.week_date = week_date;
	}
	public int getFront_one() {
		return front_one;
	}
	public void setFront_one(int front_one) {
		this.front_one = front_one;
	}
	public int getFront_sec() {
		return front_sec;
	}
	public void setFront_sec(int front_sec) {
		this.front_sec = front_sec;
	}
	public int getFront_third() {
		return front_third;
	}
	public void setFront_third(int front_third) {
		this.front_third = front_third;
	}
	public int getFront_four() {
		return front_four;
	}
	public void setFront_four(int front_four) {
		this.front_four = front_four;
	}
	public int getFront_five() {
		return front_five;
	}
	public void setFront_five(int front_five) {
		this.front_five = front_five;
	}
	public int getBack_one() {
		return back_one;
	}
	public void setBack_one(int back_one) {
		this.back_one = back_one;
	}
	public int getBack_sec() {
		return back_sec;
	}
	public void setBack_sec(int back_sec) {
		this.back_sec = back_sec;
	}
	public BigDecimal getIn_all_money() {
		return in_all_money;
	}
	public void setIn_all_money(BigDecimal in_all_money) {
		this.in_all_money = in_all_money;
	}
	public int getFirst_num() {
		return first_num;
	}
	public void setFirst_num(int first_num) {
		this.first_num = first_num;
	}
	public BigDecimal getFirst_money() {
		return first_money;
	}
	public void setFirst_money(BigDecimal first_money) {
		this.first_money = first_money;
	}
	public int getSec_num() {
		return sec_num;
	}
	public void setSec_num(int sec_num) {
		this.sec_num = sec_num;
	}
	public BigDecimal getSec_money() {
		return sec_money;
	}
	public void setSec_money(BigDecimal sec_money) {
		this.sec_money = sec_money;
	}
	public BigDecimal getAll_money() {
		return all_money;
	}
	public void setAll_money(BigDecimal all_money) {
		this.all_money = all_money;
	}
	public int getFirst_diff() {
		return front_sec-front_one;
	}
	public void setFirst_diff(int first_diff) {
		this.first_diff = first_diff;
	}
	public int getSec_diff() {
		return front_third-front_sec;
	}
	public void setSec_diff(int sec_diff) {
		this.sec_diff = sec_diff;
	}
	public int getThir_diff() {
		return front_four-front_third;
	}
	public void setThir_diff(int thir_diff) {
		this.thir_diff = thir_diff;
	}
	public int getFour_diff() {
		return front_five-front_four;
	}
	public void setFour_diff(int four_diff) {
		this.four_diff = four_diff;
	}
	public int getFive_diff() {
		return back_sec-back_one;
	}
	public void setFive_diff(int five_diff) {
		this.five_diff = five_diff;
	}
}
