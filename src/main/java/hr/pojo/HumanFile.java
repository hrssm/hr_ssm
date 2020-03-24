package hr.pojo;

import java.io.Serializable;
import java.sql.Timestamp;

public class HumanFile implements Serializable{
	private int huf_id;//id
	private String human_id;//人员id
	private String first_kind_id;//一级机构种类id
	private String first_kind_name;//一级机构种类名字
	private String second_kind_id;//二级机构种类id
	private String second_kind_name;//二级机构种类名字
	private String third_kind_id;//三级机构种类id
	private String third_kind_name;//三级机构种类名字
	private String human_name;//人员姓名
	private String human_address;//住址
	private String human_postcode;//邮政编码
	private String human_pro_designation;//委任
	private String human_major_kind_id;//部门id
	private String human_major_kind_name;//部门名称
	private String human_major_id;//职位id
	private String hunma_major_name;//职位名称
	private String human_telephone;//联系电话
	private String human_mobilephone;//手机号码
	private String human_bank;//银行
	private String human_account;//账户
	private String human_qq;//qq
	private String human_email;//邮箱
	private String human_hobby;//业余爱好
	private String human_speciality;//专业
	private String human_sex;//性别
	private String human_religion;//宗教信仰
	private String human_party;//政治面貌
	private String human_nationality;	//国籍
	private String human_race;//种族
	private Timestamp human_birthday;	//生日
	private String human_birthplace;	//生源地
	private int human_age;//年龄
	private String human_educated_degree;//教育水平
	private int human_educated_years;//育龄
	private String human_educated_major;//教育专业
	private String human_society_security_id;//社会安全
	private String human_id_card;//身份证
	private String remark;//评论
	private String salary_standard_id;//薪资标准id
	private String salary_standard_name;//薪资标准名
	private double salary_sum;//总薪水
	private double demand_salaray_sum;//需求总额
	private double paid_salary_sum;//工资总额
	private int major_change_amount;//主要变更金额
	private int bonus_amount;//奖金金额
	private int training_amount;//培训金额
	private int file_chang_amount;//文件更改量
	private String human_histroy_records;//历史记录
	private String human_family_membership;//家庭成员
	private String human_picture;//照片
	private String attachment_name;//附件名称
	private int check_status;//审核状态
	private String register;//登记人
	private String checker;//审核人
	private String changer;//修改人
	private Timestamp regist_time;//登记时间
	private Timestamp check_time;//审核时间
	private Timestamp change_time;//修改时间
	private Timestamp lastly_change_time;//最后修改时间
	private Timestamp delete_time;//删除时间
	private Timestamp recovery_time;//恢复时间
	private int human_file_status;//文件状态
	public int getHuf_id() {
		return huf_id;
	}
	public void setHuf_id(int huf_id) {
		this.huf_id = huf_id;
	}
	public String getHuman_id() {
		return human_id;
	}
	public void setHuman_id(String human_id) {
		this.human_id = human_id;
	}
	public String getFirst_kind_id() {
		return first_kind_id;
	}
	public void setFirst_kind_id(String first_kind_id) {
		this.first_kind_id = first_kind_id;
	}
	public String getFirst_kind_name() {
		return first_kind_name;
	}
	public void setFirst_kind_name(String first_kind_name) {
		this.first_kind_name = first_kind_name;
	}
	public String getSecond_kind_id() {
		return second_kind_id;
	}
	public void setSecond_kind_id(String second_kind_id) {
		this.second_kind_id = second_kind_id;
	}
	public String getSecond_kind_name() {
		return second_kind_name;
	}
	public void setSecond_kind_name(String second_kind_name) {
		this.second_kind_name = second_kind_name;
	}
	public String getThird_kind_id() {
		return third_kind_id;
	}
	public void setThird_kind_id(String third_kind_id) {
		this.third_kind_id = third_kind_id;
	}
	public String getThird_kind_name() {
		return third_kind_name;
	}
	public void setThird_kind_name(String third_kind_name) {
		this.third_kind_name = third_kind_name;
	}
	public String getHuman_name() {
		return human_name;
	}
	public void setHuman_name(String human_name) {
		this.human_name = human_name;
	}
	public String getHuman_address() {
		return human_address;
	}
	public void setHuman_address(String human_address) {
		this.human_address = human_address;
	}
	public String getHuman_postcode() {
		return human_postcode;
	}
	public void setHuman_postcode(String human_postcode) {
		this.human_postcode = human_postcode;
	}
	public String getHuman_pro_designation() {
		return human_pro_designation;
	}
	public void setHuman_pro_designation(String human_pro_designation) {
		this.human_pro_designation = human_pro_designation;
	}
	public String getHuman_major_kind_id() {
		return human_major_kind_id;
	}
	public void setHuman_major_kind_id(String human_major_kind_id) {
		this.human_major_kind_id = human_major_kind_id;
	}
	public String getHuman_major_kind_name() {
		return human_major_kind_name;
	}
	public void setHuman_major_kind_name(String human_major_kind_name) {
		this.human_major_kind_name = human_major_kind_name;
	}
	public String getHuman_major_id() {
		return human_major_id;
	}
	public void setHuman_major_id(String human_major_id) {
		this.human_major_id = human_major_id;
	}
	public String getHunma_major_name() {
		return hunma_major_name;
	}
	public void setHunma_major_name(String hunma_major_name) {
		this.hunma_major_name = hunma_major_name;
	}
	public String getHuman_telephone() {
		return human_telephone;
	}
	public void setHuman_telephone(String human_telephone) {
		this.human_telephone = human_telephone;
	}
	public String getHuman_mobilephone() {
		return human_mobilephone;
	}
	public void setHuman_mobilephone(String human_mobilephone) {
		this.human_mobilephone = human_mobilephone;
	}
	public String getHuman_bank() {
		return human_bank;
	}
	public void setHuman_bank(String human_bank) {
		this.human_bank = human_bank;
	}
	public String getHuman_account() {
		return human_account;
	}
	public void setHuman_account(String human_account) {
		this.human_account = human_account;
	}
	public String getHuman_qq() {
		return human_qq;
	}
	public void setHuman_qq(String human_qq) {
		this.human_qq = human_qq;
	}
	public String getHuman_email() {
		return human_email;
	}
	public void setHuman_email(String human_email) {
		this.human_email = human_email;
	}
	public String getHuman_hobby() {
		return human_hobby;
	}
	public void setHuman_hobby(String human_hobby) {
		this.human_hobby = human_hobby;
	}
	public String getHuman_speciality() {
		return human_speciality;
	}
	public void setHuman_speciality(String human_speciality) {
		this.human_speciality = human_speciality;
	}
	public String getHuman_sex() {
		return human_sex;
	}
	public void setHuman_sex(String human_sex) {
		this.human_sex = human_sex;
	}
	public String getHuman_religion() {
		return human_religion;
	}
	public void setHuman_religion(String human_religion) {
		this.human_religion = human_religion;
	}
	public String getHuman_party() {
		return human_party;
	}
	public void setHuman_party(String human_party) {
		this.human_party = human_party;
	}
	public String getHuman_nationality() {
		return human_nationality;
	}
	public void setHuman_nationality(String human_nationality) {
		this.human_nationality = human_nationality;
	}
	public String getHuman_race() {
		return human_race;
	}
	public void setHuman_race(String human_race) {
		this.human_race = human_race;
	}
	public Timestamp getHuman_birthday() {
		return human_birthday;
	}
	public void setHuman_birthday(Timestamp human_birthday) {
		this.human_birthday = human_birthday;
	}
	public String getHuman_birthplace() {
		return human_birthplace;
	}
	public void setHuman_birthplace(String human_birthplace) {
		this.human_birthplace = human_birthplace;
	}
	public int getHuman_age() {
		return human_age;
	}
	public void setHuman_age(int human_age) {
		this.human_age = human_age;
	}
	public String getHuman_educated_degree() {
		return human_educated_degree;
	}
	public void setHuman_educated_degree(String human_educated_degree) {
		this.human_educated_degree = human_educated_degree;
	}
	public int getHuman_educated_years() {
		return human_educated_years;
	}
	public void setHuman_educated_years(int human_educated_years) {
		this.human_educated_years = human_educated_years;
	}
	public String getHuman_educated_major() {
		return human_educated_major;
	}
	public void setHuman_educated_major(String human_educated_major) {
		this.human_educated_major = human_educated_major;
	}
	public String getHuman_society_security_id() {
		return human_society_security_id;
	}
	public void setHuman_society_security_id(String human_society_security_id) {
		this.human_society_security_id = human_society_security_id;
	}
	public String getHuman_id_card() {
		return human_id_card;
	}
	public void setHuman_id_card(String human_id_card) {
		this.human_id_card = human_id_card;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getSalary_standard_id() {
		return salary_standard_id;
	}
	public void setSalary_standard_id(String salary_standard_id) {
		this.salary_standard_id = salary_standard_id;
	}
	public String getSalary_standard_name() {
		return salary_standard_name;
	}
	public void setSalary_standard_name(String salary_standard_name) {
		this.salary_standard_name = salary_standard_name;
	}
	public double getSalary_sum() {
		return salary_sum;
	}
	public void setSalary_sum(double salary_sum) {
		this.salary_sum = salary_sum;
	}
	public double getDemand_salaray_sum() {
		return demand_salaray_sum;
	}
	public void setDemand_salaray_sum(double demand_salaray_sum) {
		this.demand_salaray_sum = demand_salaray_sum;
	}
	public double getPaid_salary_sum() {
		return paid_salary_sum;
	}
	public void setPaid_salary_sum(double paid_salary_sum) {
		this.paid_salary_sum = paid_salary_sum;
	}
	public int getMajor_change_amount() {
		return major_change_amount;
	}
	public void setMajor_change_amount(int major_change_amount) {
		this.major_change_amount = major_change_amount;
	}
	public int getBonus_amount() {
		return bonus_amount;
	}
	public void setBonus_amount(int bonus_amount) {
		this.bonus_amount = bonus_amount;
	}
	public int getTraining_amount() {
		return training_amount;
	}
	public void setTraining_amount(int training_amount) {
		this.training_amount = training_amount;
	}
	public int getFile_chang_amount() {
		return file_chang_amount;
	}
	public void setFile_chang_amount(int file_chang_amount) {
		this.file_chang_amount = file_chang_amount;
	}
	public String getHuman_histroy_records() {
		return human_histroy_records;
	}
	public void setHuman_histroy_records(String human_histroy_records) {
		this.human_histroy_records = human_histroy_records;
	}
	public String getHuman_family_membership() {
		return human_family_membership;
	}
	public void setHuman_family_membership(String human_family_membership) {
		this.human_family_membership = human_family_membership;
	}
	public String getHuman_picture() {
		return human_picture;
	}
	public void setHuman_picture(String human_picture) {
		this.human_picture = human_picture;
	}
	public String getAttachment_name() {
		return attachment_name;
	}
	public void setAttachment_name(String attachment_name) {
		this.attachment_name = attachment_name;
	}
	public int getCheck_status() {
		return check_status;
	}
	public void setCheck_status(int check_status) {
		this.check_status = check_status;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getChecker() {
		return checker;
	}
	public void setChecker(String checker) {
		this.checker = checker;
	}
	public String getChanger() {
		return changer;
	}
	public void setChanger(String changer) {
		this.changer = changer;
	}
	public Timestamp getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(Timestamp regist_time) {
		this.regist_time = regist_time;
	}
	public Timestamp getCheck_time() {
		return check_time;
	}
	public void setCheck_time(Timestamp check_time) {
		this.check_time = check_time;
	}
	public Timestamp getChange_time() {
		return change_time;
	}
	public void setChange_time(Timestamp change_time) {
		this.change_time = change_time;
	}
	public Timestamp getLastly_change_time() {
		return lastly_change_time;
	}
	public void setLastly_change_time(Timestamp lastly_change_time) {
		this.lastly_change_time = lastly_change_time;
	}
	public Timestamp getDelete_time() {
		return delete_time;
	}
	public void setDelete_time(Timestamp delete_time) {
		this.delete_time = delete_time;
	}
	public Timestamp getRecovery_time() {
		return recovery_time;
	}
	public void setRecovery_time(Timestamp recovery_time) {
		this.recovery_time = recovery_time;
	}
	public int getHuman_file_status() {
		return human_file_status;
	}
	public void setHuman_file_status(int human_file_status) {
		this.human_file_status = human_file_status;
	}
	@Override
	public String toString() {
		return "HumanFile [huf_id=" + huf_id + ", human_id=" + human_id + ", first_kind_id=" + first_kind_id
				+ ", first_kind_name=" + first_kind_name + ", second_kind_id=" + second_kind_id + ", second_kind_name="
				+ second_kind_name + ", third_kind_id=" + third_kind_id + ", third_kind_name=" + third_kind_name
				+ ", human_name=" + human_name + ", human_address=" + human_address + ", human_postcode="
				+ human_postcode + ", human_pro_designation=" + human_pro_designation + ", human_major_kind_id="
				+ human_major_kind_id + ", human_major_kind_name=" + human_major_kind_name + ", human_major_id="
				+ human_major_id + ", hunma_major_name=" + hunma_major_name + ", human_telephone=" + human_telephone
				+ ", human_mobilephone=" + human_mobilephone + ", human_bank=" + human_bank + ", human_account="
				+ human_account + ", human_qq=" + human_qq + ", human_email=" + human_email + ", human_hobby="
				+ human_hobby + ", human_speciality=" + human_speciality + ", human_sex=" + human_sex
				+ ", human_religion=" + human_religion + ", human_party=" + human_party + ", human_nationality="
				+ human_nationality + ", human_race=" + human_race + ", human_birthday=" + human_birthday
				+ ", human_birthplace=" + human_birthplace + ", human_age=" + human_age + ", human_educated_degree="
				+ human_educated_degree + ", human_educated_years=" + human_educated_years + ", human_educated_major="
				+ human_educated_major + ", human_society_security_id=" + human_society_security_id + ", human_id_card="
				+ human_id_card + ", remark=" + remark + ", salary_standard_id=" + salary_standard_id
				+ ", salary_standard_name=" + salary_standard_name + ", salary_sum=" + salary_sum
				+ ", demand_salaray_sum=" + demand_salaray_sum + ", paid_salary_sum=" + paid_salary_sum
				+ ", major_change_amount=" + major_change_amount + ", bonus_amount=" + bonus_amount
				+ ", training_amount=" + training_amount + ", file_chang_amount=" + file_chang_amount
				+ ", human_histroy_records=" + human_histroy_records + ", human_family_membership="
				+ human_family_membership + ", human_picture=" + human_picture + ", attachment_name=" + attachment_name
				+ ", check_status=" + check_status + ", register=" + register + ", checker=" + checker + ", changer="
				+ changer + ", regist_time=" + regist_time + ", check_time=" + check_time + ", change_time="
				+ change_time + ", lastly_change_time=" + lastly_change_time + ", delete_time=" + delete_time
				+ ", recovery_time=" + recovery_time + ", human_file_status=" + human_file_status + "]";
	}
	
}
