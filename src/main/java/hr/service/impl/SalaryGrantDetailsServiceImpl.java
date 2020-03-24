package hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import hr.mapper.Salary_grant_detailsMapper;
import hr.pojo.Salary_grant_details;
import hr.service.SalaryGrantDetailsService;

@Service
public class SalaryGrantDetailsServiceImpl implements SalaryGrantDetailsService{
	@Autowired
	private Salary_grant_detailsMapper mapper = null;
	
	@Override
	public void saveSalary_grant_details(Salary_grant_details salary_grant_details) {
		mapper.insertSalary_grant_details(salary_grant_details);
	}

	@Override
	public void modifySalary_grant_details(Salary_grant_details salary_grant_details) {
		mapper.updateSalary_grant_details(salary_grant_details);
	}

	@Override
	public Salary_grant_details querySalary_grant_detailsById(int id) {
		return mapper.selectSalary_grant_detailsById(id);
	}

	@Override
	public List<Salary_grant_details> querySalary_grant_details() {
		return mapper.getSalary_grant_details();
	}

	@Override
	public boolean removeSalary_grant_detailsById(int sid) {
		return mapper.deleteSalary_grant_detailsById(sid);
	}

}
