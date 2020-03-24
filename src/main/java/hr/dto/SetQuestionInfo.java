package hr.dto;

import java.io.Serializable;

public class SetQuestionInfo implements Serializable{
	
	private String first_question_kind_name;
	private String second_question_kind_name;
	private String question_amount;
	public String getFirst_question_kind_name() {
		return first_question_kind_name;
	}
	public void setFirst_question_kind_name(String first_question_kind_name) {
		this.first_question_kind_name = first_question_kind_name;
	}
	public String getSecond_question_kind_name() {
		return second_question_kind_name;
	}
	public void setSecond_question_kind_name(String second_question_kind_name) {
		this.second_question_kind_name = second_question_kind_name;
	}
	public String getQuestion_amount() {
		return question_amount;
	}
	public void setQuestion_amount(String question_amount) {
		this.question_amount = question_amount;
	}
	@Override
	public String toString() {
		return "SetQuestionInfo [first_question_kind_name=" + first_question_kind_name + ", second_question_kind_name="
				+ second_question_kind_name + ", question_amount=" + question_amount + "]";
	}
	
	
}
