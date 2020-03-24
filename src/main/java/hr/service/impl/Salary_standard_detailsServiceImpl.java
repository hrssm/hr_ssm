package hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.Salary_standard_detailsMapper;
import hr.pojo.Salary_standard_details;
import hr.service.Salary_standard_detailsService;
@Service
public class Salary_standard_detailsServiceImpl implements Salary_standard_detailsService{
	@Autowired
	private Salary_standard_detailsMapper ssdm = null;
	@Override
	public boolean addSalary_standard_details(Salary_standard_details salary_standard_details) {
		return ssdm.insertSalary_standard_details(salary_standard_details);
	}

	@Override
	public boolean removeSalary_standard_detailsById(int id) {
		return ssdm.deleteSalary_standard_detailsById(id);
	}

	@Override
	public List<Salary_standard_details> querySalary_standard_details() {
		return ssdm.getSalary_standard_details();
	}

	@Override
	public Salary_standard_details querySalary_standard_detailsById(int id) {
		return ssdm.selectSalary_standard_detailsById(id);
	}

	@Override
	public void modifySalary_standard_details(Salary_standard_details salary_standard_details) {
		ssdm.updateSalary_standard_details(salary_standard_details);
	}

	@Override
	public boolean modifySalaryStandardDetailsByItemID(Salary_standard_details salary_standard_details) {
		return ssdm.updateSalaryStandardDetailsByItemID(salary_standard_details);
	}

	@Override
	public List<Salary_standard_details> querySalary_standard_detailsByStandardId(String sid) {
		return ssdm.selectSalary_standard_detailsByStandardId(sid);
	}

}
