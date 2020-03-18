package hr.pojo;

import java.io.Serializable;
/**
 * 职位
 * @author xyw
 *
 */
public class ConfigMajor implements Serializable{
	private int mak_id;//部门_职位id
	private String major_kind_id;//部门id
	private String major_kind_name;//部门名称
	private String major_id;//职位id
	private String major_name;//职位名称
	private int test_amount;//测试量
	public int getMak_id() {
		return mak_id;
	}
	public void setMak_id(int mak_id) {
		this.mak_id = mak_id;
	}
	public String getMajor_kind_id() {
		return major_kind_id;
	}
	public void setMajor_kind_id(String major_kind_id) {
		this.major_kind_id = major_kind_id;
	}
	public String getMajor_kind_name() {
		return major_kind_name;
	}
	public void setMajor_kind_name(String major_kind_name) {
		this.major_kind_name = major_kind_name;
	}
	public String getMajor_id() {
		return major_id;
	}
	public void setMajor_id(String major_id) {
		this.major_id = major_id;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public int getTest_amount() {
		return test_amount;
	}
	public void setTest_amount(int test_amount) {
		this.test_amount = test_amount;
	}
}
