package hr.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.Salary_standardMapper;
import hr.pojo.Salary_standard;
import hr.service.Salary_standardService;
@Service
public class Salary_standardServiceImpl implements Salary_standardService{
	@Autowired
	private Salary_standardMapper sm = null;
	@Override
	public boolean addSalary_standard(Salary_standard salary_standard) {
		return sm.insertSalary_standard(salary_standard);
	}

	@Override
	public boolean removeSalary_standardById(int id) {
		return sm.deleteSalary_standardById(id);
	}

	@Override
	public List<Salary_standard> querySalary_standard() {
		return sm.getSalary_standard();
	}

	@Override
	public Salary_standard querySalary_standardById(int id) {
		return sm.selectSalary_standardById(id);
	}

	@Override
	public void modifySalary_standard(Salary_standard salary_standard) {
		sm.updateSalary_standard(salary_standard);
	}

	@Override
	public List<Salary_standard> querySalaryStandardCondition(HashMap<String, Object> map) {
		return sm.selectSalaryStandardCondition(map);
	}

}
