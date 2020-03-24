package hr.dto;

import java.io.Serializable;

public class TestPaperInfo implements Serializable{
	private String major_kind_name;
	private String major_name;
	private String testPaperCount;
	private String register;
	private String timeLimit;
	
	public String getMajor_kind_name() {
		return major_kind_name;
	}
	public void setMajor_kind_name(String major_kind_name) {
		this.major_kind_name = major_kind_name;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public String getTestPaperCount() {
		return testPaperCount;
	}
	public void setTestPaperCount(String testPaperCount) {
		this.testPaperCount = testPaperCount;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getTimeLimit() {
		return timeLimit;
	}
	public void setTimeLimit(String timeLimit) {
		this.timeLimit = timeLimit;
	}
	
	@Override
	public String toString() {
		return "SetQuestionInfo [major_kind_name=" + major_kind_name + ", major_name=" + major_name
				+ ", testPaperCount=" + testPaperCount + ", register=" + register + ", timeLimit=" + timeLimit
				+  "]";
	}
	
	
}
