package hr.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.Salary_grantMapper;
import hr.pojo.Salary_grant;
import hr.service.SalaryGrantService;

@Service
public class SalaryGrantServiceImpl implements SalaryGrantService{
	@Autowired
	private Salary_grantMapper mapper = null;

	@Override
	public void saveSalary_grant(Salary_grant salary_grant) {
		mapper.insertSalary_grant(salary_grant);
	}

	@Override
	public void modifySalary_grant(Salary_grant salary_grant) {
		mapper.updateSalary_grant(salary_grant);
	}

	@Override
	public Salary_grant querySalary_grantById(int id) {
		return mapper.selectSalary_grantById(id);
	}

	@Override
	public List<Salary_grant> querySalary_grant() {
		return mapper.getSalary_grant();
	}

	@Override
	public boolean removeSalary_grantById(int sid) {
		return mapper.deleteSalary_grantById(sid);
	}

	@Override
	public Integer querySalaryGrantCount() {
		return mapper.selectSalaryGrantCount();
	}

	@Override
	public Timestamp querySalaryGrantMaxTime() {
		return mapper.selectSalaryGrantMaxTime();
	}

}
