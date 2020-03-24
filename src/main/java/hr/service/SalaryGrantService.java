package hr.service;

import java.sql.Timestamp;
import java.util.List;

import hr.pojo.Salary_grant;

public interface SalaryGrantService {
	public void saveSalary_grant(Salary_grant salary_grant);
	public void modifySalary_grant(Salary_grant salary_grant);
	public Salary_grant querySalary_grantById(int id);
	public List<Salary_grant> querySalary_grant();
	public boolean removeSalary_grantById(int sid);
	public Integer querySalaryGrantCount();
	public Timestamp querySalaryGrantMaxTime();
}
